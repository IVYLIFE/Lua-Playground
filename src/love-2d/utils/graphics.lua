--[[
==============================================
    * SECTION: love.graphics
    * Drawing shapes, text, images, canvases, transforms
    * The love.graphics module handles all drawing operations in LÖVE2D.
==============================================
--]]



--[[ ============= [1 graphics.setColor(r, g, b, a)] =============
Purpose:
    Set the current drawing color used by love.graphics.* calls
    (rectangle, circle, text, image tint, etc.).

Arguments:
    r (number, required): red   component in [0..1]
    g (number, required): green component in [0..1]
    b (number, required): blue  component in [0..1]
    a (number, optional): alpha component in [0..1], default = 1

Returns: None.

Notes:
    * Applies to subsequent drawing operations until changed again.
    * For text/images, this multiplies with their color (tint).
    * In LÖVE 11.x the color space is normalized (0..1).

Example:
    love.graphics.setColor(1, 0, 0)         -- pure red
    love.graphics.rectangle("fill", 10, 10, 80, 40)
    love.graphics.setColor(1, 1, 1)         -- reset to white (no tint)
---]]

local setColor = function(r, g, b, a)
    print("Setting color:", r, g, b, a)
    love.graphics.setColor(r, g, b, a or 1)
end



--[[ ============= [2 graphics.getColor()] =============
Purpose: Get the current drawing color.
Arguments: None.
Returns: r, g, b, a (numbers in [0..1])
Example: local r, g, b, a = love.graphics.getColor()
---]]

local getColor = function()
    return love.graphics.getColor()
end



--[[ ============= [3 graphics.resetColor()] =============
Purpose: Reset the drawing color to white (1,1,1,1).
Arguments: None.
Returns: None.
Example: love.graphics.resetColor()
---]]

local resetColor = function()
    love.graphics.setColor(1, 1, 1, 1)
end



--[[ ============= [4 graphics.setBackgroundColor(r, g, b, a)] =============
Purpose: Set the window background color used when clearing the screen.

Arguments:
    r (number): red   [0..1]
    g (number): green [0..1]
    b (number): blue  [0..1]
    a (number, optional): alpha [0..1], default = 1

Returns: None.
Example: love.graphics.setBackgroundColor(0.08, 0.09, 0.11)
---]]

local setBackgroundColor = function(r, g, b, a)
    love.graphics.setBackgroundColor(r, g, b, a or 1)
end



--[[ ============= [5 graphics.clear([r, g, b, a])] =============
Purpose: Clear the screen (or active canvas). If color provided, clears to it.
Arguments: r, g, b, a (numbers in [0..1], optional). If omitted uses backgroundColor.
Returns: None.
Example:
    love.graphics.clear()  -- Clear to current background color:
    love.graphics.clear(0, 0, 0, 1)  -- Clear to custom color:
---]]

local clear = function(r, g, b, a)
    if r then
        love.graphics.clear(r, g, b, a or 1)
    else
        love.graphics.clear()
    end
end



--[[ ============= [6 graphics.rectangle(mode, x, y, w, h, rx, ry, segments)] =============
Purpose: Draw a rectangle, optionally rounded.
Arguments:
    mode (string, required): "fill" or "line"
    x, y (number, required): top-left position
    w, h (number, required): width, height
    rx, ry (number, optional): corner radii for rounded rects (default nil → no rounding)
    segments (number, optional): curve detail (default auto)
Returns: None.
Example:
    love.graphics.setColor(0.2, 0.7, 0.9)
    love.graphics.rectangle("fill", 50, 50, 120, 60)
    love.graphics.setColor(1, 1, 1)
---]]

local rectangle = function(mode, x, y, w, h, rx, ry, segments)
    love.graphics.rectangle(mode, x, y, w, h, rx, ry, segments)
end



--[[ ============= [7 graphics.circle(mode, x, y, radius, segments)] =============
Purpose: Draw a circle.
Arguments:
    mode (string): "fill" or "line"
    x, y (number): circle center
    radius (number): radius
    segments (number, optional): edge detail (default auto)
Returns: None.
Example: love.graphics.circle("line", 200, 200, 40)
---]]

