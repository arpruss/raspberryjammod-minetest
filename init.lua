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

local BLOCKS = {}
BLOCKS[bit.bor(bit.lshift(0,4),0)] = {name="air"}
BLOCKS[bit.bor(bit.lshift(1,4),0)] = {name="default:stone"}

function handlecommand(client, line)
    print("Command received: "..line)
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
            nodenum = bit.lshift(tonumber(args[4]),4)
        else
            nodenum = bit.bor(bit.lshift(tonumber(args[4]),4),tonumber(args[5]))
        end
        local node = BLOCKS[nodenum]
        if not node then
            node = BLOCKS[bit.band(nodenum,0xFFF0)]
            if not node then
                node = BLOCKS[bit.lshift(1,4)]
            end
        end
        minetest.set_node({x=tonumber(args[1]),y=tonumber(args[2]),z=tonumber(args[3])},node)
    end
end

