-- ===========================================================
-- This file contains fundamental concepts of Lua programming.
-- ===========================================================


-- Single-line comments start with --
-- Multi-line comments are enclosed in --[[ and --]]


--[[ =============== [ Comments and Printing ] ===============
    1. Comments in Lua can be single-line or multi-line.
    2. The print function can take multiple arguments and prints them separated by a tab space.
    3. Comma separated printing includes a tab space between each value.
    4. Concatenation is done using the .. operator.
    5. The string.format function is used for formatted output.
    6. Concatenation of nil values will result in error.
]]

--[[ ===================== [ Variables ] =====================
    Lua supports several variable types, including:
    1. Number: Represents both integers and floating-point numbers.
    2. String: Represents a sequence of characters.
    3. Boolean: Represents true or false values.
    4. Table: Represents a collection of key-value pairs or an array.
    5. Function: Represents a callable function.
    6. Nil: Represents a variable that has no value.
    7. Userdata: Represents a data structure created by C code.
    8. Variables can be assigned values of any type, and Lua is dynamically typed.

    Local variables are declared using the local keyword.
    Global variables starts with a capital letter or are declared without the local keyword.
    Global variables are also declared by _G.<variable_name> and can be accessed in other files.
]]

--[[ ================== [ Print Formatting ] =================
    1. %s is used for strings.
    2. %d is used for integers.
    3. %f is used for floating-point numbers.
    4. %x is used for hexadecimal numbers.
    5. %c is used for characters.
    6. %p is used for pointers (memory addresses).
    7. %.[precision]f is used to format floating-point numbers to a specific number of decimal places. eg: %.2f
    8. %-[width]s is used to left-align a string within a specified width. eg: %-10s
    9. %[width]d is used to pad an integer with spaces, right aligned. eg: %5d
    10. %0[width]d is used to pad an integer with leading zeros. eg: %05d
]]

--[[ ================ [Type Casting/Conversion] ==============
    1. tonumber: Converts a string to a number.
    2. tostring: Converts a value to a string.
    3. All values except false and nil are considered true in boolean context.
    4. The type function returns the type of a variable.
    5. Lua automatically converts between types when necessary, 
       such as when performing arithmetic operations on strings that represent numbers.
    6. Lua does not have strict typing, so variables can change types dynamically.
]]




-- ================ [ Variables Declaration ] ================

local nilVariable = nil
local integer = 100
local number = 42

local float = 100.5
local PI = 3.14

local string = "Hello, Lua!"
local text = "Hello, World!"
local multilineText = [[
    This is a multi-line string.
    It can span multiple lines.
]]


local boolean = true
local isActive = true

local lua = "Lua"

local table = {1, 2, 3, 4, 5}
local mixTable = {1, "two", 3.0, true}

local tableWithKeys = {
    key1 = "value1",
    key2 = "value2",
    key3 = "value3",
    name = "Lua",
    version = 5.4,
    isActive = true
}

-- Multi Variables Initilization
local firstName, lastName = "Skinny", "Sky"

-- ===========================================================




-- =================== [ Print Statement ] ===================
-- print("Concatenation of nil:", "Hello" .. nilVariable)  -- This will result in an error
print("\n")
print("Name : " .. firstName .. " " .. lastName)
print("Nil Variable:", nilVariable, "Type:", type(nilVariable))
print("Number:", number, "Type:", type(number))
print("Float:", float, "Type:", type(float))
print("String:", string, "Type:", type(string))
print("Boolean:", boolean, "Type:", type(boolean), "\n")

-- Printing a variable with concatenation
print("Programming Language: " .. lua)
print("Value of PI: " .. PI)
print("Welcome to " .. tableWithKeys.name .. " programming!")
print("The value of PI is approximately: " .. tostring(math.pi))


-- Printing Tables by variable name will show their memory address
print("\n==============================\n")
print("Table:", table, "Type:", type(table))
print("Mixed Table:", mixTable, "Type:", type(mixTable))
print("Table with Keys:", tableWithKeys, "Type:", type(tableWithKeys))
print("\n==============================\n")


-- To print the contents of a table, we can use a loop
print("\nContents of 'table':")
for i, v in ipairs(table) do
    print("Index:", i, "Value:", v)
end

print("\nContents of 'mixTable':")
for i, v in ipairs(mixTable) do
    print("Index:", i, "Value:", v)
end

print("\nContents of 'tableWithKeys':")
for k, v in pairs(tableWithKeys) do
    print("Key:", k, "Value:", v)
end

-- ===========================================================




-- =================== [ String Formatting ] =================

local formattedString = string.format("Formatted Output: Number = %d, Text = %s, Active = %s", number, text, tostring(isActive))
print("\n" .. formattedString)

formattedString = string.format("The programming language is %s, version %.1f", tableWithKeys.name, tableWithKeys.version)
print("\n" .. formattedString)

print(string.format("%-10s %5d", "Score:", 7))      -- Score:         7
print(string.format("%10s %05d", "ID:", 42))        --        ID: 00042
print(string.format("Value: %.2f", 3.14159))        -- Value: 3.14
print(string.format("%-8s %5d  Type: %s", "Integer:", integer, type(integer)), "\n")

-- ===========================================================




-- ================ [ Type Casting/Conversion ] ==============
print("\n5" + 3)      -- Output: 8 (string "5" is converted to number)
print("5" .. 3)     -- Output: 53 (number 3 is converted to string)

local num = 42
print(tostring(num), type(num))

local str = "123"
print(tonumber(str) + 1)  -- Output: 124
print(tonumber("abc"))  -- Output: nil