local circle = function(mode, x, y, radius, segments)
    love.graphics.circle(mode, x, y, radius, segments)
end



--[[ ============= [8 graphics.ellipse(mode, x, y, rx, ry, segments)] =============
Purpose: Draw an ellipse.
Arguments:
    mode (string): "fill" or "line"
    x, y (number): center position
    rx, ry (number): radii on X and Y axes
    segments (number, optional): curve detail
Returns: None.
Example: love.graphics.ellipse("fill", 300, 200, 80, 40)
---]]

local ellipse = function(mode, x, y, rx, ry, segments)
    love.graphics.ellipse(mode, x, y, rx, ry, segments)
end



--[[ ============= [9 graphics.line(x1, y1, x2, y2, ...)] =============
Purpose: Draw one or more line segments through a list of points.
Arguments: x1, y1, x2, y2, ... (numbers): sequence of points.
Returns: None.
Example: love.graphics.line(10,10, 60,30, 120,70)
---]]

local line = function(...)
    love.graphics.line(...)
end



--[[ ============= [10 graphics.points(x1, y1, x2, y2, ...)] =============
Purpose: Draw points at specified coordinates.
Arguments: x1, y1, ... (numbers): coordinates
Returns: None.
Example: love.graphics.points(100,100, 110,110, 120,100)
---]]

local points = function(...)
    love.graphics.points(...)
end



--[[ ============= [11 graphics.polygon(mode, x1, y1, ...)] =============
Purpose: Draw a polygon from a list of points.
Arguments:
    mode (string): "fill" or "line"
    x1, y1, x2, y2, ... (numbers): vertices.
Returns: None.
Example: love.graphics.polygon("line", 150,150, 200,180, 180,220)
---]]

local polygon = function(mode, ...)
    love.graphics.polygon(mode, ...)
end



--[[ ============= [12 graphics.print(text, x, y, ...)] =============
Purpose: Render text at a position with optional rotation/scale/shear.
Arguments:
    text (string)
    x, y (number)
    r (number, optional): rotation radians (default 0)
    sx, sy (number, optional): scale factors (default 1,1)
    ox, oy (number, optional): origin offset (default 0,0)
    kx, ky (number, optional): shear factors (default 0,0)
Returns: None.
Example: love.graphics.print("Hello", 20, 20)
---]]

local printText = function(text, x, y, r, sx, sy, ox, oy, kx, ky)
    love.graphics.print(
        text,
        x or 0,
        y or 0,
        r or 0,
        sx or 1,
        sy or 1,
        ox or 0,
        oy or 0,
        kx or 0,
        ky or 0
    )
end



--[[ ============= [13 graphics.printf(text, x, y, limit, align, ...)] =============
Purpose: Render wrapped/aligned text within a max width.
Arguments:
    text (string)
    x, y (number)
    limit (number): max line width before wrapping
    align (string): "left", "center", "right", "justify"
    [transform args like print]
Returns: None.
Example: love.graphics.printf("This will wrap", 50, 60, 200, "center")
---]]

local printf = function(text, x, y, limit, align, r, sx, sy, ox, oy, kx, ky)
    love.graphics.printf(
        text,
        x,
        y,
        limit,
        align,
        r or 0,
        sx or 1,
        sy or 1,
        ox or 0,
        oy or 0,
        kx or 0,
        ky or 0
    )
end



--[[ ============= [14 graphics.newFont(sizeOrFilename, size)] =============
Purpose: Create a new Font (from size or from file).
Arguments:
    sizeOrFilename:
        - number → built-in font at that size (px)
        - string → path to .ttf/.otf (requires size)
    size:
        - number (required when first arg is a filename)
Returns: Font object.
Examples:
    local f1 = love.graphics.newFont(16)
    local f2 = love.graphics.newFont("assets/Roboto-Regular.ttf", 18)
---]]

local newFont = function(sizeOrFilename, size)
    if type(sizeOrFilename) == "number" then
        return love.graphics.newFont(sizeOrFilename)
    else
        return love.graphics.newFont(sizeOrFilename, size)
    end
