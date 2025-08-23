-- ===========================================================
-- This file demonstrates how to create and call functions in Lua.
-- ===========================================================

--[[
    =============== [ Functions in Lua ] ===============
    1. Functions are first-class values (can be stored in variables, passed, returned).
    2. Defined with function keyword.
    3. Can have variable number of arguments (...).
    4. Can return multiple values.
    5. Anonymous functions (lambdas) are supported.
    6. Higher-order functions: functions that take/return functions.
]]

-- Basic function
function greet(name)
    print("Hello, " .. name .. "!")
end
greet("Lua")

-- Function with return
function add(a, b)
    return a + b
end
print("Sum:", add(2, 3))

-- Multiple return values
function minmax(a, b)
    if a < b then return a, b else return b, a end
end
local mn, mx = minmax(5, 8)
print("Min:", mn, "Max:", mx)

-- Variable arguments
function sum(...)
    local total = 0
    for _, v in ipairs({...}) do total = total + v end
    return total
end
print("Sum of 1,2,3:", sum(1,2,3))

-- Anonymous function
local square = function(x) return x * x end
print("Square of 4:", square(4))

-- Higher-order function
function apply(f, x)
    return f(x)
end
print("Apply square to 5:", apply(square, 5))