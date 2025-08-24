--[[
==============================================
  * utils/qol.lua
  * SECTION: Quality-of-life helpers
  * Cross-module helpers for drawing and transforms
==============================================
--]]



--[[ ============= [1 qol.centeredText(text, y, font)] =============
Purpose: Draw text horizontally centered at given y.
Arguments:
    text (string)
    y (number)
    font (Font, optional): if nil, current font used
Example: QOL.centeredText("Press SPACE", 40)
---]]

local centeredText = function(text, y, font)
    local f = font or love.graphics.getFont()
    local tw = f:getWidth(text)
    local w = love.graphics.getWidth()
    love.graphics.print(text, (w - tw) / 2, y)
end



--[[ ============= [2 qol.withColor(colorTable, fn)] =============
Purpose: Temporarily set a color, run fn(), then restore the old color.
Arguments:
    colorTable (table): {r,g,b,a}
    fn (function): drawing code to run under that color
Example:
    QOL.withColor( {1,0,0,1}, 
        function()
            love.graphics.circle("fill", 100, 100, 20)
        end
    )
---]]

local withColor = function(colorTable, fn)
    local old = { love.graphics.getColor() }
    love.graphics.setColor(colorTable[1], colorTable[2], colorTable[3], colorTable[4] or 1)
    fn()
    love.graphics.setColor(old)
end



--[[ ============= [3 qol.withTransform(x, y, r, sx, sy, fn)] =============
Purpose: Push a transform (translate/rotate/scale), run fn(), then pop.
Arguments:
    x, y (number, default 0,0)
    r (number, radians, default 0)
    sx, sy (number, default 1,1)
    fn (function)
Example:
    QOL.withTransform(200, 150, math.pi/4, 1.5, 1.5, 
        function()
            love.graphics.rectangle("line", -50, -20, 100, 40)
        end
    )
---]]

local withTransform = function(x, y, r, sx, sy, fn)
    love.graphics.push()
    love.graphics.translate(x or 0, y or 0)
    love.graphics.rotate(r or 0)
    love.graphics.scale(sx or 1, sy or (sx or 1))
    fn()
    love.graphics.pop()
end



-- ==============================================

local QOL = {}

QOL.centeredText  = centeredText
QOL.withColor     = withColor
QOL.withTransform = withTransform

return QOL

-- ==============================================
