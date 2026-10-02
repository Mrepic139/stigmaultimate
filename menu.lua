local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Menu = {}
local screenGui, frame, list
local isOpen = false
local onSelect = nil

local function create()
    if screenGui then return end
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SEP_SelectMenu"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LP:WaitForChild("PlayerGui")

    frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(28,28,28)
    frame.BorderSizePixel = 0
    frame.Visible = false
    frame.Parent = screenGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 32)
    title.BackgroundColor3 = Color3.fromRGB(40,40,40)
    title.Text = "  Functions Menu"
    title.TextColor3 = Color3.new(1,1,1)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0, 32, 0, 32)
    close.Position = UDim2.new(1, -32, 0, 0)
    close.BackgroundColor3 = Color3.fromRGB(180,40,40)
    close.Text = "X"
    close.TextColor3 = Color3.new(1,1,1)
    close.Parent = frame
    close.MouseButton1Click:Connect(function() Menu.Close() end)

    list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(1, -16, 1, -48)
    list.Position = UDim2.new(0, 8, 0, 40)
    list.BackgroundTransparency = 1
    list.ScrollBarThickness = 4
    list.Parent = frame
    Instance.new("UIListLayout", list).Padding = UDim.new(0, 4)
end

function Menu.Open(items, callback)
    create()
    onSelect = callback
    isOpen = true
    frame.Visible = true
    for _,c in ipairs(list:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
    for _,name in ipairs(items) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 28)
        btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
        btn.Text = name
        btn.TextColor3 = Color3.new(1,1,1)
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = list
        btn.MouseButton1Click:Connect(function()
            if onSelect then onSelect(name) end
            Menu.Close()
        end)
    end
    list.CanvasSize = UDim2.new(0, 0, 0, #items * 32)
end

function Menu.Close()
    isOpen = false
    if frame then frame.Visible = false end
end

function Menu.IsOpen() return isOpen end
return Menu
