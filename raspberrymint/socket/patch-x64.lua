--
-- core-x64.dll is compiled with msvc 12, without any changes to the luasockets
-- source. Unfortunately, this forces it to be named core.dll, which doesn't work
-- well with what I did to socket.lua to make it load the x64 version as needed.
-- So we patch it.
--

local f = assert(io.open("core-x64.dll", "rb"))
local data = f:read("*all")
f:close()
data = data:gsub("luaopen_socket_core", "luaopen_socket_cx64")
local f = assert(io.open("cx64.dll", "wb"))
f:write(data)
f:close()
