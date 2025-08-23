-- ===========================================================
-- This file covers looping constructs in Lua.
-- ===========================================================

--[[
    =============== [ Loop Types in Lua ] ===============
    1. for (numeric): for i = start, stop, step do ... end
    2. for (generic): for k, v in pairs(table) do ... end
    3. while: while condition do ... end
    4. repeat-until: repeat ... until condition
    5. break: exits the nearest enclosing loop
    6. goto: jumps to a label (rarely used in production)

    Tip : Prefer ipairs for arrays and pairs for generic tables.
]]

-- Numeric for loop
for i = 1, 5 do
    print("Numeric for:", i)
    if i == 5 then print("\n") end
end

-- Numeric for loop with step
for i = 10, 1, -2 do
    print("Numeric for with step:", i)
    if i == 2 then print("\n") end
end

-- Iterating over arrays (tables with integer keys)
local arr = {10, 20, 30, 40}
for i, v in ipairs(arr) do
    print(string.format("ipairs: index=%d, value=%d", i, v))
    if i == #arr then print("\n") end
end

-- Iterating over key-value pairs in a table
local t = {a = 1, b = 2, c = 3}
for k, v in pairs(t) do
    print(string.format("pairs: key=%s, value=%d", k, v))
end

-- While loop
local n = 1
local max = 3
while n <= max do
    print("while loop:", n)
    n = n + 1
    if n > max then print("\n") end
end

-- Repeat-until loop (like do-while)
local m = 1
repeat
    print("repeat-until:", m)
    m = m + 1
    if m > max then print("\n") end
until m > max

-- Using break
for i = 1, 10 do
    if i == 4 then
        print("Breaking at", i)
        break
    end
end

-- Nested loops
for i = 1, 2 do
    for j = 1, 2 do
        print(string.format("nested: i=%d, j=%d", i, j))
    end
end

-- Looping over a table to find a value
local search = 30
local found = false
for _, v in ipairs(arr) do
    if v == search then
        found = true
        break
    end
end

-- Print search result
print("Search for: " .. search .. " was " .. (found and "successful" or "unsuccessful"))
