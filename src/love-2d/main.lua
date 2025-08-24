-- Entry point for your LÖVE2D game

-- Load the LÖVE2D module and utilities
_G.LOVE = require("love")
local UTILS = require("utils.utils")


print("LÖVE2D Game Initialized")
print("Package Path: ", package.path)
print("Using utilities from:", UTILS)

UTILS.GRAPHICS.setBackgroundColor(1, 0, 1, 0.5)
UTILS.WINDOWS.setTitle("My Game")
-- UTILS.TIMER.sleep(0.1)




-- 1. Global variables and setup
local message = "Hello, LÖVE2D!" -- Example message to display
local msg_x, msg_y = 0, 0        -- Position for the message

-- 2. LOVE.load: Initialization (runs once at the start)
LOVE.load = function()
    -- Center the message on the screen
    local window_width = LOVE.graphics.getWidth()
    local window_height = LOVE.graphics.getHeight()
    local font = LOVE.graphics.getFont()

    local text_width = font:getWidth(message)
    local text_height = font:getHeight()

    msg_x = (window_width - text_width) / 2
    msg_y = (window_height - text_height) / 2

    -- Print to terminal/console for debugging
    print("Game loaded! Window size: " .. window_width .. "x" .. window_height)
end

-- 3. LOVE.update: Game logic (runs every frame)
LOVE.update = function(dt)
    -- Update your game state here (dt = delta time in seconds)
    -- Example: Move objects, handle timers, etc.
end

-- 4. LOVE.draw: Rendering (runs every frame)
LOVE.draw = function()
    -- Draw the message centered on the screen
    LOVE.graphics.setColor(1, 1, 1) -- Set color to white
    LOVE.graphics.print(message, msg_x, msg_y)

    -- Optionally, draw instructions
    LOVE.graphics.setColor(0.7, 0.7, 0.7)
    LOVE.graphics.print("Press ESC to quit.", 10, LOVE.graphics.getHeight() - 30)
end

-- 5. LOVE.keypressed: Handle keyboard input (optional)
LOVE.keypressed = function(key)
    if key == "escape" then
        LOVE.event.quit() -- Quit the game when ESC is pressed
    end
end
