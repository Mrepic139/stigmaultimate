--[[
    Stigma Ultimate - Main Panel
    Same UI + full system wired
]]

local Players           = game:GetService("Players")
local StarterGui        = game:GetService("StarterGui")
local UserInputService  = game:GetService("UserInputService")
local LP                = Players.LocalPlayer

-- modules
local Scanner     = require(script.Parent.scanner)
local API         = require(script.Parent.api)
local Functions   = require(script.Parent.functions)
local Menu        = require(script.Parent.menu)
local Dex         = require(script.Parent.dex)
local Decompiler  = require(script.Parent.decompiler)

API.Init(Scanner, Functions)

local foundVulns = {}

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5,
            Button1 = "OK"
        })
    end)
end

-- ═══════════════════════════════════════
-- GUI (exact same look + extra buttons)
-- ═══════════════════════════════════════
local gui = {
    ScreenGui = Instance.new("ScreenGui"),
    MAIN      = Instance.new("Frame"),
    topbar    = Instance.new("Frame"),
    title     = Instance.new("TextLabel"),
    logo      = Instance.new("ImageLabel"),
    TextBox   = Instance.new("TextBox"),
    Execute   = Instance.new("TextButton"),
    Clear     = Instance.new("TextButton"),
    Scan      = Instance.new("ImageButton"),
    Close     = Instance.new("TextButton"),
    DexBtn    = Instance.new("TextButton"),
    MenuBtn   = Instance.new("TextButton"),
}

gui.ScreenGui.Parent = LP:WaitForChild("PlayerGui")
gui.MAIN.Parent      = gui.ScreenGui
gui.topbar.Parent    = gui.MAIN
gui.title.Parent     = gui.topbar
gui.logo.Parent      = gui.topbar
gui.TextBox.Parent   = gui.MAIN
gui.Execute.Parent   = gui.MAIN
gui.Clear.Parent     = gui.MAIN
gui.Scan.Parent      = gui.MAIN
gui.Close.Parent     = gui.topbar
gui.DexBtn.Parent    = gui.MAIN
gui.MenuBtn.Parent   = gui.MAIN

gui.ScreenGui.Name = "PROHAXScreenGui"
gui.ScreenGui.ResetOnSpawn = true

gui.MAIN.Name = "MAIN"
gui.MAIN.Position = UDim2.new(0.370499432, 0, 0.377276659, 0)
gui.MAIN.Size = UDim2.new(0, 573, 0, 407)
gui.MAIN.BackgroundColor3 = Color3.fromRGB(48,48,48)
gui.MAIN.BorderSizePixel = 0

gui.topbar.Name = "topbar"
gui.topbar.Position = UDim2.new(0, 0, -0.0761670768, 0)
gui.topbar.Size = UDim2.new(0, 573, 0, 31)
gui.topbar.BackgroundColor3 = Color3.fromRGB(255,255,255)
gui.topbar.BorderSizePixel = 0

gui.title.Name = "title"
gui.title.Position = UDim2.new(0.0383944139, 0, 0.0967741907, 0)
gui.title.Size = UDim2.new(0, 151, 0, 25)
gui.title.BackgroundTransparency = 1
gui.title.Text = "Secret Exploting panel"
gui.title.TextScaled = true
gui.title.TextColor3 = Color3.fromRGB(0,0,0)

gui.logo.Name = "logo"
gui.logo.Position = UDim2.new(-0.012216405, 0, -0.0967741907, 0)
gui.logo.Size = UDim2.new(0, 37, 0, 34)
gui.logo.BackgroundTransparency = 1
gui.logo.Image = "rbxassetid://76499234772636"

gui.TextBox.Name = "TextBox"
gui.TextBox.Position = UDim2.new(0, 0, 0.0417690426, 0)
gui.TextBox.Size = UDim2.new(0, 500, 0, 261)
gui.TextBox.BackgroundColor3 = Color3.fromRGB(44,44,44)
gui.TextBox.Text = "SON"
gui.TextBox.TextColor3 = Color3.fromRGB(203,203,203)
gui.TextBox.TextSize = 14
gui.TextBox.TextXAlignment = Enum.TextXAlignment.Left
gui.TextBox.TextYAlignment = Enum.TextYAlignment.Top
gui.TextBox.ClearTextOnFocus = true
gui.TextBox.MultiLine = true
gui.TextBox.TextWrapped = true