end



--[[
============= [15 graphics.setFont(font)] =============
Purpose: Set the active font for text rendering.
Arguments: font (Font): a LÖVE Font object
Returns: None.
Example:
    local f = love.graphics.newFont(18)
    love.graphics.setFont(f)
---]]

local setFont = function(font)
    love.graphics.setFont(font)
end



--[[ ============= [16 graphics.getFont()] =============
UTILS.graphics.getFont()
Purpose: Get current active font.
Returns: Font.
Example: local f = UTILS.graphics.getFont()
---]]

local getFont = function()
    return love.graphics.getFont()
end



--[[ ============= [17 graphics.newImage(path)] =============
Purpose: Load an image from filesystem into a drawable Image.
Arguments: path (string): path relative to the LÖVE game directory.
Returns: Image.
Example: local img = love.graphics.newImage("assets/player.png")
---]]

local newImage = function(path)
    return love.graphics.newImage(path)
end



--[[ ============= [18 graphics.draw(drawable, x, y, ...)] =============
Purpose: Draw an Image/Canvas/Drawable with optional transform.
Arguments:
    drawable (Image/Canvas/Drawable)
    x, y (number, default 0,0)
    r (number, optional rotation)
    sx, sy (number, default 1,1)
    ox, oy (origin offset), kx, ky (shear)
Returns: None.
Example: love.graphics.draw(img, 100, 120, 0, 2, 2, img:getWidth()/2, img:getHeight()/2)
---]]

local draw = function(drawable, x, y, r, sx, sy, ox, oy, kx, ky)
    love.graphics.draw(
        drawable,
        x or 0,
        y or 0,
        r or 0,
        sx or 1,
        sy or 1,
        ox or 0,
        oy or 0,
        kx or 0,
        ky or 0
    )
end



--[[ ============= [19 graphics.newCanvas(w, h, settings)] =============
Purpose: Create an off-screen render target (Canvas).
Arguments:
    w, h (number, optional): width/height; default is window size if nil.
    settings (table, optional): { msaa = n, format = "normal"/"hdr", readable = true/false, ... }
Returns: Canvas.
Example:
    local canvas = love.graphics.newCanvas(512, 512, {msaa=4})
    love.graphics.setCanvas(canvas)
    -- draw stuff ...
    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0)
---]]

local newCanvas = function(w, h, settings)
    if w and h then
        return love.graphics.newCanvas(w, h, settings)
    else
        return love.graphics.newCanvas()
    end
end



--[[ ============= [20 graphics.setCanvas(canvasOrList)] =============
Purpose: Set active canvas for drawing (or reset when nil).
Arguments:
    canvasOrList:
        - Canvas object OR
        - { {canvas=Canvas, mipmap=false}, ... } for multiple render targets
        - nil to reset to screen
Returns: None.
Examples:
    love.graphics.setCanvas(myCanvas)
    -- draw...
    love.graphics.setCanvas(nil)
---]]

local setCanvas = function(canvasOrList)
    love.graphics.setCanvas(canvasOrList)
end



--[[ ============= [21 graphics.getCanvas()] =============
Purpose: Get currently active canvas (or list), or nil if drawing to screen.
Returns: Canvas OR { ... } OR nil.
Example: local c = love.graphics.getCanvas()
---]]

local getCanvas = function()
    return love.graphics.getCanvas()
end



--[[ ============= [22 graphics.push() / graphics.pop()] =============
Purpose:
    Save/restore the current transformation stack
    (translation, rotation, scale, scissor, etc.).
Usage:
    love.graphics.push()
    love.graphics.translate(100, 0)
    -- draw something in local space
    love.graphics.pop()
Notes:
    * Always pair push() with a matching pop() to avoid stack leaks.
---]]

local push = function() love.graphics.push() end
local pop  = function() love.graphics.pop() end



--[[ ============= [23 graphics.origin()] =============
Purpose: Reset the current transform (translation/rotation/scale) to identity.
Example: love.graphics.origin()
---]]

