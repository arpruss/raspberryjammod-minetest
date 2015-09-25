-- fix path --
if string.find(package.path, "%\\%?") then
     package.path = package.path .. ";" .. string.gsub(package.path, "bin%\\lua%\\%?%.lua", "mods\\raspberryjammod\\?.lua")
     package.cpath = package.cpath .. ";" .. string.gsub(package.cpath, "bin%\\%?", "mods\\raspberryjammod\\?")
else
     package.path = package.path .. ";" .. string.gsub(package.path, "bin%/lua%/%?%.lua", "mods/raspberryjammod/?.lua")
     package.cpath = package.cpath .. ";" .. string.gsub(package.cpath, "bin%/%?", "mods/raspberryjammod/?")
end

local block = require("block")
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
       local err = false
       local line
       while not err do
         line,err = clientlist[i]:receive()
         if err == "closed" then
            table.remove(clientlist, i)
            print("RJM client disconnected")
         elseif not err then
            handlecommand(clientlist[i], line)
         end
       end
       if err == "closed" then break end
    end
end)

function getplayer()
    return minetest.get_connected_players()[1]
end


function handlecommand(client, line)
    local cmd, argtext = string.match(line, "([^(]+)%((.*)%)")
    if not cmd then return end
    local args = {}
    for arg in string.gmatch(argtext, "([^,]+)") do
        table.insert(args, arg)
    end
    if cmd == "chat.post" then
        minetest.chat_send_all(argtext)
    elseif cmd == "player.getPos" then
        local pos = getplayer():getpos()
        client:send(""..(pos.x)..","..(pos.y)..","..(pos.z).."\n")
    elseif cmd == "player.setPos" then
        getplayer():setpos({x=tonumber(args[1]), y=tonumber(args[2]), z=tonumber(args[3])})
    elseif cmd == "world.setBlock" then
        local nodenum
        if #args == 3 then
            nodenum = 0
        elseif #args == 4 then
            nodenum = block.Block(tonumber(args[4]),0)
        else
            nodenum = block.Block(tonumber(args[4]),tonumber(args[5]))
        end
        local node = block.BLOCK[nodenum]
        if not node then
            node = block.BLOCK[bit.band(nodenum,0xFFF)]
            if not node then
                node = block.BLOCK[STONE]
            end
        end
        local pos = {x=tonumber(args[1]),y=tonumber(args[2]),z=tonumber(args[3])}
        --print(pos.x,pos.y,pos.z,node.name)
        minetest.set_node(pos,node)
    end
end

