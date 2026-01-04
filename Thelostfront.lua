local success, result = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/System934/GgSell/refs/heads/main/yes")
end)

if success then
    local content = result:gsub("%s+", "")
    if content == "yes/404" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/System934/GgSell/refs/heads/main/404.lua"))()
    elseif content == "yes/501" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/System934/GgSell/refs/heads/main/501.lua"))()
    elseif content == "no" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/System934/GgSell/refs/heads/main/version.lua"))()
    end
end
