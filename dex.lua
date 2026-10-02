local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Dex = {}
local gui, tree, props
local open = false

function Dex.Create()
    if gui then return end
    gui = Instance.new("ScreenGui")
    gui.Name = "StigmaDex"
    gui.ResetOnSpawn = false
    gui.Parent = LP:WaitForChild("PlayerGui")

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 720, 0, 480)
    main.Position = UDim2.new(0.5, -360, 0.5, -240)
    main.BackgroundColor3 = Color3.fromRGB(25,25,25)
    main.BorderSizePixel = 0
    main.Parent = gui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 32)
    title.BackgroundColor3 = Color3.fromRGB(35,35,35)
    title.Text = "  Stigma Dex Explorer"
    title.TextColor3 = Color3.new(1,1,1)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.Parent = main

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0, 32, 0, 32)
    close.Position = UDim2.new(1, -32, 0, 0)
    close.BackgroundColor3 = Color3.fromRGB(180,40,40)
    close.Text = "X"
    close.TextColor3 = Color3.new(1,1,1)
    close.Parent = main
    close.MouseButton1Click:Connect(function() Dex.Close() end)

    tree = Instance.new("ScrollingFrame")
    tree.Size = UDim2.new(0.55, -12, 1, -48)
    tree.Position = UDim2.new(0, 8, 0, 40)
    tree.BackgroundColor3 = Color3.fromRGB(30,30,30)
    tree.ScrollBarThickness = 4
    tree.Parent = main
    Instance.new("UIListLayout", tree).Padding = UDim.new(0, 2)

    props = Instance.new("ScrollingFrame")
    props.Size = UDim2.new(0.45, -12, 1, -48)
    props.Position = UDim2.new(0.55, 4, 0, 40)
    props.BackgroundColor3 = Color3.fromRGB(30,30,30)
    props.ScrollBarThickness = 4
    props.Parent = main
    Instance.new("UIListLayout", props).Padding = UDim.new(0, 2)
end

local function addNode(obj, parentFrame, depth)
    depth = depth or 0
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -depth*12, 0, 22)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.Text = string.rep("  ", depth) .. obj.ClassName .. " - " .. obj.Name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = parentFrame
    btn.MouseButton1Click:Connect(function()
        Dex.ShowProperties(obj)
    end)
    for _,child in ipairs(obj:GetChildren()) do
        addNode(child, parentFrame, depth+1)
    end
end

function Dex.ShowProperties(obj)
    for _,c in ipairs(props:GetChildren()) do
        if c:IsA("TextLabel") then c:Destroy() end
    end
    local function add(name, value)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, -8, 0, 20)
        l.BackgroundTransparency = 1
        l.Text = name .. " = " .. tostring(value)
        l.TextColor3 = Color3.new(0.9,0.9,0.9)
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = props
    end
    add("Class", obj.ClassName)
    add("Name", obj.Name)
    add("Path", obj:GetFullName())
    pcall(function() add("Parent", obj.Parent and obj.Parent.Name or "nil") end)
end

function Dex.Refresh()
    for _,c in ipairs(tree:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
    addNode(game, tree, 0)
    tree.CanvasSize = UDim2.new(0, 0, 0, #tree:GetChildren()*24)
end

function Dex.Open()
    Dex.Create()
    Dex.Refresh()
    gui.Enabled = true
    open = true
end

function Dex.Close()
    if gui then gui.Enabled = false end
    open = false
end

function Dex.IsOpen() return open end
return Dex
