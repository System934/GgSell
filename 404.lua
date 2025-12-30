local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

warn("Error 404")

if LocalPlayer then
	LocalPlayer:Kick("Script has been stopped (Error 404)")
end