local origin = function()
    love.graphics.origin()
end



--[[ ============= [24 graphics.translate/rotate/scale/shear] =============
Purpose:
    Apply transformations to subsequent drawing.
Arguments:
    translate (number, number): x, y translation values
    rotate (number): rotation angle in radians
    scale (number, number): x, y scale factors
    shear (number, number): x, y shear factors
Examples:
    love.graphics.translate(50, 50)
    love.graphics.rotate(math.pi/4)
    love.graphics.scale(2, 2)
    love.graphics.shear(0.2, 0.0)
---]]

local translate = function(x, y) love.graphics.translate(x, y) end
local rotate    = function(r) love.graphics.rotate(r) end
local scale     = function(sx, sy) love.graphics.scale(sx, sy or sx) end
local shear     = function(kx, ky) love.graphics.shear(kx, ky or 0) end



--[[ ============= [25 graphics.getWidth()] =============
Purpose: Get the current drawable width.
Returns: width (number)
Example: local w = love.graphics.getWidth()
---]]

local width = function() return love.graphics.getWidth() end



--[[ ============= [26 graphics.getHeight()] =============
Purpose: Get the current drawable height.
Returns: height (number)
Example: local h = love.graphics.getHeight()
---]]

local height = function() return love.graphics.getHeight() end



--[[ ============= [27 graphics.getDimensions()] =============
Purpose: Get current drawable dimensions (window or active canvas).
Returns: width, height
Example: local w, h = love.graphics.getDimensions()
---]]

local getDimensions = function()
    return love.graphics.getDimensions()
end



--[[ ============= [28 graphics.setLineWidth(w) / setLineStyle(style)] =============
Purpose: Control line thickness and style for "line" mode shapes.
Arguments:
    w (number): pixels
    style (string): "smooth" or "rough"
Example:
    love.graphics.setLineWidth(3)
    love.graphics.setColor(1,1,0)
    love.graphics.circle("line", 220, 120, 30)
---]]

local setLineWidth = function(w) love.graphics.setLineWidth(w) end
local setLineStyle = function(style) love.graphics.setLineStyle(style) end



--[[ ============= [29 graphics.setPointSize(size)] =============
Purpose: Control point size for love.graphics.points calls.
Arguments: size (number): pixel size
Example:
  love.graphics.setPointSize(5)
  love.graphics.points(100,100, 110,110)
---]]

local setPointSize = function(size)
    love.graphics.setPointSize(size)
end


-- ==============================================

local GRAPHICS = {}

GRAPHICS.setColor           = setColor
GRAPHICS.getColor           = getColor
GRAPHICS.resetColor         = resetColor
GRAPHICS.setBackgroundColor = setBackgroundColor
GRAPHICS.clear              = clear
GRAPHICS.rectangle          = rectangle
GRAPHICS.circle             = circle
GRAPHICS.ellipse            = ellipse
GRAPHICS.line               = line
GRAPHICS.points             = points
GRAPHICS.polygon            = polygon
GRAPHICS.print              = printText
GRAPHICS.printf             = printf
GRAPHICS.newFont            = newFont
GRAPHICS.setFont            = setFont
GRAPHICS.getFont            = getFont
GRAPHICS.newImage           = newImage
GRAPHICS.draw               = draw
GRAPHICS.newCanvas          = newCanvas
GRAPHICS.setCanvas          = setCanvas
GRAPHICS.getCanvas          = getCanvas
GRAPHICS.push               = push
GRAPHICS.pop                = pop
GRAPHICS.origin             = origin
GRAPHICS.translate          = translate
GRAPHICS.rotate             = rotate
GRAPHICS.scale              = scale
GRAPHICS.shear              = shear
GRAPHICS.getWidth           = width
GRAPHICS.getHeight          = height
GRAPHICS.getDimensions      = getDimensions
GRAPHICS.setLineWidth       = setLineWidth
GRAPHICS.setLineStyle       = setLineStyle
GRAPHICS.setPointSize       = setPointSize

return GRAPHICS

-- ==============================================
