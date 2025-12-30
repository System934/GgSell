-- ===== SERVICES =====
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- ===== URL =====
local SCRIPT_URL = "https://api.junkie-development.de/api/v1/luascripts/public/8381f8030a22565ce93fbcbb4c15a653693b0076ded98d2575456f65e5714e08/download"

-- ===== MAIN LOADSTRING (КАК ТЫ ХОТЕЛ) =====
loadstring(
	game:HttpGet(SCRIPT_URL)
)()
