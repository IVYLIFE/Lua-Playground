--[[
==============================================
    * main.lua
    * This file serves as the main entry point for the Lua application.
    * It initializes the environment and executes scripts.
    * This file could include 
        configuration settings, 
        utility function imports, 
        and other setup code.
==============================================
--]]



-- Configuration settings
local config = {
    PLAYGROUND_NAME = "Lua Playground",
    MAX_SCRIPT_SIZE = 1024 -- Maximum size of scripts in bytes
    -- Add more configuration settings as needed
}

-- Load utility functions
local UTILS = require("utils")


-- Main function to start the playground
local function main()
    print("Initializing Lua Playground...")

    local rawString = "  Lua Playground  "

    -- Trim whitespace from the start and end of the string
    local trimmedString = UTILS.TRIM(rawString)
    print("Trimmed string:", trimmedString)

    -- Additional main logic can be added here
end

-- Execute the main function
main()