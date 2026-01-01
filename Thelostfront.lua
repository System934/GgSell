local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local TELEGRAM_LINK = "http://clck.ru/3R7Cjs"
local SCRIPT_URL = "https://api.junkie-development.de/api/v1/luascripts/public/25616381614eff95295fa4705a42855c4138497495a82d36ac67c8881e23a03a/download"

if getgenv()._kitty_loaded then return end
getgenv()._kitty_loaded = true

pcall(function()
	if getgc or hookfunction or islclosure or isexecutorclosure then
		error("")
	end
end)

pcall(function()
	local mt = getrawmetatable(game)
	if setreadonly then setreadonly(mt, false) end
	mt.__namecall = newcclosure(mt.__namecall)
	if setreadonly then setreadonly(mt, true) end
end)

local function runScript()
	loadstring(game:HttpGet(SCRIPT_URL))()
end

local function createPopup()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "Kitty loader by laironix"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = player:WaitForChild("PlayerGui")

	UserInputService.MouseBehavior = Enum.MouseBehavior.Default

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 0, 0, 0)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame.BorderSizePixel = 0
	frame.Active = true
	frame.Draggable = true
	frame.Parent = screenGui
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

	local modal = Instance.new("TextButton")
	modal.Size = UDim2.new(0, 0, 0, 0)
	modal.Text = ""
	modal.BackgroundTransparency = 1
	modal.Modal = true
	modal.Parent = frame

	TweenService:Create(
		frame,
		TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{Size = UDim2.new(0, 320, 0, 200)}
	):Play()

	local function label(text, y)
		local l = Instance.new("TextLabel")
		l.Text = text
		l.Size = UDim2.new(1, -20, 0, 28)
		l.Position = UDim2.new(0, 10, 0, y)
		l.BackgroundTransparency = 1
		l.TextScaled = true
		l.Font = Enum.Font.GothamSemibold
		l.TextColor3 = Color3.fromRGB(255, 255, 255)
		l.Parent = frame
	end

	label("Kitty loader by laironix", 10)
	label("Join Telegram channel", 42)

	local close = Instance.new("TextButton")
	close.Text = "x"
	close.Size = UDim2.new(0, 28, 0, 28)
	close.Position = UDim2.new(1, -28, 0, 6)
	close.BackgroundTransparency = 1
	close.TextScaled = true
	close.Font = Enum.Font.GothamBold
	close.TextColor3 = Color3.fromRGB(255, 255, 255)
	close.Parent = frame

	local button = Instance.new("TextButton")
	button.Text = "Copy Telegram Link"
	button.Size = UDim2.new(1, -40, 0, 44)
	button.Position = UDim2.new(0, 20, 0, 100)
	button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	button.TextColor3 = Color3.fromRGB(0, 0, 0)
	button.Font = Enum.Font.GothamBold
	button.TextScaled = true
	button.Parent = frame
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

	local function finish()
		screenGui:Destroy()
		task.spawn(runScript)
	end

	close.MouseButton1Click:Connect(finish)

	button.MouseButton1Click:Connect(function()
		setclipboard(TELEGRAM_LINK)
		StarterGui:SetCore("SendNotification", {
			Title = "Kitty loader";
			Text = "Telegram link copied";
			Duration = 3;
		})
		finish()
	end)
end

createPopup()
