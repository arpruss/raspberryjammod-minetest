local socket = require("socket")
local server = socket.bind("*", 4711)
server:settimeout(0)

local clientlist = {}

minetest.register_globalstep(function(dtime)
    local newclient,err = server:accept()
    if not err then
       newclient:settimeout(0)
       table.insert(clientlist, newclient)
       print("RJM client connected")
    end
    for i = 1, #clientlist do
       local line,err = clientlist[i]:receive()
       if err == "closed" then
          table.remove(clientlist, i)
          print("RJM client disconnected")
          break -- The other clients won't be processed on this tick, alas
       elseif not err then
          handlecommand(clientlist[i], line)
       end
    end
end)

function handlecommand(client, line)
    print("Command received: "..line)
    local cmd, argtext = string.match(line, "([^(]+)%((.*)%)")
    local args = {}
    for arg in string.gmatch(argtext, "([^,]+)") do
        table.insert(args, arg)
    end
    if cmd == "chat.post" then
        minetest.chat_send_all(argtext)
    end
end

