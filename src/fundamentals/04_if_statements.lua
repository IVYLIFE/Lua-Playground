-- ===========================================================
-- This file explains conditional statements in Lua.
-- ===========================================================

--[[
    =============== [ If Statements ] ===============
    Syntax:
        if condition then
            -- code
        end

        if condition then
            -- code
        else
            -- code
        end

        if cond1 then
            -- code
        elseif cond2 then
            -- code
        else
            -- code
        end

    Only false and nil are considered false. Everything else is true.
]]

local a = 10
local b = 20


-- Basic if statement
if a < b then print("a is less than b") end

-- If-else statement
if a > b then
    print("a is greater than b")
else
    print("a is not greater than b")
end

-- If-elseif-else statement
if a == 10 then
    print("a is 10")
elseif a == 20 then
    print("a is 20")
else
    print("a is neither 10 nor 20")
end

-- Nested if
local x = 5
local y = 15
if x < 10 then
    if y > 10 then
        print("x < 10 and y > 10")
    end
end

-- Shorthand: using and/or for ternary-like expressions
local max = (a > b) and a or b
print("Max of a and b:", max)

-- Boolean context
local test = 0
if test then
    print("0 is considered true in Lua")
end
