-- ===========================================================
-- This file illustrates how to work with strings in Lua.
-- ===========================================================

--[[
    =============== [ String Basics ] ===============
    1. Strings are sequences of characters.
    2. Strings can be created with single or double quotes, or double square brackets for multi-line.
    3. Concatenation is done with the .. operator.
    4. Escape sequences: \n (newline), \t (tab), \\ (backslash), \" (double quote), \' (single quote)
]]

local singleQuote = 'Hello, Lua!'
local doubleQuote = "Hello, World!"
local multiLine = [[
This is a multi-line string.
It can span multiple lines.
]]

print(singleQuote)
print(doubleQuote)
print(multiLine)

-- Concatenation
local name = "Lua"
local version = 5.4
local welcome = "Welcome to " .. name .. " version " .. version .. "!"
print(welcome)

-- Escape sequences
print("Line1\nLine2\tTabbed\nA quote: \"Hello\"")


--[[ =============== [ String Functions ] ===============
    Common string library functions:
    1. string.len(s) or #s: Length of string
    2. string.upper(s), string.lower(s): Change case
    3. string.sub(s, i, j): Substring
    4. string.find(s, pattern): Find pattern
    5. string.gsub(s, pattern, repl): Replace
    6. string.reverse(s): Reverse string
    7. string.format(fmt, ...): Formatted string
]]

local s = "Lua Programming"
print("Length:", #s)
print("Length (using string.len):", string.len(s))
print("Upper:", string.upper(s))
print("Lower:", string.lower(s))
print("Sub (5-15):", string.sub(s, 5, 15))
print("Find 'gram':", string.find(s, "gram"))
print("Replace 'Lua' with 'Python':", string.gsub(s, "Lua", "Python"))
print("Reverse:", string.reverse(s))

-- String formatting
local lang = "Lua"
local ver = 5.4
print(string.format("%s version %.1f", lang, ver))

-- =============== [ String to Number and Number to String ] ===============
local numStr = "123"
local num = tonumber(numStr)
print(num + 1)  -- 124
print(tostring(num) .. " is a string now")

-- =============== [ Multi-line and Raw Strings ] ===============
-- Use [[ ... ]] for multi-line or raw strings (no escape sequences processed).
local raw = [[
C:\Users\Name\Documents\file.txt
This is a raw string with no escape processing.
]]
print(raw)



--[[   =============== [ String Comparison ] ===============
    In Lua, strings can be compared using relational operators.
    The comparison is based on the lexicographical order (dictionary order).
    The operators used for string comparison are:
        ==  (equal to)
        ~=  (not equal to)
        <   (less than)
        >   (greater than)
        <=  (less than or equal to)
        >=  (greater than or equal to)
    
    For multiLine strings, the same operators apply.
]]
local str1 = "Hello"
local str2 = "World"
print("Is str1 equal to str2?", str1 == str2)  -- false
print("Is str1 not equal to str2?", str1 ~= str2)  -- true
print("Is str1 less than str2?", str1 < str2)  -- true (based on lexicographical order)
print("Is str1 less than or equal to str2?", str1 <= str2)  -- true