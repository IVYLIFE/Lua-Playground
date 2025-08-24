--[[
==============================================
    * SECTION: love.mouse
    * Position, buttons, wheel, pressed/released handlers
    * The love.mouse module handles all mouse-related operations in LÖVE2D.
==============================================
]]



local MOUSE = {
    _pressedHandlers = {},
    _releasedHandlers = {},
    _movedHandlers = {},
    _wheelHandlers = {},
}



--[[ ============= [1 mouse.getX(), getY(), getPosition()] =============
Purpose: Query mouse position relative to the window.
Returns:
    x (number) OR
    y (number) OR
    getPosition() → x,y
Example: local x, y = MOUSE.getPosition()
]]

local get_x = function() return love.mouse.getX() end
local get_y = function() return love.mouse.getY() end
local get_position = function() return love.mouse.getPosition() end



--[[ ============= [2 mouse.isDown(button)] =============
Purpose: Check if a mouse button is being held.
Arguments: 
    button (number/string):
        1 left,
        2 right,
        3 middle,
        or "l","r","m" (helper)
Returns: boolean
Example: if MOUSE.isDown(1) then ...
---]]

local is_down = function(button)
    if type(button) == "string" then
        if button == "l" then
            button = 1
        elseif button == "r" then
            button = 2
        elseif button == "m" then
            button = 3
        end
    end
    return love.mouse.isDown(button)
end



--[[ ============= [3 mouse.onPressed(fn), onReleased(fn), onMoved(fn), onWheelMoved(fn)] =============
Purpose: Register handler for mouse press/release/move/wheel.
Arguments:
    onPressed : fn (function): function(x, y, button, istouch, presses)
    onReleased : fn (function): function(x, y, button, istouch, presses)
    onMoved : fn (function): function(x, y, dx, dy, istouch)
    onWheelMoved : fn (function): function(dx, dy)

Example:
    MOUSE.onPressed(function(x, y, btn) print("mouse down", btn) end)
    MOUSE.onReleased(function(x, y, btn) print("mouse up", btn) end)
    MOUSE.onMoved(function(x, y, ,dx, dy, istouch) print("mouse moved", x, y, dx, dy, istouch) end)
    MOUSE.onWheelMoved(function(dx, dy) print("mouse wheel moved", dx, dy) end)

Notes:
    * In LÖVE 11.x, 'presses' counts successive clicks.
---]]

local on_pressed = function(fn)
    table.insert(MOUSE._pressedHandlers, fn)
end

local on_released = function(fn)
    table.insert(MOUSE._releasedHandlers, fn)
end

local on_moved = function(fn)
    table.insert(MOUSE._movedHandlers, fn)
end

local on_wheel_moved = function(fn)
    table.insert(MOUSE._wheelHandlers, fn)
end



-- Hook global mouse callbacks
local _user_mousepressed = love.mousepressed
local _user_mousereleased = love.mousereleased
local _user_mousemoved = love.mousemoved
local _user_wheelmoved = love.wheelmoved


love.mousepressed = function(x, y, button, istouch, presses)
    if _user_mousepressed then _user_mousepressed(x, y, button, istouch, presses) end
    for _, fn in ipairs(MOUSE._pressedHandlers) do
        fn(x, y, button, istouch, presses)
    end
end

love.mousereleased = function(x, y, button, istouch, presses)
    if _user_mousereleased then _user_mousereleased(x, y, button, istouch, presses) end
    for _, fn in ipairs(MOUSE._releasedHandlers) do
        fn(x, y, button, istouch, presses)
    end
end

love.mousemoved = function(x, y, dx, dy, istouch)
    if _user_mousemoved then _user_mousemoved(x, y, dx, dy, istouch) end
    for _, fn in ipairs(MOUSE._movedHandlers) do
        fn(x, y, dx, dy, istouch)
    end
end

love.wheelmoved = function(dx, dy)
    if _user_wheelmoved then _user_wheelmoved(dx, dy) end
    for _, fn in ipairs(MOUSE._wheelHandlers) do
        fn(dx, dy)
    end
end



-- ==============================================

MOUSE.getX = get_x
MOUSE.getY = get_y
MOUSE.getPosition = get_position
MOUSE.isDown = is_down
MOUSE.onPressed = on_pressed
MOUSE.onReleased = on_released
MOUSE.onMoved = on_moved
MOUSE.onWheelMoved = on_wheel_moved

return MOUSE

-- ==============================================
