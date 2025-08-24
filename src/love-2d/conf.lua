--[[
    conf.lua
    LÖVE2D configuration file
    This file lets you set up your game's window, version, modules, and more before it starts.
]]


---@param t table # The configuration table provided by LÖVE2D
function love.conf(t)
    -- Set the LÖVE version this game was made for
    t.identity                  = "data/saves"        -- The identity of the game (used for saving)
    t.version                   = "11.5"              -- Specify the LÖVE version
    t.console                   = true                -- Enable/Disable the console (Windows only, useful for debugging)

    -- Window settings
    t.window.title              = "My Awesome Game"   -- Window title
    t.window.width              = 1024                -- Window width in pixels (16:9)
    t.window.height             = 576                 -- Window height in pixels (16:9)
    t.window.resizable          = false               -- Allow the user to resize the window
    t.window.fullscreen         = false               -- Start in fullscreen mode?


    --[[
        Add any additional configuration options here

        [1] Window Settings
        t.window.icon           = "icon-path"        -- Set the window icon
        t.window.x              = nil                -- Set the window position (x)
        t.window.y              = nil                -- Set the window position (y)
        t.window.minwidth       = 400                -- Minimum window width
        t.window.minheight      = 300                -- Minimum window height
        t.window.borderless     = false              -- Set to true to enable borderless window
        t.window.vsync          = 1                  -- Enable vertical sync (0 = off, 1 = on)
        t.window.msaa           = 0                  -- Number of MSAA samples (anti-aliasing)
        t.window.highdpi        = false              -- Enable high-DPI mode (Retina)
        t.window.display        = 1                  -- Which display to open the window on (1 = primary, 2 = secondary, etc.)


        [2] Modules Settings | Set to false to disable a module | disable unused modules for smaller size and faster load
        t.modules.joystick      = true               -- Enable joystick support
        t.modules.audio         = true               -- Enable audio
        t.modules.keyboard      = true               -- Enable keyboard
        t.modules.event         = true               -- Enable event handling
        t.modules.image         = true               -- Enable image handling
        t.modules.graphics      = true               -- Enable graphics
        t.modules.timer         = true               -- Enable timer
        t.modules.mouse         = true               -- Enable mouse
        t.modules.sound         = true               -- Enable sound
        t.modules.thread        = true               -- Enable threading
        t.modules.physics       = true               -- Enable physics
        t.modules.video         = true               -- Enable video
        t.modules.touch         = true               -- Enable touch
        t.modules.system        = true               -- Enable system module
        t.modules.window        = true               -- Enable window module
        t.modules.timer         = true               -- Enable timer module
        t.audio.mic             = false              -- Set to true to enable microphone access

        [3] Miscellaneous Settings
        t.externalstorage       = false              -- Set to true to enable external storage (Android only)
        t.gammacorrect          = false              -- Set to true to enable gamma correction
    ]]
end


--[[
    Resolution Options and Details
    
    1. Common Resolutions:
       - 1920x1080 (Full HD)
       - 1280x720 (HD)
       - 2560x1440 (2K)
       - 3840x2160 (4K)
       - 800x600 (SVGA)
       - 1024x768 (XGA)

    2. Aspect Ratios:
       - 16:9 (Widescreen) : eg - 1280x720,  1920x1080, 2560x1440, 3840x2160
       - 4:3 (Standard) :    eg - 320x240, 640x480, 800x600, 1024x768
       - 21:9 (Ultrawide) :  eg - 2560x1080, 3840x1600, 5120x2160

    3. Custom Resolutions:
       - You can specify custom resolutions in the love.conf file.
       - Example: t.window.width = 1600; t.window.height = 900
]]