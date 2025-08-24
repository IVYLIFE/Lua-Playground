--[[
==============================================
    * SECTION: love.keyboard
    * Key states, pressed/released dispatching
    * The love.keyboard module handles keyboard input in LÖVE2D.
==============================================
--]]



local KEYBOARD = {}
local _pressedHandlers = {}
local _releasedHandlers = {}



--[[ ============= [1 keyboard.isDown(keyOrTable, ...)] =============
Purpose: Check if one or more keys are held down.

Arguments:
    keyOrTable:
        - string key name ("space", "left", "a", etc.)
        - OR table of keys { "left", "right" }
    ...:
        - additional keys if first arg is a string

Returns: boolean (true if *all* provided keys are down)

Examples:
    if love.keyboard.isDown("space") then ...
    if love.keyboard.isDown({"lshift", "a"}) then ...
---]]

local isDown = function(keyOrTable, ...)
    if type(keyOrTable) == "table" then
        for _, k in ipairs(keyOrTable) do
            if not love.keyboard.isDown(k) then return false end
        end
        return true
    else
        local keys = { keyOrTable, ... }
        for _, k in ipairs(keys) do
            if not love.keyboard.isDown(k) then return false end
        end
        return true
    end
end



--[[ ============= [2 keyboard.onPressed(fn)] =============
Purpose:
    Register a handler for key presses.
    Will provide a global love.keypressed dispatcher if not present.
Arguments: fn (function): function(key, scancode, isrepeat)
Returns: None.
Usage: KEYBOARD.onPressed(function(key) print("down", key) end)
---]]

local onPressed = function(fn)
    table.insert(_pressedHandlers, fn)
end



--[[ ============= [3 keyboard.onReleased(fn)] =============
Purpose: Register a handler for key releases.
Arguments: fn (function): function(key, scancode)
Usage: KEYBOARD.onReleased(function(key) print("up", key) end)
---]]

local onReleased = function(fn)
    table.insert(_releasedHandlers, fn)
end



--[[ ============= [4 keyboard global key event dispatch] =============
Purpose:
    Hook global callbacks for keypressed and keyreleased.
    Non-invasive if user already set them.
---]]

local _user_keypressed = love.keypressed
local _user_keyreleased = love.keyreleased

love.keypressed = function(key, scancode, isrepeat)
    if _user_keypressed then _user_keypressed(key, scancode, isrepeat) end
    for _, fn in ipairs(_pressedHandlers) do
        fn(key, scancode, isrepeat)
    end
end

love.keyreleased = function(key, scancode)
    if _user_keyreleased then _user_keyreleased(key, scancode) end
    for _, fn in ipairs(_releasedHandlers) do
        fn(key, scancode)
    end
end


-- ==============================================

KEYBOARD.isDown     = isDown
KEYBOARD.onPressed  = onPressed
KEYBOARD.onReleased = onReleased

return KEYBOARD

-- ==============================================
