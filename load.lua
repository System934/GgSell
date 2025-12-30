-- ===== SERVICES =====
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- ===== URL =====
local SCRIPT_URL = "https://api.junkie-development.de/api/v1/luascripts/public/8381f8030a22565ce93fbcbb4c15a653693b0076ded98d2575456f65e5714e08/download"

-- ===== NOTIFY =====
local function notify(title, text)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = 6
		})
	end)
end

-- ===== INJECTOR DETECT + WINDUI SUPPORT (МНЕНИЕ) =====
local Injector = "Unknown"
local WindUISupported = false

if getgenv().DELTA_LOADED or getgenv().Delta then
	Injector = "Delta"
	WindUISupported = true

elseif getgenv().CODEX_LOADED or getgenv().Codex then
	Injector = "Codex"
	WindUISupported = true

elseif getgenv().KRNL_LOADED then
	Injector = "KRNL"
	WindUISupported = true

elseif getgenv().FLUXUS_LOADED then
	Injector = "Fluxus"
	WindUISupported = true

elseif getgenv().SYNAPSE_LOADED then
	Injector = "Synapse"
	WindUISupported = true
end

-- ===== INFO =====
notify(
	"Environment",
	"Injector: " .. Injector ..
	"\nWindUI support: " .. (WindUISupported and "YES" or "NO")
)

if Injector == "Codex" then
	notify(
		"Предупреждение",
		"Скрипт может работать некорректно из-за настроек инжектора Codex"
	)
end

-- ===== EXPORT FLAGS =====
getgenv().InjectorName = Injector
getgenv().WindUISupported = WindUISupported

-- ===== MAIN LOADSTRING (КАК ТЫ ХОТЕЛ) =====
loadstring(
	game:HttpGet(SCRIPT_URL)
)()
