-- FRVGMXNT GUI2LUA CONVERTER 1.2. Like pls!
local PROHAXScreenGui = {
	PROHAXScreenGui = Instance.new("ScreenGui"),
	MAIN = Instance.new("Frame"),
	topbar = Instance.new("Frame"),
	title = Instance.new("TextLabel"),
	logo = Instance.new("ImageLabel"),
	TextBox = Instance.new("TextBox"),
	Execute = Instance.new("TextButton"),
	ClearTextboxt = Instance.new("TextButton"),
	injectaka_scan_all_the_game = Instance.new("ImageButton"),
	Close = Instance.new("TextButton"),
}

PROHAXScreenGui.PROHAXScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PROHAXScreenGui.MAIN.Parent = PROHAXScreenGui.PROHAXScreenGui
PROHAXScreenGui.topbar.Parent = PROHAXScreenGui.MAIN
PROHAXScreenGui.title.Parent = PROHAXScreenGui.topbar
PROHAXScreenGui.logo.Parent = PROHAXScreenGui.topbar
PROHAXScreenGui.TextBox.Parent = PROHAXScreenGui.MAIN
PROHAXScreenGui.Execute.Parent = PROHAXScreenGui.MAIN
PROHAXScreenGui.ClearTextboxt.Parent = PROHAXScreenGui.MAIN
PROHAXScreenGui.injectaka_scan_all_the_game.Parent = PROHAXScreenGui.MAIN
PROHAXScreenGui.Close.Parent = PROHAXScreenGui.topbar

PROHAXScreenGui.PROHAXScreenGui.Name = "PROHAXScreenGui"
PROHAXScreenGui.PROHAXScreenGui.ResetOnSpawn = true
PROHAXScreenGui.PROHAXScreenGui.IgnoreGuiInset = false
PROHAXScreenGui.PROHAXScreenGui.DisplayOrder = 0

PROHAXScreenGui.MAIN.Name = "MAIN"
PROHAXScreenGui.MAIN.ZIndex = 1
PROHAXScreenGui.MAIN.Position = UDim2.new(0.370499432, 0, 0.377276659, 0)
PROHAXScreenGui.MAIN.Size = UDim2.new(0, 573, 0, 407)
PROHAXScreenGui.MAIN.BackgroundColor3 = Color3.fromRGB(48,48,48)
PROHAXScreenGui.MAIN.BackgroundTransparency = 0
PROHAXScreenGui.MAIN.Visible = true
PROHAXScreenGui.MAIN.AnchorPoint = Vector2.new(0, 0)
PROHAXScreenGui.MAIN.ClipsDescendants = false
PROHAXScreenGui.MAIN.BorderSizePixel = 0

PROHAXScreenGui.topbar.Name = "topbar"
PROHAXScreenGui.topbar.ZIndex = 1
PROHAXScreenGui.topbar.Position = UDim2.new(0, 0, -0.0761670768, 0)
PROHAXScreenGui.topbar.Size = UDim2.new(0, 573, 0, 31)
PROHAXScreenGui.topbar.BackgroundColor3 = Color3.fromRGB(255,255,255)
PROHAXScreenGui.topbar.BackgroundTransparency = 0
PROHAXScreenGui.topbar.Visible = true
PROHAXScreenGui.topbar.AnchorPoint = Vector2.new(0, 0)
PROHAXScreenGui.topbar.ClipsDescendants = false
PROHAXScreenGui.topbar.BorderSizePixel = 0

