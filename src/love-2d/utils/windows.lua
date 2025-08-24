--[[
==============================================
    * utils/windows.lua
    * SECTION: love.window
    * Window title, size, mode, fullscreen, DPI
    * The love.window module handles window management in LÖVE2D.
==============================================
--]]



--[[ ============= [1 window.setTitle(title)] =============
Purpose: Set the OS window title.
Arguments: title (string)
Example: love.window.setTitle("Lua Playground - LÖVE")
---]]

local setTitle = function(title)
    love.window.setTitle(title)
end



--[[ ============= [2 window.setMode(width, height, flags)] =============
Purpose: Configure the window size and options.
Arguments:
    width, height (number): window size in pixels
    flags (table, optional): {
        fullscreen = false/true,
        fullscreentype = "desktop"/"exclusive",
        vsync = 1 or 0 or -1,
        msaa = 0, 2, 4, 8,
        resizable = true/false,
        borderless = true/false,
        centered = true/false,
        display = 1, -- monitor index
        highdpi = true/false
    }
Returns: success (bool)
Example: love.window.setMode(1280, 720, {resizable=true, vsync=1})
---]]

local setMode = function(w, h, flags)
    return love.window.setMode(w, h, flags or {})
end



--[[ ============= [3 window.getMode()] =============
Purpose: Get current window size and flags.
Returns: width, height, flagsTable
Example: local w, h, flags = love.window.getMode()
---]]

local getMode = function()
    return love.window.getMode()
end


--[[ ============= [4 window.setFullscreen(enable, fstype)] =============
Purpose: Toggle fullscreen.
Arguments:
    enable (boolean)
    fstype (string, optional): "desktop" or "exclusive"
Returns: success (bool)
Example: love.window.setFullscreen(true, "desktop")
---]]

local setFullscreen = function(enable, fstype)
    return love.window.setFullscreen(enable, fstype)
end


--[[ ============= [5 window.getFullscreen()] =============
Purpose: Query whether fullscreen is enabled and type.
Returns: enabled (bool), fstype (string)
Example: local on, ty = love.window.getFullscreen()
---]]

local getFullscreen = function()
    return love.window.getFullscreen()
end



-- ==============================================

local WINDOW = {}

WINDOW.setTitle      = setTitle
WINDOW.setMode       = setMode
WINDOW.getMode       = getMode
WINDOW.setFullscreen = setFullscreen
WINDOW.getFullscreen = getFullscreen

return WINDOW

-- ==============================================
