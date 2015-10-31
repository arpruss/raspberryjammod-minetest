if minetest.request_insecure_environment then
   ie = minetest.request_insecure_environment()
else
   ie = _G
end
--[[--------------------------------------------------------------------------

The MIT License (MIT)

Copyright (c) 2014 Mark Rogaski

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

----------------------------------------------------------------------------

This software includes portions of base64.lua, available at:

    https://gist.github.com/paulmoore/2563975

Copyright (C) 2012 by Paul Moore

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

--]]--------------------------------------------------------------------------

----------------------------------------------------------------------------
-- Package Definition
----------------------------------------------------------------------------

local Base64 = {}


----------------------------------------------------------------------------
-- Imports
----------------------------------------------------------------------------

local bit
local status,err = pcall(function() bit = ie.require 'bit' end)
if not status then
	bit = ie.dofile(minetest.get_modpath(minetest.get_current_modname()) .. '/slowbit32.lua')
end
local band, bor, lshift, rshift = bit.band, bit.bor, bit.lshift, bit.rshift

----------------------------------------------------------------------------
-- Constants and tables
----------------------------------------------------------------------------

local ENCODE = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
    'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
    'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
    'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3',
    '4', '5', '6', '7', '8', '9', '+', '/'  --- ARP: changed to Mime version
}

local DECODE = {}
for i, c in ipairs(ENCODE) do
    DECODE[c] = i - 1
end
 
----------------------------------------------------------------------------
-- Utility functions
----------------------------------------------------------------------------

--- Converts a 6-bit octet into the associated Base64 character.
--
-- @param octet A 6-bit integer.
-- @return The Base64 representation of the character
local function toChar(octet)
    return assert(ENCODE[octet + 1], "No Base64 character for octet: " .. tostring(octet))
end

--- Converts a Base64 character into the associated octet.
--
-- @param char The single Base64 character.
-- @return The 6-bit integer representing the Base64 character.
local function toOctet(char)
        return assert(DECODE[char], "Not a valid Base64 character: " .. tostring(char))
end


----------------------------------------------------------------------------
-- User functions
----------------------------------------------------------------------------

--- Encodes a string into a Base64 string.
-- The input can be any string of arbitrary bytes.
-- If the input is not a string, or the string is empty, an error will be thrown.
--
-- @param input The input string.
-- @return The Base64 representation of the input string.
function Base64.encode(sInput)
    assert(type(sInput) == "string", "Invalid input, expected type string but got: " .. tostring(sInput) .. " as a: " .. type(sInput))
    assert(#sInput > 0, "Invalid input, cannot encode an empty string.")    

    local b = { sInput:byte(1, #sInput) }
    local tOutput = {}
    
    for i = 1, #b, 3 do
        local c = {}
        c[1] = rshift(b[i], 2)
        if b[i + 1] ~= nil then
            c[2] = band(lshift(b[i], 4) + rshift(b[i + 1], 4), 0x3F)
            if b[i + 2] ~= nil then
                c[3] = band(lshift(b[i + 1], 2) + rshift(b[i + 2], 6), 0x3F)
                c[4] = band(b[i + 2], 0x3F)
            else
                c[3] = band(lshift(b[i + 1], 2), 0x3F)
            end
        else
            c[2] = band(lshift(b[i], 4), 0x3F)
        end
        for j = 1, 4 do
            if c[j] ~= nil then
                tOutput[#tOutput + 1] = toChar(c[j])
            else
                tOutput[#tOutput + 1] = '='
            end
        end
    end

    return table.concat(tOutput)
end

--- Decodes a Base64 string into an output string of arbitrary bytes.
-- If the input is not a string, or the string is empty, or the string is not well-formed Base64, an error will be thrown.
--
-- @param input The Base64 input to decode.
-- @return The decoded Base64 string, as a string of bytes.
function Base64.decode (sInput)
    assert(type(sInput) == "string", "Invalid input, expected type string but got: " .. tostring(sInput) .. " as a: " .. type(sInput))
    assert(#sInput > 0, "Invalid input, cannot decode an empty string.")  

    local tOutput = {}
    for i = 1, #sInput, 4 do
        local block, pad = string.gsub(string.sub(sInput, i, i + 3), '=', '')
        local buffer, b = 0, 0
        for j = 1, 4 - pad do
            b = toOctet(string.sub(block, j, j))
            b = lshift(b, (4 - j) * 6)
            buffer = bor(buffer, b)
        end
        for j = 1, 3 - pad do
            b = rshift(buffer, (3 - j) * 8) % 256
            tOutput[#tOutput + 1] = string.char(b)
        end
    end
    
    return table.concat(tOutput)
end


----------------------------------------------------------------------------
-- Package Registration
----------------------------------------------------------------------------

--Apollo.RegisterPackage(Base64, "Encoding:Base64-1.0", 1, {})

return Base64