PROHAXScreenGui.title.Name = "title"
PROHAXScreenGui.title.ZIndex = 1
PROHAXScreenGui.title.Position = UDim2.new(0.0383944139, 0, 0.0967741907, 0)
PROHAXScreenGui.title.Size = UDim2.new(0, 151, 0, 25)
PROHAXScreenGui.title.BackgroundColor3 = Color3.fromRGB(255,255,255)
PROHAXScreenGui.title.BackgroundTransparency = 2
PROHAXScreenGui.title.Text = "Secret Exploting panel"
PROHAXScreenGui.title.TextScaled = true
PROHAXScreenGui.title.TextSize = 14
PROHAXScreenGui.title.Font = Enum.Font.Unknown
PROHAXScreenGui.title.TextColor3 = Color3.fromRGB(0,0,0)
PROHAXScreenGui.title.TextStrokeColor3 = Color3.fromRGB(0,0,0)
PROHAXScreenGui.title.TextStrokeTransparency = 1
PROHAXScreenGui.title.TextWrapped = true
PROHAXScreenGui.title.TextXAlignment = Enum.TextXAlignment.Center
PROHAXScreenGui.title.TextYAlignment = Enum.TextYAlignment.Center
PROHAXScreenGui.title.TextTransparency = 0
PROHAXScreenGui.title.Visible = true
PROHAXScreenGui.title.AnchorPoint = Vector2.new(0, 0)
PROHAXScreenGui.title.ClipsDescendants = false

PROHAXScreenGui.logo.Name = "logo"
PROHAXScreenGui.logo.ZIndex = 1
PROHAXScreenGui.logo.Position = UDim2.new(-0.012216405, 0, -0.0967741907, 0)
PROHAXScreenGui.logo.Size = UDim2.new(0, 37, 0, 34)
PROHAXScreenGui.logo.BackgroundColor3 = Color3.fromRGB(255,255,255)
PROHAXScreenGui.logo.BackgroundTransparency = 1
PROHAXScreenGui.logo.Image = "rbxassetid://76499234772636"
PROHAXScreenGui.logo.ScaleType = Enum.ScaleType.Stretch
PROHAXScreenGui.logo.ImageColor3 = Color3.fromRGB(255,255,255)
PROHAXScreenGui.logo.ImageTransparency = 0
PROHAXScreenGui.logo.Visible = true
PROHAXScreenGui.logo.AnchorPoint = Vector2.new(0, 0)
PROHAXScreenGui.logo.ClipsDescendants = false

PROHAXScreenGui.TextBox.Name = "TextBox"
PROHAXScreenGui.TextBox.ZIndex = 1
PROHAXScreenGui.TextBox.Position = UDim2.new(0, 0, 0.0417690426, 0)
PROHAXScreenGui.TextBox.Size = UDim2.new(0, 500, 0, 261)
PROHAXScreenGui.TextBox.BackgroundColor3 = Color3.fromRGB(44,44,44)
PROHAXScreenGui.TextBox.BackgroundTransparency = 0
PROHAXScreenGui.TextBox.Text = "SON"
PROHAXScreenGui.TextBox.TextScaled = false
PROHAXScreenGui.TextBox.TextSize = 14
PROHAXScreenGui.TextBox.Font = Enum.Font.Unknown
PROHAXScreenGui.TextBox.TextColor3 = Color3.fromRGB(203,203,203)
PROHAXScreenGui.TextBox.TextStrokeColor3 = Color3.fromRGB(0,0,0)
PROHAXScreenGui.TextBox.TextStrokeTransparency = 1
PROHAXScreenGui.TextBox.TextWrapped = true
PROHAXScreenGui.TextBox.TextXAlignment = Enum.TextXAlignment.Left
PROHAXScreenGui.TextBox.TextYAlignment = Enum.TextYAlignment.Top
PROHAXScreenGui.TextBox.TextTransparency = 0
PROHAXScreenGui.TextBox.ClearTextOnFocus = true
PROHAXScreenGui.TextBox.MultiLine = true
PROHAXScreenGui.TextBox.Visible = true
PROHAXScreenGui.TextBox.AnchorPoint = Vector2.new(0, 0)
PROHAXScreenGui.TextBox.ClipsDescendants = false

