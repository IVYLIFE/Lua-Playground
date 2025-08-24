--[[
==============================================
    * utils/timer.lua
    * SECTION: love.timer
    * Delta time, FPS, sleep
    * The love.timer module handles timing and framerate in LÖVE2D.
==============================================
--]]



--[[ ============= [1 timer.getDelta(dtPassThrough)] =============
Purpose:
    Return the delta time (dt). In LÖVE, dt is passed to love.update(dt).
    This helper just returns the provided dt (for consistent access in utilities)
    or calls love.timer.getDelta() if not provided.

    Arguments: dtPassThrough (number, optional)
Returns: dt (number, seconds)
Example:
    function love.update(dt)
        local d = love.timer.getDelta(dt)
    end
---]]

local getDelta = function(dtPassThrough)
    if dtPassThrough ~= nil then return dtPassThrough end
    return love.timer.getDelta() -- Note: returns time since last call to this function
end



--[[ ============= [2 timer.getFPS()] =============
Purpose: Get current frames per second.
Returns: fps (number)
Example: local fps = love.timer.getFPS()
---]]

local getFPS = function()
    return love.timer.getFPS()
end



--[[ ============= [3 timer.sleep(seconds)] =============
Purpose: Sleep/block for a duration (useful for throttling or pausing).
Arguments: seconds (number)
Returns: None.
Example: love.timer.sleep(0.1) -- 100ms
---]]

local sleep = function(seconds)
    love.timer.sleep(seconds)
end



-- ==============================================

local TIMER    = {}

TIMER.getDelta = getDelta
TIMER.getFPS   = getFPS
TIMER.sleep    = sleep

return TIMER

-- ==============================================
