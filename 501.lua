local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

warn("Error 501")

if LocalPlayer then
	LocalPlayer:Kick("The script is currently undergoing technical maintenance (501)")
end