PROHAXScreenGui.Execute.Name = "Execute"
PROHAXScreenGui.Execute.ZIndex = 1
PROHAXScreenGui.Execute.Position = UDim2.new(0.012216405, 0, 0.742014766, 0)
PROHAXScreenGui.Execute.Size = UDim2.new(0, 200, 0, 50)
PROHAXScreenGui.Execute.BackgroundColor3 = Color3.fromRGB(85,255,0)
PROHAXScreenGui.Execute.BackgroundTransparency = 0
PROHAXScreenGui.Execute.Text = "Execute"
PROHAXScreenGui.Execute.TextScaled = true
PROHAXScreenGui.Execute.TextSize = 14
PROHAXScreenGui.Execute.Font = Enum.Font.SourceSansBold
PROHAXScreenGui.Execute.TextColor3 = Color3.fromRGB(0,0,0)
PROHAXScreenGui.Execute.TextStrokeColor3 = Color3.fromRGB(0,0,0)
PROHAXScreenGui.Execute.TextStrokeTransparency = 1
PROHAXScreenGui.Execute.TextWrapped = true
PROHAXScreenGui.Execute.TextXAlignment = Enum.TextXAlignment.Center
PROHAXScreenGui.Execute.TextYAlignment = Enum.TextYAlignment.Center
PROHAXScreenGui.Execute.TextTransparency = 0
PROHAXScreenGui.Execute.Visible = true
PROHAXScreenGui.Execute.AnchorPoint = Vector2.new(0, 0)
PROHAXScreenGui.Execute.ClipsDescendants = false

PROHAXScreenGui.ClearTextboxt.Name = "ClearTextboxt"
PROHAXScreenGui.ClearTextboxt.ZIndex = 1
PROHAXScreenGui.ClearTextboxt.Position = UDim2.new(0.41186735, 0, 0.742014766, 0)
PROHAXScreenGui.ClearTextboxt.Size = UDim2.new(0, 200, 0, 50)
PROHAXScreenGui.ClearTextboxt.BackgroundColor3 = Color3.fromRGB(85,255,0)
PROHAXScreenGui.ClearTextboxt.BackgroundTransparency = 0
PROHAXScreenGui.ClearTextboxt.Text = "Clear"
PROHAXScreenGui.ClearTextboxt.TextScaled = true
PROHAXScreenGui.ClearTextboxt.TextSize = 14
PROHAXScreenGui.ClearTextboxt.Font = Enum.Font.SourceSansBold
PROHAXScreenGui.ClearTextboxt.TextColor3 = Color3.fromRGB(0,0,0)
PROHAXScreenGui.ClearTextboxt.TextStrokeColor3 = Color3.fromRGB(0,0,0)
PROHAXScreenGui.ClearTextboxt.TextStrokeTransparency = 1
PROHAXScreenGui.ClearTextboxt.TextWrapped = true
PROHAXScreenGui.ClearTextboxt.TextXAlignment = Enum.TextXAlignment.Center
PROHAXScreenGui.ClearTextboxt.TextYAlignment = Enum.TextYAlignment.Center
PROHAXScreenGui.ClearTextboxt.TextTransparency = 0
PROHAXScreenGui.ClearTextboxt.Visible = true
PROHAXScreenGui.ClearTextboxt.AnchorPoint = Vector2.new(0, 0)
PROHAXScreenGui.ClearTextboxt.ClipsDescendants = false

