function print_inventory_on_monitor(chest, monitor)
    if not (chest and monitor) then
        return
    end
    
    monitor.clear()
    local inventory = chest.list()
    local yPos = 1

    for slot, item in pairs(inventory) do
        local itemName = string.match(item.name, "[^:]+$")
        local itemNameLength = string.len(itemName)
        local itemCount = item.count
        local itemCountStr = tostring(itemCount)
        local itemCountLength = string.len(itemCountStr)
        
        local itemNameXPos = math.floor((30 - itemNameLength) / 2)
        local itemCountXPos = math.floor((30 - itemCountLength) / 2)
        
        monitor.setCursorPos(itemNameXPos, yPos)
        monitor.write(itemName)
        
        yPos = yPos + 1
        
        monitor.setCursorPos(itemCountXPos, yPos)
        monitor.write('X ' .. itemCount)
        
        yPos = yPos + 1

        if yPos > 10 then
            break
        end
    end
end

while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("minecraft:chest")
    
    print_inventory_on_monitor(chest, monitor)
   
    monitor.setTextScale(2)
    monitor.setTextColour(15)
     
    sleep(10)
end