
--[[
    =============== [ OOP in Lua ] ===============
    1. Lua does not have built-in classes, but OOP is achieved using tables and metatables.
    2. Objects are tables; methods are functions stored in tables.
    3. The colon (:) syntax is used for methods (self parameter).
    4. Constructors are functions that return new tables (objects).
    5. Inheritance is done by setting metatables and __index.
]]

-- Basic object
local person = {name = "", age = 0}
function person:new(name, age)
    local obj = {name = name, age = age}
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function person:greet()
    print("Hello, my name is " .. self.name .. " and I am " .. self.age .. " years old.")
end

local alice = person:new("Alice", 30)
alice:greet()

-- Inheritance example
local employee = person:new()
function employee:new(name, age, position)
    local obj = person.new(self, name, age)
    obj.position = position
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function employee:work()
    print(self.name .. " is working as a " .. self.position)
end

local bob = employee:new("Bob", 40, "Manager")
bob:greet()
bob:work()