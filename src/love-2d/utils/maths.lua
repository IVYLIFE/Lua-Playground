--[[
==============================================
    * SECTION: love.math
    * Random, noise, transforms, basic vector helpers
    * The love.math module handles all mathematical operations in LÖVE2D.
==============================================
--]]



--[[ ============= [1 maths.random(a, b)] =============
Purpose: Random numbers/integers using love.math.random (seeded by OS or generator).
Arguments:
    a, b (numbers, optional):
        - no args: random float in [0,1)
        - one arg a: random int in [1, a]
        - two args a,b: random int in [a, b]
Returns: number
Example:
    local r1 = love.math.random()      -- 0..1 float
    local r2 = love.math.random(6)     -- 1..6 integer
    local r3 = love.math.random(10,20) -- 10..20 integer
--]]

local random = function(a, b)
    return love.math.random(a, b)
end



--[[ ============= [2 maths.setRandomSeed(seed)] =============
Purpose: Set the global random seed.
Arguments: seed (number)
Returns: None.
Notes: For deterministic behavior across runs use a fixed seed.
Example: love.math.setRandomSeed(1234)
---]]

local set_random_seed = function(seed)
    love.math.setRandomSeed(seed)
end



--[[ ============= [3 maths.noise(x, y, z)] =============
Purpose: Perlin-like noise. Useful for procedural animation/terrain.
Arguments:
    x (number)
    y (number, optional, default 0)
    z (number, optional, default 0)
Returns: value (number) in [0..1]
Example: local n = love.math.noise(t*0.1, 0.0)
--]]

local noise = function(x, y, z)
    return love.math.noise(x, y or 0, z or 0)
end



--[[ ============= [4 maths.newTransform()] =============
Purpose: Create a new Transform (for local transforms without stack).
Returns: Transform
Example:
    local t = love.math.newTransform()
    t:translate(100, 50); 
    t:rotate(math.pi/6)
    love.graphics.applyTransform(t)
--]]

local new_transform = function()
    return love.math.newTransform()
end



--[[ ============= [5 maths.vec(x, y)] =============
Purpose: Vector helpers (not built-in LÖVE type, convenience only). Returns a small vector table with ops.
Fields: v.x, v.y
Methods:
    v:set(x,y)
    v:add(u)            -- returns self
    v:sub(u)
    v:scale(s)
    v:len()             -- length
    v:norm()            -- normalize (in-place), returns self
    v:clone()           -- shallow copy
    v:dot(u)            -- dot product
    v:rot(a)            -- rotate by angle a (radians), in-place
Example:
    local v = love.math.vec(1,2)
    v:scale(3):add(love.math.vec(2,0))
--]]

local MATHS = {}

local vec = function(x, y)

    local v = { x = x or 0, y = y or 0 }

    function v:set(nx, ny)
        self.x, self.y = nx, ny; return self
    end

    function v:add(u)
        self.x, self.y = self.x + u.x, self.y + u.y; return self
    end

    function v:sub(u)
        self.x, self.y = self.x - u.x, self.y - u.y; return self
    end

    function v:scale(s)
        self.x, self.y = self.x * s, self.y * s; return self
    end

    function v:len() return math.sqrt(self.x * self.x + self.y * self.y) end

    function v:norm()
    local L = self:len(); if L > 0 then self.x, self.y = self.x / L, self.y / L end
        return self
    end

    function v:clone() return MATHS.vec(self.x, self.y) end

    function v:dot(u) return self.x * u.x + self.y * u.y end

    function v:rot(a)
        local ca, sa = math.cos(a), math.sin(a)
        self.x, self.y = self.x * ca - self.y * sa, self.x * sa + self.y * ca
        return self
    end

    return v
end



-- ==============================================

MATHS.random = random
MATHS.setRandomSeed = set_random_seed
MATHS.noise = noise
MATHS.newTransform = new_transform
MATHS.vec = vec

return MATHS

-- ==============================================
