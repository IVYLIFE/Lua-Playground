
-- ===========================================================
-- This file explains file handling in Lua.
-- ===========================================================

--[[
    =============== [ File I/O in Lua ] ===============
    1. Use io.open(filename, mode) to open files.
    2. Modes: "r" (read), "w" (write), "a" (append), "rb", "wb", etc.
    3. Always check if file was opened successfully.
    4. Use file:read(), file:write(), file:close().
    5. Use io.lines for line-by-line reading.
    6. Always close files to avoid resource leaks.
]]

-- Writing to a file
local file = io.open("test.txt", "w")
if file then
    file:write("Hello, Lua file!\n")
    file:close()
else
    print("Failed to open file for writing.")
end

-- Reading from a file
file = io.open("test.txt", "r")
if file then
    local content = file:read("*a")
    print("File content:", content)
    file:close()
else
    print("Failed to open file for reading.")
end

-- Appending to a file
file = io.open("test.txt", "a")
if file then
    file:write("Appended line.\n")
    file:close()
end

-- Reading line by line
file = io.open("test.txt", "r")
if file then
    print("Reading lines:")
    for line in file:lines() do
        print(line)
    end
    file:close()
end

-- Using io.lines (auto closes file)
for line in io.lines("test.txt") do
    print("io.lines:", line)
end
