local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Scanner = {}
local antiKickConnections = {}

local function enableAntiKick()
    local function protect(remote)
        if not remote or not remote:IsA("RemoteEvent") then return end
        local n = string.lower(remote.Name)
        if string.find(n,"kick") or string.find(n,"ban") or string.find(n,"punish") or string.find(n,"crash") then
            local c = remote.OnClientEvent:Connect(function() end)
            table.insert(antiKickConnections, c)
        end
    end
    for _,o in ipairs(game:GetDescendants()) do pcall(protect,o) end
end

local function disableAntiKick()
    for _,c in ipairs(antiKickConnections) do pcall(function() c:Disconnect() end) end
    antiKickConnections = {}
end

Scanner.Keywords = {
    "admin","ban","kick","kill","give","cash","money","coins","weapon","gun","tool",
    "exploit","backdoor","ss","server","execute","loadstring","require","script","cmd",
    "command","mod","owner","dev","hack","inject","run","code","lua","fire","invoke",
    "remote","event","func","handler","load","string","print","warn","error","set","get",
    "data","save","player","char","humanoid","teleport","tp","fly","speed","jump","god",
    "noclip","infinite","ammo","health","damage","hit","punch","attack","ability","skill",
    "power","log","report","webhook","http","request","post","api","bridge","proxy","core",
    "system","manager","controller","service","module","lib","util","helper","handler"
}

local function scoreName(name)
    name = string.lower(name or "")
    local score = 30
    for _,kw in ipairs(Scanner.Keywords) do
        if string.find(name,kw) then score = score + 11 end
    end
    if string.find(name,"ss") or string.find(name,"backdoor") or string.find(name,"execute") then score = score + 40 end
    if string.find(name,"admin") or string.find(name,"mod") or string.find(name,"owner") then score = score + 30 end
    if string.find(name,"kick") or string.find(name,"ban") then score = score + 22 end
    return math.clamp(score,0,100)
end

local function safeTest(remote)
    local r = {accepted=false,error=nil}
    local ok,err = pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer()
            remote:FireServer("test")
            remote:FireServer({t=1})
            remote:FireServer("execute","print(1)")
        elseif remote:IsA("RemoteFunction") then
            remote:InvokeServer()
            remote:InvokeServer("test")
            remote:InvokeServer({t=1})
        end
    end)
    r.accepted = ok
    if not ok then r.error = tostring(err) end
    return r
end

local function scanObj(obj,results)
    if not obj then return end
    local class,name,path = obj.ClassName,obj.Name,obj:GetFullName()
    if class == "RemoteEvent" or class == "RemoteFunction" then
        table.insert(results,{type=class,name=name,path=path,obj=obj,score=scoreName(name),tested=false,live=nil})
    elseif class == "ModuleScript" and scoreName(name) >= 48 then
        table.insert(results,{type="ModuleScript",name=name,path=path,obj=obj,score=scoreName(name),tested=false,live=nil})
    elseif (class=="BindableEvent" or class=="BindableFunction") and scoreName(name) >= 55 then
        table.insert(results,{type=class,name=name,path=path,obj=obj,score=scoreName(name),tested=false,live=nil})
    end
end

local function deep(obj,results)
    scanObj(obj,results)
    for _,c in ipairs(obj:GetChildren()) do pcall(deep,c,results) end
end

function Scanner.Scan(opts)
    opts = opts or {}
    local liveTest = opts.liveTest ~= false
    local maxTests = opts.maxTests or 50
    enableAntiKick()
    local results = {}
    local roots = {
        ReplicatedStorage,workspace,game.Lighting,game.Players,
        game.StarterGui,game.StarterPack,game.StarterPlayer,
        game.SoundService,game.Chat,game.Teams,game.TestService
    }
    pcall(function() table.insert(roots,game:GetService("ServerStorage")) end)
    pcall(function() table.insert(roots,game:GetService("ServerScriptService")) end)
    for _,r in ipairs(roots) do pcall(deep,r,results) end
    for _,plr in ipairs(Players:GetPlayers()) do
        pcall(function()
            if plr.Character then deep(plr.Character,results) end
            if plr:FindFirstChild("Backpack") then deep(plr.Backpack,results) end
            if plr:FindFirstChild("PlayerGui") then deep(plr.PlayerGui,results) end
            if plr:FindFirstChild("PlayerScripts") then deep(plr.PlayerScripts,results) end
        end)
    end
    table.sort(results,function(a,b) return a.score > b.score end)
    if liveTest then
        local tested = 0
        for _,e in ipairs(results) do
            if tested >= maxTests then break end
            if e.type == "RemoteEvent" or e.type == "RemoteFunction" then
                e.live = safeTest(e.obj)
                e.tested = true
                tested += 1
                task.wait(0.025)
            end
        end
    end
    disableAntiKick()
    return results
end

function Scanner.GetHigh(results,min)
    min = min or 70
    local t = {}
    for _,v in ipairs(results) do if v.score >= min then table.insert(t,v) end end
    return t
end

function Scanner.GetAccepted(results)
    local t = {}
    for _,v in ipairs(results) do if v.tested and v.live and v.live.accepted then table.insert(t,v) end end
    return t
end

function Scanner.Count(results)
    local c = {}
    for _,v in ipairs(results) do c[v.type] = (c[v.type] or 0) + 1 end
    return c
end

return Scanner
