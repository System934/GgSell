-- ===== SERVICES =====
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

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

-- ===== INJECTOR DETECT =====
local Injector = "Unknown"
local WindUISupported = false

-- Delta
if getgenv().DELTA_LOADED or getgenv().Delta then
	Injector = "Delta"
	WindUISupported = true

-- Codex
elseif getgenv().CODEX_LOADED or getgenv().Codex then
	Injector = "Codex"
	WindUISupported = true

-- KRNL
elseif getgenv().KRNL_LOADED then
	Injector = "KRNL"
	WindUISupported = true

-- Fluxus
elseif getgenv().FLUXUS_LOADED then
	Injector = "Fluxus"
	WindUISupported = true

-- Synapse
elseif getgenv().SYNAPSE_LOADED then
	Injector = "Synapse"
	WindUISupported = true

-- Arceus X (плохая поддержка)
elseif getgenv().ARCEUS_LOADED then
	Injector = "Arceus X"
	WindUISupported = false
end

-- ===== USER INFO =====
notify(
	"Injector detected",
	"Injector: " .. Injector ..
	"\nWindUI support: " .. (WindUISupported and "YES" or "NO")
)

-- ===== WARNINGS =====
if Injector == "Codex" then
	notify(
		"Предупреждение",
		"Скрипт может работать некорректно из-за настроек инжектора Codex"
	)
end

-- ===== EXPORT FOR MAIN SCRIPT =====
getgenv().InjectorName = Injector
getgenv().WindUISupported = WindUISupported
	if not ok then
		return false, "Runtime error:\n" .. tostring(runtimeErr)
	end

	return true
end

-- ========== MAIN ==========
do
	local source, err = httpGet(URL)
	if not source then
		fatal(err)
		return
	end

	local ok, execErr = run(source)
	if not ok then
		fatal(execErr)
		return
	end
end
