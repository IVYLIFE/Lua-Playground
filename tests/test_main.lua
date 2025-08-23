-- tests/test_main.lua
-- This file is for unit tests related to the main application logic.
-- It could include test cases to ensure that the functions in main.lua work as expected.

-- Example test case structure:
-- function test_function_name()
--     -- Arrange: Set up any necessary preconditions or inputs
--     
--     -- Act: Call the function being tested
--     
--     -- Assert: Verify that the function behaves as expected
-- end

-- To run the tests, you might want to use a testing framework or write your own test runner.

local status, cjson = pcall(require, "cjson.safe")

if not status then
    print("cjson.safe NOT found!")
else
    print("cjson.safe loaded successfully!")

    -- Test encoding a Lua table to JSON
    local tbl = { name = "Himanshu", age = 25, active = true }
    local json_str = cjson.encode(tbl)
    print("Encoded JSON:", json_str)

    -- Test decoding JSON back to Lua table
    local decoded = cjson.decode(json_str)
    print("Decoded table:", decoded.name, decoded.age, decoded.active)
end