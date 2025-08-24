--[[
==============================================
    * SECTION: love.filesystem
    * Read, write, exists, lines, directories
    * The love.filesystem module handles all filesystem operations in LÖVE2D.
==============================================
---]]




--[[ ============= [1 fileSystem.read(path, mode)] =============
Purpose: Read a file from the game's filesystem (save dir or source).
Arguments:
    path (string),
    mode (string,
    optional): "r" (default, returns string), "rb" (binary read)
Returns:
    contents (string),
    size (number) OR nil, errorMessage on failure
Example: local data, size = FILESYSTEM.read("data/config.json")
---]]

local read = function(path, mode)
    return love.filesystem.read(mode or "r", path)
end



--[[ ============= [2 fileSystem.write(path, data, size)] =============
Purpose: Write data to a file in the save directory.
Arguments:
    path (string),
    data (string or Data),
    size (number, optional if data is string)
Returns: success (bool)
Example: FILESYSTEM.write("save/score.txt", "12345")
---]]

local write = function(path, data, size)
    return love.filesystem.write(path, data, size)
end



--[[ ============= [3 fileSystem.exists(path)] =============
Purpose: Check whether a file/directory exists.
Arguments: path (string)
Returns: boolean
Example: if FILESYSTEM.exists("save/score.txt") then ...
---]]

local exists = function(path)
    return love.filesystem.getInfo(path) ~= nil
end



--[[ ============= [4 fileSystem.lines(path)] =============
Purpose: Iterate over lines of a text file.
Arguments: path (string)
Returns: iterator function (like io.lines but using love.filesystem)
Example: for line in FILESYSTEM.lines("data/notes.txt") do print(line) end
---]]

local lines = function(path)
    return love.filesystem.lines(path)
end



--[[ ============= [5 fileSystem.createDirectory(path)] =============
Purpose: Ensure a directory exists (create if missing).
Arguments: path (string)
Returns: success (bool)
Example: FILESYSTEM.createDirectory("save")
---]]

local create_directory = function(path)
    return love.filesystem.createDirectory(path)
end



-- ==============================================

local FILESYSTEM = {}

FILESYSTEM.read = read
FILESYSTEM.write = write
FILESYSTEM.exists = exists
FILESYSTEM.lines = lines
FILESYSTEM.createDirectory = create_directory

return FILESYSTEM

-- ==============================================
