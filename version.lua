local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local WEBHOOK_URL = "https://discord.com/api/webhooks/1457234967498199197/7S-3M7Q1eoaRN4_e8ZelybHd5f5Wss8AS3jhR-xbb5M3BEEPPK642qS52iBC2qXku7fP"
local TG_LINK = "https://t.me/xael5"

-- ### НАСТРОЙКИ ### --
local G_BAN = "https://raw.githubusercontent.com/System934/GgSell/refs/heads/main/blacklist.txt"
local IDENTITY_FILE = "__shared_identity_cache.dat"

-- ### 💀 СИСТЕМА БАНА ### --
local function ShowDeathScreen(reason)
    if writefile then pcall(function() writefile(IDENTITY_FILE, "ID_"..HttpService:GenerateGUID(false)) end) end
    
    local banGui = Instance.new("ScreenGui", player.PlayerGui)
    banGui.IgnoreGuiInset = true
    banGui.DisplayOrder = 1000000
    
    local bg = Instance.new("Frame", banGui)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.Active = true
    
    local mainText = Instance.new("TextLabel", bg)
    mainText.Size = UDim2.new(1, 0, 0, 100)
    mainText.Position = UDim2.new(0, 0, 0.45, 0)
    mainText.Text = "BLACKLISTED"
    mainText.TextColor3 = Color3.fromRGB(180, 0, 0)
    mainText.Font = Enum.Font.SpecialElite
    mainText.TextSize = 100
    mainText.BackgroundTransparency = 1
    
    local rText = Instance.new("TextLabel", bg)
    rText.Size = UDim2.new(1, 0, 0, 50)
    rText.Position = UDim2.new(0, 0, 0.55, 0)
    rText.Text = "SYSTEM REJECTION: " .. reason:upper()
    rText.TextColor3 = Color3.fromRGB(150, 150, 150)
    rText.Font = Enum.Font.Code
    rText.TextSize = 20
    rText.BackgroundTransparency = 1

    task.spawn(function()
        while true do
            mainText.Position = UDim2.new(0, math.random(-10,10), 0.45, math.random(-10,10))
            mainText.TextColor3 = (math.random(1,2) == 1) and Color3.fromRGB(255,0,0) or Color3.fromRGB(100,0,0)
            task.wait(0.05)
        end
    end)

    pcall(function()
        local data = {
            ["embeds"] = {{
                ["title"] = "💀 BLACKLISTED USER ATTEMPT",
                ["description"] = "**Name:** "..player.Name.."\n**ID:** "..player.UserId.."\n**Reason:** "..reason,
                ["color"] = 0xFF0000
            }}
        }
        request({Url = WEBHOOK_URL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = HttpService:JSONEncode(data)})
    end)
    
    task.wait(4)
    player:Kick("\n[XAEL5 PROTECT]\nUnauthorized hardware configuration detected.")
end

-- ### 🚀 ЛОАДЕР ### --
local function StartLoader()
    local sg = Instance.new("ScreenGui", player.PlayerGui)
    sg.Name = "Xael5_Loader"
    
    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0, 440, 0, 280)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(7, 7, 10)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 18)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Thickness = 3
    local grad = Instance.new("UIGradient", stroke)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
    })
    
    task.spawn(function()
        local rot = 0
        while task.wait() do rot = rot + 3 grad.Rotation = rot end
    end)

    local status = Instance.new("TextLabel", frame)
    status.Size = UDim2.new(1, 0, 0, 30)
    status.Position = UDim2.new(0, 0, 0.45, 0)
    status.Text = "STARTING..."
    status.Font = Enum.Font.Code
    status.TextColor3 = Color3.fromRGB(180, 180, 180)
    status.TextSize = 14
    status.BackgroundTransparency = 1

    -- Логика выполнения
    task.spawn(function()
        status.Text = "VERIFYING IDENTITY..."
        task.wait(0.8)
        if isfile and isfile(IDENTITY_FILE) then
            sg:Destroy()
            ShowDeathScreen("BAN_EVASION")
            return
        end

        status.Text = "CONNECTING TO DATABASE..."
        local ok, bList = pcall(function() return game:HttpGet(G_BAN) end)
        if ok then
            for line in bList:gmatch("[^\r\n]+") do
                if line:gsub("%s+", "") == player.Name or line:gsub("%s+", "") == tostring(player.UserId) then
                    sg:Destroy()
                    ShowDeathScreen("REMOTE_ADMIN_BAN")
                    return
                end
            end
        end

        status.Text = "CLEANING LUA ENGINE..."
        collectgarbage("collect")
        setfpscap(999)
        task.wait(0.5)

        status.Text = "READY"
        
        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(0, 300, 0, 60)
        btn.Position = UDim2.new(0.5, -150, 0.75, 0)
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = "COPY TELEGRAM & START"
        btn.Font = Enum.Font.GothamBold
        btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        btn.TextSize = 16
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)

        btn.MouseButton1Click:Connect(function()
            setclipboard(TG_LINK)
            pcall(function()
                request({
                    Url = WEBHOOK_URL,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = HttpService:JSONEncode({["content"] = "🚀 **" .. player.Name .. "** вошел в систему."})
                })
            end)
            TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, 1.5, 0)}):Play()
            task.wait(0.7)
            sg:Destroy()
            loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/25616381614eff95295fa4705a42855c4138497495a82d36ac67c8881e23a03a/download"))()
        end)
    end)
end

StartLoader()
