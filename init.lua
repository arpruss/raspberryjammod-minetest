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

function getplayer()
    return minetest.get_connected_players()[1]
end

function handlecommand(client, line)
    --print("Command received: "..line)
    local cmd, argtext = string.match(line, "([^(]+)%((.*)%)")
    if not cmd then return end
    local args = {}
    for arg in string.gmatch(argtext, "([^,]+)") do
        table.insert(args, arg)
    end
    if cmd == "chat.post" then
        minetest.chat_send_all(argtext)
    elseif cmd == "player.getPos" then
        local player = getplayer()
        print(player)
        print(player:is_player())
        print(player:get_player_name())
        local pos = player:getpos()
        print(pos.x)
        print(pos.y)
        print(pos.z)
        client:send(""..(pos.x)..","..(pos.y)..","..(pos.z).."\n")
    elseif cmd == "player.setPos" then
        local pos = {}
        pos.x = tonumber(args[1])
        pos.y = tonumber(args[2])
        pos.z = tonumber(args[3])
        getplayer():setpos(pos)
    end
end