PROHAXScreenGui.injectaka_scan_all_the_game.Name = "injectaka scan all the game"
PROHAXScreenGui.injectaka_scan_all_the_game.ZIndex = 1
PROHAXScreenGui.injectaka_scan_all_the_game.Position = UDim2.new(0.797556698, 0, 0.712530732, 0)
PROHAXScreenGui.injectaka_scan_all_the_game.Size = UDim2.new(0, 109, 0, 105)
PROHAXScreenGui.injectaka_scan_all_the_game.BackgroundColor3 = Color3.fromRGB(255,255,255)
PROHAXScreenGui.injectaka_scan_all_the_game.BackgroundTransparency = 1
PROHAXScreenGui.injectaka_scan_all_the_game.Image = "rbxassetid://122388354733007"
PROHAXScreenGui.injectaka_scan_all_the_game.ScaleType = Enum.ScaleType.Stretch
PROHAXScreenGui.injectaka_scan_all_the_game.ImageColor3 = Color3.fromRGB(255,255,255)
PROHAXScreenGui.injectaka_scan_all_the_game.ImageTransparency = 0
PROHAXScreenGui.injectaka_scan_all_the_game.Visible = true
PROHAXScreenGui.injectaka_scan_all_the_game.AnchorPoint = Vector2.new(0, 0)
PROHAXScreenGui.injectaka_scan_all_the_game.ClipsDescendants = false

-- Close button (top right of topbar)
PROHAXScreenGui.Close.Name = "Close"
PROHAXScreenGui.Close.ZIndex = 2
PROHAXScreenGui.Close.Position = UDim2.new(1, -32, 0, 0)
PROHAXScreenGui.Close.Size = UDim2.new(0, 32, 0, 31)
PROHAXScreenGui.Close.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
PROHAXScreenGui.Close.BackgroundTransparency = 0
PROHAXScreenGui.Close.Text = "X"
PROHAXScreenGui.Close.TextScaled = true
PROHAXScreenGui.Close.TextSize = 18
PROHAXScreenGui.Close.Font = Enum.Font.SourceSansBold
PROHAXScreenGui.Close.TextColor3 = Color3.fromRGB(255,255,255)
PROHAXScreenGui.Close.TextStrokeTransparency = 1
PROHAXScreenGui.Close.TextWrapped = true
PROHAXScreenGui.Close.TextXAlignment = Enum.TextXAlignment.Center
PROHAXScreenGui.Close.TextYAlignment = Enum.TextYAlignment.Center
PROHAXScreenGui.Close.BorderSizePixel = 0
PROHAXScreenGui.Close.Visible = true
PROHAXScreenGui.Close.AnchorPoint = Vector2.new(0, 0)

-- ═══════════════════════════════════════════════════════════════
-- FUNCTIONALITY
-- ═══════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer

local foundVulns = {}
local lastScanHits = 0

local function notify(title, text, duration)
	duration = duration or 5
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = duration,
			Button1 = "OK"
		})
	end)
end

local function bruteScan()
	foundVulns = {}
	local hits = 0

	local keywords = {
		"admin","ban","kick","kill","give","cash","money","coins","weapon","gun",
		"tool","exploit","backdoor","ss","server","execute","loadstring","require",
		"script","cmd","command","mod","owner","dev","hack","inject","run","code",
		"lua","fire","invoke","remote","event","func","handler","load","string"
	}

	local function isSuspicious(name)
		name = string.lower(name or "")
		for _, kw in ipairs(keywords) do
			if string.find(name, kw) then return true end
		end
		return false
	end

	local function scanInstance(obj)
		if not obj then return end
		local class = obj.ClassName
		local name = obj.Name
		local path = obj:GetFullName()

		if class == "RemoteEvent" or class == "RemoteFunction" then
			local score = isSuspicious(name) and 95 or 55
			table.insert(foundVulns, {
				type = class,
				name = name,
				path = path,
				obj = obj,
				score = score
			})
			hits = hits + 1
		elseif class == "ModuleScript" and isSuspicious(name) then
			table.insert(foundVulns, {
				type = "ModuleScript",
				name = name,
				path = path,
				obj = obj,
				score = 80
			})
			hits = hits + 1
		elseif (class == "BindableEvent" or class == "BindableFunction") and isSuspicious(name) then
			table.insert(foundVulns, {
				type = class,
				name = name,
				path = path,
				obj = obj,
				score = 70
			})
			hits = hits + 1
		end
	end

	local function deep(obj)
		scanInstance(obj)
		for _, child in ipairs(obj:GetChildren()) do
			pcall(deep, child)
		end
	end

	local roots = {
		ReplicatedStorage,
		game:GetService("Workspace"),
		game:GetService("Lighting"),
		game:GetService("Players"),
		game:GetService("StarterGui"),
		game:GetService("StarterPack"),
		game:GetService("StarterPlayer"),
		game:GetService("SoundService"),
		game:GetService("Chat"),
		game:GetService("Teams"),
		game:GetService("TestService"),
	}

	for _, root in ipairs(roots) do
		pcall(deep, root)
	end

	for _, plr in ipairs(Players:GetPlayers()) do
		pcall(function()
			if plr.Character then deep(plr.Character) end
			if plr:FindFirstChild("Backpack") then deep(plr.Backpack) end
			if plr:FindFirstChild("PlayerGui") then deep(plr.PlayerGui) end
		end)
	end

	table.sort(foundVulns, function(a, b) return a.score > b.score end)
	return hits
