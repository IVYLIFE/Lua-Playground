-- ===========================================================
-- This file demonstrates basic math functions and operations in Lua.
-- ===========================================================


--[[
    =============== [ Operators in Lua ] ===============
    Arithmetic Operators:
        +   Addition
        -   Subtraction
        *   Multiplication
        /   Division
        %   Modulus (remainder)
        ^   Exponentiation
        //  Floor division

    Relational Operators:
        ==  Equal to
        ~=  Not equal to
        >   Greater than
        <   Less than
        >=  Greater than or equal to
        <=  Less than or equal to

    Logical Operators:
        and, or, not

    Concatenation:
        ..  (joins two strings)
]]

local a, b = 15, 4
print("a =", a, "b =", b)

-- Arithmetic operations
print("Addition:", a + b)
print("Subtraction:", a - b)
print("Multiplication:", a * b)
print("Division:", a / b)
print("Modulus:", a % b)
print("Exponentiation:", a ^ b)
print("Floor Division:", a // b)

-- Relational operations
print("Equal:", a == b)
print("Not Equal:", a ~= b)
print("Greater than:", a > b)
print("Less than:", a < b)
print("Greater than or equal to:", a >= b)
print("Less than or equal to:", a <= b)

-- Logical operations
print("And:", true and false)
print("Or:", true or false)
print("Not:", not true)

--[[
    =============== [ Math Library Functions ] ===============
    math.abs(x)      -- Absolute value
    math.ceil(x)     -- Ceiling (round up)
    math.floor(x)    -- Floor (round down)
    math.max(x, ...) -- Maximum
    math.min(x, ...) -- Minimum
    math.sqrt(x)     -- Square root
    math.exp(x)      -- Exponential (e^x)
    math.log(x)      -- Natural logarithm
    math.log(x, 10)  -- Base-10 logarithm.
    math.random()    -- Random number (0-1)
    math.random(a, b)-- Random integer in [a, b]
    math.pi          -- Pi constant
    math.deg(x)      -- Radians to degrees
    math.rad(x)      -- Degrees to radians
    math.sin(x), math.cos(x), math.tan(x) -- Trigonometry (x in radians)
]]

local x = -7.8
print("Absolute:", math.abs(x))
print("Ceiling:", math.ceil(x))
print("Floor:", math.floor(x))
print("Max:", math.max(a, b, x))
print("Min:", math.min(a, b, x))
print("Square root of 16:", math.sqrt(16))
print("e^2:", math.exp(2))
print("ln(10):", math.log(10))
print("log10(100):", math.log(100, 10))  -- Base-10 logarithm in Lua 5.4
print("Pi:", math.pi)

-- Trigonometry
local angle = math.pi / 4  -- 45 degrees in radians
print("sin(45°):", math.sin(angle))
print("cos(45°):", math.cos(angle))
print("tan(45°):", math.tan(angle))
print("Degrees to radians (180):", math.rad(180))
print("Radians to degrees (pi):", math.deg(math.pi))

-- Random numbers
math.randomseed(os.time())  -- Seed the random number generator
print("Random [0,1):", math.random())
print("Random integer [1,10]:", math.random(1, 10))