gui.Execute.Name = "Execute"
gui.Execute.Position = UDim2.new(0.012216405, 0, 0.742014766, 0)
gui.Execute.Size = UDim2.new(0, 200, 0, 50)
gui.Execute.BackgroundColor3 = Color3.fromRGB(85,255,0)
gui.Execute.Text = "Execute"
gui.Execute.TextScaled = true
gui.Execute.Font = Enum.Font.SourceSansBold
gui.Execute.TextColor3 = Color3.fromRGB(0,0,0)

gui.Clear.Name = "ClearTextboxt"
gui.Clear.Position = UDim2.new(0.41186735, 0, 0.742014766, 0)
gui.Clear.Size = UDim2.new(0, 200, 0, 50)
gui.Clear.BackgroundColor3 = Color3.fromRGB(85,255,0)
gui.Clear.Text = "Clear"
gui.Clear.TextScaled = true
gui.Clear.Font = Enum.Font.SourceSansBold
gui.Clear.TextColor3 = Color3.fromRGB(0,0,0)

gui.Scan.Name = "injectaka scan all the game"
gui.Scan.Position = UDim2.new(0.797556698, 0, 0.712530732, 0)
gui.Scan.Size = UDim2.new(0, 109, 0, 105)
gui.Scan.BackgroundTransparency = 1
gui.Scan.Image = "rbxassetid://122388354733007"

gui.Close.Name = "Close"
gui.Close.Position = UDim2.new(1, -32, 0, 0)
gui.Close.Size = UDim2.new(0, 32, 0, 31)
gui.Close.BackgroundColor3 = Color3.fromRGB(220,50,50)
gui.Close.Text = "X"
gui.Close.TextScaled = true
gui.Close.Font = Enum.Font.SourceSansBold
gui.Close.TextColor3 = Color3.fromRGB(255,255,255)
gui.Close.BorderSizePixel = 0

-- extra buttons
gui.DexBtn.Name = "DexBtn"
gui.DexBtn.Position = UDim2.new(0.012, 0, 0.88, 0)
gui.DexBtn.Size = UDim2.new(0, 120, 0, 28)
gui.DexBtn.BackgroundColor3 = Color3.fromRGB(60,60,180)
gui.DexBtn.Text = "Open Dex"
gui.DexBtn.TextColor3 = Color3.new(1,1,1)
gui.DexBtn.Font = Enum.Font.SourceSansBold

gui.MenuBtn.Name = "MenuBtn"
gui.MenuBtn.Position = UDim2.new(0.25, 0, 0.88, 0)
gui.MenuBtn.Size = UDim2.new(0, 140, 0, 28)
gui.MenuBtn.BackgroundColor3 = Color3.fromRGB(60,120,60)
gui.MenuBtn.Text = "Functions Menu"
gui.MenuBtn.TextColor3 = Color3.new(1,1,1)
gui.MenuBtn.Font = Enum.Font.SourceSansBold

-- ═══════════════════════════════════════
-- EVENTS
-- ═══════════════════════════════════════
gui.Scan.MouseButton1Click:Connect(function()
    notify("Scanning", "Ultimate long scan running…", 4)
    task.spawn(function()
        local results = API.Scan({liveTest = true, maxTests = 50})
        foundVulns = results
        if #results > 0 then
            notify("Vuln Founded", #results .. " possible SS vector(s)", 6)
        else
            notify("Vuln Not Founded", "No clear SS vulnerabilities", 5)
        end
    end)
end)

gui.Execute.MouseButton1Click:Connect(function()
    local payload = gui.TextBox.Text
    notify("Executing...", "Pushing payload…", 3)
    local ok, success, tried = API.ExecuteSS(payload)
    task.wait(0.3)
    if ok then
        notify("Worked", "Tried " .. tostring(tried) .. " • " .. tostring(success) .. " accepted", 5)
    else
        notify("Failed", "Tried " .. tostring(tried) .. " remotes – none accepted", 5)
    end
end)

gui.Clear.MouseButton1Click:Connect(function()
    gui.TextBox.Text = ""
    notify("Cleared", "TextBox wiped", 2)
end)

gui.Close.MouseButton1Click:Connect(function()
    gui.ScreenGui:Destroy()
end)

gui.DexBtn.MouseButton1Click:Connect(function()
    Dex.Open()
end)

gui.MenuBtn.MouseButton1Click:Connect(function()
    local list = API.ListFunctions()
    Menu.Open(list, function(name)
        notify("Selected", name, 3)
        API.CallFunction(name)
    end)
end)

-- drag
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    gui.MAIN.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.topbar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = gui.MAIN.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

gui.topbar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)
