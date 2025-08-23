-- utils.lua
-- This file contains utility functions that can be reused throughout the project.
-- You can include functions for:
-- 1. String manipulation (e.g., trimming, splitting, joining strings)
-- 2. Mathematical operations (e.g., calculating averages, random number generation)
-- 3. General helper functions (e.g., checking if a value is in a table, deep copying tables)

-- Example function: Trimming whitespace from a string
function TRIM(s)
    return s:match("^%s*(.-)%s*$")
end

-- Example function: Splitting a string by a delimiter
function SPLIT(s, delimiter)
    local result = {}
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

-- Add more utility functions as needed.