-- ===========================================================
-- This file explains how to handle user input in Lua.
-- ===========================================================

--[[
    =============== [ User Input in Lua ] ===============
    1. Use io.read() to get input from the user (always returns a string).
    2. Use tonumber() to convert input to a number if needed.
    3. Always validate user input in production code.
    4. io.read("*n") can be used to read a number directly.
    5. io.write() can be used to print prompts without a newline.
]]

-- Basic string input
io.write("Enter your name: ")
local name = io.read()
print("Hello, " .. name .. "!")

-- Input as number (with conversion)
io.write("Enter your age: ")
local ageStr = io.read()
local age = tonumber(ageStr)
if age then
    print("You are " .. age .. " years old.")
else
    print("Invalid age input!")
end

-- Directly reading a number
io.write("Enter a number: ")
local num = io.read("*n")
print("You entered:", num)

-- Input validation loop
local valid = false
local value
repeat
    io.write("Enter a positive number (> 0): ")
    value = tonumber(io.read())
    if value and value > 0 then
        valid = true
    else
        print("Invalid input. Try again.")
    end
until valid

print("You entered:", value)
