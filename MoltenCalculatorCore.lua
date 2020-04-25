Object = require "classic" 

MCCore = Object:extend()

function MCCore:new(gain, components)
    self.gain = gain or 0
    self.components = components or nil
end

function MCCore:setGain(gain)
    if type(gain) == "number" then
        self.gain= gain
    end
end

function MCCore:getGain()
    return self.gain
end

function MCCore:addComponent(component)
    if component ~= nil then
        insert(self.components, component)
    end
end

function MCCore:finalPrice()
    local finalPrice
    for k,component in pairs(components) do
        finalPrice = finalPrice + component.getPrice()
    end
    
    finalPrice = finalPrice + finalPrice / self.gain
    
    return finalPrice
end 

local components = require("")
insert(components, Component("Ryzen 5 2600x", "cpu", "110", "old"))
insert(components, Component("Corsair vengeance 32go 2666", "ram", "110", "old")) -- add feature : add lifetime
insert(components, Component("Gtx 980", "gcard", "99", "old"))
insert(components, Component("Gigabyte b450m", "mobo", "45", "old"))
insert(components, Component("Aerocool cylon atx", "case", "45", "new"))
insert(components, Component("Aerocool 650W", "psu", "35", "old"))
insert(components, Component("Crucial BX500", "ssd", "20", "new"))
insert(components, Component("Seagate 1tb", "hdd", "30", "old"))