end

local function trySSExecute(payload)
	if not payload or payload == "" or payload == "SON" then
		notify("SS Execute", "TextBox empty – put payload first", 4)
		return
	end

	if #foundVulns == 0 then
		notify("SS Execute", "No vulns found – scan first", 4)
		return
	end

	notify("Executing...", "Pushing payload through found remotes", 3)

	local successCount = 0
	local tried = 0

	for _, v in ipairs(foundVulns) do
		if v.type == "RemoteEvent" and v.obj then
			tried = tried + 1
			local ok = pcall(function()
				v.obj:FireServer(payload)
				v.obj:FireServer(payload, LP)
				v.obj:FireServer({code = payload})
				v.obj:FireServer("execute", payload)
				v.obj:FireServer("run", payload)
				v.obj:FireServer("loadstring", payload)
			end)
			if ok then successCount = successCount + 1 end
		elseif v.type == "RemoteFunction" and v.obj then
			tried = tried + 1
			local ok = pcall(function()
				v.obj:InvokeServer(payload)
				v.obj:InvokeServer(payload, LP)
				v.obj:InvokeServer({code = payload})
				v.obj:InvokeServer("execute", payload)
			end)
			if ok then successCount = successCount + 1 end
		end
	end

	task.wait(0.4)

	if successCount > 0 then
		notify("Worked", "Tried " .. tried .. " • " .. successCount .. " accepted", 5)
	else
		notify("Failed", "Tried " .. tried .. " remotes – none accepted", 5)
	end
end

-- Scan button (NO textbox dump)
PROHAXScreenGui.injectaka_scan_all_the_game.MouseButton1Click:Connect(function()
	notify("Scanning", "Brute-force SS vuln scan running…", 3)

	task.spawn(function()
		local hits = bruteScan()
		lastScanHits = hits

		if hits > 0 then
			notify("Vuln Founded", hits .. " possible SS vector(s) ready", 6)
		else
			notify("Vuln Not Founded", "No clear SS vulnerabilities", 5)
		end
	end)
end)

-- Execute
PROHAXScreenGui.Execute.MouseButton1Click:Connect(function()
	local payload = PROHAXScreenGui.TextBox.Text
	trySSExecute(payload)
end)

-- Clear
PROHAXScreenGui.ClearTextboxt.MouseButton1Click:Connect(function()
	PROHAXScreenGui.TextBox.Text = ""
	notify("Cleared", "TextBox wiped", 2)
end)

-- Close
PROHAXScreenGui.Close.MouseButton1Click:Connect(function()
	PROHAXScreenGui.PROHAXScreenGui:Destroy()
end)

-- drag
local dragging, dragInput, dragStart, startPos
local function update(input)
	local delta = input.Position - dragStart
	PROHAXScreenGui.MAIN.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

PROHAXScreenGui.topbar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = PROHAXScreenGui.MAIN.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

PROHAXScreenGui.topbar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
