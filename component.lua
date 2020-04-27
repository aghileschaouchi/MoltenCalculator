Object = require "classic"

ComponentTypes = {"cpu", "gcard", "ram", "mobo", "ssd", "hdd", "psu", "case"}

Component = Object:extend()

function Component:new(name, cType, price, condition, takeGain, lifetime)
    self.name = name or ""
    self.cType = cType or ""
    self.price = price or 0
    self.condition = condition or "old"
    self.takeGain = takeGain or "true"
    self.lifetime = lifetime or ""
end

function Component:setPrice(price)
    if type(price) == "number" then
        self.price = price
    end
end

function Component:setName(name)
    if type(name) == "string" then
        self.name = name
    end
end

function Component:setCType(cType)
    if type(name) == "string" then
        self.cType = cType
    end
end

function Component:setCondition(condition)
    if condition == "old" or condition == "new" then
        self.condition = condition
    end
end

function Component:setTakeGain(takeGain)
    self.takeGain = takeGain
end

function Component:setLifetime(lifetime)
    self.lifetime = lifetime
end

function Component:getPrice()
    return self.price
end

function Component:getName()
    return self.name
end

function Component:getCType()
    return self.cType
end

function Component:getCondition()
    return self.condition
end

function Component:getTakeGain()
    return self.takegain
end

function Component:getLifetime()
    return self.lifetime
end

function Component:__tostring()
    return self.name .. " " .. self.cType .. " " .. self.price .. " " ..self.condition .. " " .. tostring(self.takeGain) .. " " .. self.lifetime
end

return Component

--local comp1 = Component("Ryzen 5 2600x", "cpu", "110", "old", true)
--print(comp1)