
--[[
    =============== [ Custom Modules in Lua ] ===============
    1. Modules are just Lua files that return a table of functions/values.
    2. Use require("modulename") to import (without .lua extension).
    3. Module search path is package.path.
    4. Each module is loaded once (cached).
    5. Use local for module imports to avoid polluting global scope.
]]

-- Example module (utils.lua):
-- local utils = {}
-- function utils.greet(name)
--     print("Hello, " .. name)
-- end
-- return utils

-- Using a custom module
local utils = require("utils")
utils.greet("Lua user")

-- You can also assign functions directly:
-- local greet = require("utils").greet
-- greet("Direct call!")