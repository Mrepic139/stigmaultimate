local API = {}
local Scanner, Functions, foundCache = nil, nil, {}

function API.Init(scannerModule, functionsModule)
    Scanner = scannerModule
    Functions = functionsModule
end

function API.Scan(opts)
    foundCache = Scanner.Scan(opts or {liveTest=true, maxTests=50})
    return foundCache
end

function API.GetFound() return foundCache end
function API.GetHigh(min) return Scanner.GetHigh(foundCache, min) end
function API.GetAccepted() return Scanner.GetAccepted(foundCache) end
function API.Count() return Scanner.Count(foundCache) end

function API.ExecuteSS(payload)
    if not payload or payload == "" or payload == "SON" then return false, 0, 0 end
    if #foundCache == 0 then return false, 0, 0 end
    local success, tried = 0, 0
    local LP = game.Players.LocalPlayer
    for _,v in ipairs(foundCache) do
        if v.type == "RemoteEvent" and v.obj then
            tried += 1
            local ok = pcall(function()
                v.obj:FireServer(payload)
                v.obj:FireServer(payload, LP)
                v.obj:FireServer({code=payload})
                v.obj:FireServer("execute", payload)
                v.obj:FireServer("run", payload)
                v.obj:FireServer("loadstring", payload)
            end)
            if ok then success += 1 end
        elseif v.type == "RemoteFunction" and v.obj then
            tried += 1
            local ok = pcall(function()
                v.obj:InvokeServer(payload)
                v.obj:InvokeServer(payload, LP)
                v.obj:InvokeServer({code=payload})
                v.obj:InvokeServer("execute", payload)
            end)
            if ok then success += 1 end
        end
    end
    return success > 0, success, tried
end

function API.CallFunction(name, ...)
    if Functions and Functions[name] then return Functions[name](...) end
    return nil, "not found"
end

function API.ListFunctions()
    if not Functions then return {} end
    local list = {}
    for k,_ in pairs(Functions) do table.insert(list, k) end
    table.sort(list)
    return list
end

return API
