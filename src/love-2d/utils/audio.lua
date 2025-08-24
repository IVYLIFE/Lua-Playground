--[[
==============================================
    * utils/audio.lua
    * SECTION: love.audio
    * Loading sources, play/pause/stop, volume
    * The love.audio module handles all audio operations in LÖVE2D.
==============================================
--]]



--[[ ============= [1 audio.newSource(pathOrData, type)] =============
Purpose: Load an audio Source (static or stream).
Arguments:
    pathOrData (string or FileData):
        - string path to file (e.g., "sfx/click.wav", "music/loop.ogg")
    type (string, optional): "static" (fully loaded) or "stream" (streamed).
        - default: "static" for small sfx; "stream" recommended for music.
Returns: Source object.
Examples:
    local sfx = love.audio.newSource("sfx/jump.wav", "static")
    local music = love.audio.newSource("music/track.ogg", "stream")
]]

local new_source = function(pathOrData, typeStr)
    return love.audio.newSource(pathOrData, typeStr or "static")
end



--[[ ============= [2 audio.play(source)] =============
Purpose: Play an audio Source. If it's already playing, restarts from the beginning.
Arguments: source (Source)
Returns: None.
Example: love.audio.play(sfx)
---]]

local play_audio = function(source)
    if source:isPlaying() then
        source:stop()
    end
    source:play()
end



--[[ ============= [3 audio.pause(source)] =============
Purpose: Pause a currently playing source.
Arguments: source (Source)
Example: love.audio.pause(music)
---]]

local pause_audio = function(source)
    source:pause()
end



--[[ ============= [4 audio.stop(source)] =============
Purpose: Stop playback and reset position.
Arguments: source (Source)
Example: love.audio.stop(music)
---]]

local stop_audio = function(source)
    source:stop()
end



--[[ ============= [5 audio.setVolume(source, volume)] =============
Purpose: Set per-source volume.
Arguments:
    source (Source)
    volume (number): [0..1]
Example: love.audio.setVolume(music, 0.5)
---]]

local set_volume = function(source, volume)
    source:setVolume(volume)
end



--[[ ============= [6 audio.setGlobalVolume(volume)] =============
Purpose: Set master volume affecting all audio.
Arguments: volume (number): [0..1]
Example:
    love.audio.setGlobalVolume(0.7)
    love.audio.setGlobalVolume(0.7)
---]]

local set_global_volume = function(volume)
    love.audio.setVolume(volume)
end



-- ==============================================

local AUDIO = {}

AUDIO.newSource = new_source
AUDIO.play = play_audio
AUDIO.pause = pause_audio
AUDIO.stop = stop_audio
AUDIO.setVolume = set_volume
AUDIO.setGlobalVolume = set_global_volume

return AUDIO

-- ==============================================
