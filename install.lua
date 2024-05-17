local startupResponse = http.get("https://github.com/JonathanFriedePatelski/ComputerCraft/blob/main/chest_monitor.lua").readAll()
local chestMonitorResponse = http.get("https://github.com/JonathanFriedePatelski/ComputerCraft/blob/main/chest_monitor.lua").readAll()

local startupFile = fs.open("startup.lua", "w")
startupFile.write(startupResponse)
startupFile.close()

local chestMonitorFile = fs.open("chest_monitor.lua", "w")
chestMonitorFile.write(chestMonitorResponse)
chestMonitorFile.close()