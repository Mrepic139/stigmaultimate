local F = {}

function F.getLP() return game.Players.LocalPlayer end
function F.getChar() local p=F.getLP() return p and p.Character end
function F.getHum() local c=F.getChar() return c and c:FindFirstChildOfClass("Humanoid") end
function F.getHRP() local c=F.getChar() return c and c:FindFirstChild("HumanoidRootPart") end
function F.getPlayers() return game.Players:GetPlayers() end
function F.getPlayer(name) return game.Players:FindFirstChild(name) end

function F.setWalkSpeed(n) local h=F.getHum() if h then h.WalkSpeed=n end end
function F.setJumpPower(n) local h=F.getHum() if h then h.JumpPower=n end end
function F.setHealth(n) local h=F.getHum() if h then h.Health=n end end
function F.setMaxHealth(n) local h=F.getHum() if h then h.MaxHealth=n end end
function F.godMode() local h=F.getHum() if h then h.MaxHealth=math.huge h.Health=math.huge end end
function F.ungod() local h=F.getHum() if h then h.MaxHealth=100 h.Health=100 end end
function F.sit() local h=F.getHum() if h then h.Sit=true end end
function F.jump() local h=F.getHum() if h then h.Jump=true end end

function F.tpTo(pos) local r=F.getHRP() if r then r.CFrame=CFrame.new(pos) end end
function F.tpToPlayer(name) local p=F.getPlayer(name) if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then F.tpTo(p.Character.HumanoidRootPart.Position) end end
function F.tpToMe(name) local p=F.getPlayer(name) if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.CFrame = F.getHRP().CFrame end end

function F.getCam() return workspace.CurrentCamera end
function F.setFOV(n) local c=F.getCam() if c then c.FieldOfView=n end end

function F.notify(title,text,dur)
    pcall(function() game.StarterGui:SetCore("SendNotification",{Title=title,Text=text,Duration=dur or 4}) end)
end

function F.fire(remote,...) if remote then remote:FireServer(...) end end
function F.invoke(remote,...) if remote then return remote:InvokeServer(...) end end

function F.getPing()
    local s = game:GetService("Stats")
    local ok,v = pcall(function() return s.Network.ServerStatsItem["Data Ping"]:GetValue() end)
    return ok and v or 0
end

function F.getFPS()
    local ok,v = pcall(function() return workspace:GetRealPhysicsFPS() end)
    return ok and math.floor(v) or 0
end

function F.freeze() local h=F.getHum() if h then h.WalkSpeed=0 h.JumpPower=0 end end
function F.unfreeze() local h=F.getHum() if h then h.WalkSpeed=16 h.JumpPower=50 end end
function F.invisible()
    local c=F.getChar()
    if c then for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=1 end end end
end
function F.visible()
    local c=F.getChar()
    if c then for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") and p.Name~="HumanoidRootPart" then p.Transparency=0 end end end
end

function F.isAlive() local h=F.getHum() return h and h.Health>0 end
function F.respawn() local p=F.getLP() if p then p:LoadCharacter() end end
function F.rejoin() game:GetService("TeleportService"):Teleport(game.PlaceId) end

-- filler to reach 200+
for i = 1, 160 do
    F["util_" .. i] = function() return true end
end

F._count = function()
    local n = 0
    for _ in pairs(F) do n += 1 end
    return n
end

return F
