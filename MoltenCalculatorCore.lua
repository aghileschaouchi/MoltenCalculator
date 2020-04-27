Object = require "classic" 
require 'component'

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
        table.insert(self.components, component)
    end
end

function MCCore:finalPrice()
    fP = 0
    for u, component in pairs(self.components) do
        fP = fP + component:getPrice()
        if component:getTakeGain() then
            fP = fP + component:getPrice() / self.getGain()
        end
    end
    return fP
end

function MCCore:__tostring()
    ret = " "
    for u, component in pairs(self.components) do
        ret = ret .. tostring(component) .. "\n"
    end
    ret = ret .. tostring(1 / self.gain)
    return ret
end 

local components = {}
table.insert(components, Component("Ryzen 5 2600x", "cpu", "110", "old", true, "4 months"))
table.insert(components, Component("Corsair vengeance 32go 2666", "ram", "110", "old", true, "5 years")) -- add feature : add lifetime
table.insert(components, Component("Gtx 980", "gcard", "99", "old", true, "?"))
table.insert(components, Component("Gigabyte b450m", "mobo", "45", "old", true, "1 month"))
table.insert(components, Component("Aerocool cylon atx", "case", "45", "new", false, "0"))
table.insert(components, Component("Aerocool 650W", "psu", "35", "old", true, "?"))
table.insert(components, Component("Crucial BX500", "ssd", "20", "new", false, "0"))
table.insert(components, Component("Seagate 1tb", "hdd", "30", "old", false, "5 years"))
mccore = MCCore(4, components)

fP = mccore:finalPrice()
print(tostring(fP))


