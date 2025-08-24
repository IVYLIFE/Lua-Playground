--[[
==============================================
    * SECTION: love.event
    * Polling, pushing, quitting
    * The love.event module handles all event-related operations in LÖVE2D.
==============================================
--]]



--[[ ============= [1 event.quit(exitCode)] =============
Purpose: Request the game to quit.
Arguments: exitCode (number, optional): process exit code (default 0)
Returns: None.
Example:
    love.event.quit()
    if someCondition then UTILS.event.quit() end
Notes:
    * This posts a quit event; app may still intercept via love.quit().
    * In many apps, using `love.event.quit()` is cleaner than os.exit().
---]]

local quit = function(code)
    love.event.quit(code or 0)
end



--[[ ============= [2 event.push(name, ...)] =============
Purpose: Push a custom event onto the queue (for polling later).
Arguments:
    name (string): event name
    ...  (any):   event arguments
Returns: None.
Example:
    love.event.push("custom_message", "hello", 123)
    for name, a, b in love.event.poll() do ... end
---]]

local push = function(name, ...)
    love.event.push(name, ...)
end



--[[ ============= [3 event.poll(handlerFn)] =============
Purpose: Poll events and optionally handle them via callback.
Arguments: handlerFn (function, optional): function(name, a, b, c, d, e, f)
Returns: None.
Example:
    love.event.poll(
        function(name, a, b, c)
            if name == "quit" then print("Quitting...") end
        end
    )
---]]

local poll = function(handler)
    for name, a, b, c, d, e, f in love.event.poll() do
        if handler then handler(name, a, b, c, d, e, f) end
    end
end



-- ==============================================

local EVENT = {}

EVENT.quit = quit
EVENT.push = push
EVENT.poll = poll

return EVENT

-- ==============================================
