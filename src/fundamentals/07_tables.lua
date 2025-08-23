-- ===========================================================
-- This file discusses tables, the primary data structure in Lua.
-- ===========================================================

--[[
    =============== [ Tables in Lua ] ===============
    1. Tables are the only built-in data structure in Lua (arrays, dictionaries, objects).
    2. Tables are created with {}.
    3. Keys can be numbers, strings, or any value except nil.
    4. Arrays: tables with integer keys.
    5. Dictionaries: tables with string keys.
    6. Tables are mutable and passed by reference.
]]


-- Array style
local arr = {10, 20, 30}
print("First element:", arr[1])
arr[4] = 40
print("Length:", #arr)

-- Adding elements
table.insert(arr, 50)
print("After insert:", arr[5])
-- Removing elements
table.remove(arr, 2)
print("After remove:", arr[2])

-- print whole table in one line 
print("Array contents:", table.concat(arr, ", "))


-- Dictionary style
local dict = {name = "Lua", version = 5.4}
print("Name:", dict.name)
dict.author = "Roberto"
print("Author:", dict["author"])

-- Adding and removing keys
dict["year"] = 1993
print("Year:", dict.year)
dict.version = nil  -- Remove key
print("After removal, version:", dict.version)


-- local json_dict = cjson.encode(dict)
-- print(json_dict)

-- Mixed table
local t = {"a", "b", x = 1, y = 2}
print("t[1] =", t[1], "t.x =", t.x)

-- Iterating arrays
for i, v in ipairs(arr) do
    print(string.format("ipairs: i=%d, v=%d", i, v))
end

-- Iterating all keys/values
for k, v in pairs(dict) do
    print(string.format("pairs: k=%s, v=%s", k, v))
end

-- Removing elements
arr[2] = nil
print("After removal, arr[2] =", arr[2])

-- Table as a set
local set = {}
set["apple"] = true
set["banana"] = true
print("Is apple in set?", set["apple"])

-- Table as a stack
local stack = {}
table.insert(stack, 1)
table.insert(stack, 2)
print("Stack pop:", table.remove(stack))

-- Table as a queue
local queue = {}
table.insert(queue, 1)
table.insert(queue, 2)
print("Queue dequeue:", table.remove(queue, 1))

-- Table functions
local concat = table.concat({"a", "b", "c"}, ", ")
print("Concatenated:", concat)