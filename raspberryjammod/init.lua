-- Note: The x-coordinate is reversed in sign between minetest and minecraft,
-- and the API compensates for this.

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
            table.remove(clientlist,i)
            print("RJM client disconnected")
         elseif not err then
            local response = handle_command(line)
            if response then clientlist[i]:send(response.."\n") end
         end
       end
    end
end)


function getplayer(id)
    -- TODO: handle multiplayer
    return minetest.get_connected_players()[1]
end

function handle_entity(cmd, id, args)
    entity = getplayer(id)
    if cmd == "getPos" then
        local pos = entity:getpos()
        return ""..(-pos.x)..","..(pos.y)..","..(pos.z)
    elseif cmd == "setPos" then
        entity:setpos({x=-tonumber(args[1]), y=tonumber(args[2]), z=tonumber(args[3])})
    elseif cmd == "getPitch" then
        return ""..(entity:get_look_pitch() * -180 / math.pi)
    elseif cmd == "getRotation" then
        return ""..((90 - entity:get_look_yaw() * 180 / math.pi) % 360)
    elseif cmd == "getDirection" then
        local dir = entity:get_look_dir()
        return ""..(-dir.x)..","..(dir.y)..","..(dir.z)
    end
    return nil
end

function parse_node(args, start)
    local nodenum
    if #args < start then
        nodenum = 0
    elseif #args == start then
        nodenum = block.Block(tonumber(args[start]),0)
    else
        nodenum = block.Block(tonumber(args[start]),tonumber(args[start+1]))
    end
    local node = block.BLOCK[nodenum]
    if node == nil then
        node = block.BLOCK[bit.band(nodenum,0xFFF)]
        if not node then
            node = block.BLOCK[STONE]
        end
    end
    return node
end

function handle_world(cmd, args)
    if cmd == "setBlock" then
        local node = parse_node(args, 4)
        minetest.set_node({x=tonumber(args[1]),y=tonumber(args[2]),z=tonumber(args[3])},node)
    elseif cmd == "setNode" then
        minetest.set_node({x=tonumber(args[1]),y=tonumber(args[2]),z=tonumber(args[3])},{name=args[4]})
    elseif cmd == "setBlocks" then
        local node = parse_node(args, 7)
        x1 = math.min(-tonumber(args[1]),-tonumber(args[4]))
        x2 = math.max(-tonumber(args[1]),-tonumber(args[4]))
        y1 = math.min(tonumber(args[2]),tonumber(args[5]))
        y2 = math.max(tonumber(args[2]),tonumber(args[5]))
        z1 = math.min(tonumber(args[3]),tonumber(args[6]))
        z2 = math.max(tonumber(args[3]),tonumber(args[6]))
        for ycoord = y1,y2 do
          for xcoord = x1,x2 do
            for zcoord = z1,z2 do
               minetest.set_node({x=xcoord,y=ycoord,z=zcoord},node)
            end
          end
        end
    elseif cmd == "setNodes" then
        local node = {node = args[7]}
        x1 = math.min(-tonumber(args[1]),-tonumber(args[4]))
        x2 = math.max(-tonumber(args[1]),-tonumber(args[4]))
        y1 = math.min(tonumber(args[2]),tonumber(args[5]))
        y2 = math.max(tonumber(args[2]),tonumber(args[5]))
        z1 = math.min(tonumber(args[3]),tonumber(args[6]))
        z2 = math.max(tonumber(args[3]),tonumber(args[6]))
        for ycoord = y1,y2 do
          for xcoord = x1,x2 do
            for zcoord = z1,z2 do
               minetest.set_node({x=xcoord,y=ycoord,z=zcoord},node)
            end
          end
        end
    elseif cmd == "getNode" then
        return minetest.get_node({x=-tonumber(args[1]),y=tonumber(args[2]),z=tonumber(args[3])}).name
    elseif cmd == "getBlockWithData" or cmd == "getBlock" then
        node = minetest.get_node({x=-tonumber(args[1]),y=tonumber(args[2]),z=tonumber(args[3])})
        local id, meta
        if node == "ignore" then
            id = block.AIR
            meta = 0
        else
            id = block.STONE
            meta = 0
            for key,value in pairs(block.BLOCK) do
                if value.name == node.name then
                    id = math.floor(bit.band(key,0xFFF))
                    meta = math.floor(bit.rshift(key,12))
                    break
                end
            end
        end
        if cmd == "getBlock" then
            return ""..id
        else
            return ""..id..","..meta
        end
    elseif cmd == "getHeight" then
        -- TODO: Handle larger heights than 1024
        local xcoord = -tonumber(args[1])
        local zcoord = tonumber(args[2])
        for ycoord = 1024,-1024,-1 do
            name = minetest.get_node({x=xcoord,y=ycoord,z=zcoord}).name
            if name ~= "ignore" and name ~= "air" then
                return ""..ycoord
            end
        end
        return "-1025"
    elseif cmd == "getPlayerId" then
        return "1"
    elseif cmd == "getPlayerIds" then
        return "1"
    end
    return nil

end

function handle_command(line)
    local cmd, argtext = string.match(line, "([^(]+)%((.*)%)")
    if not cmd then return end
    local args = {}
    for arg in string.gmatch(argtext, "([^,]+)") do
        table.insert(args, arg)
    end
    if cmd:sub(1,6) == "world." then
        return handle_world(cmd:sub(7),args)
    elseif cmd:sub(1,7) == "player." then
        return handle_entity(cmd:sub(8),1,args)
    elseif cmd:sub(1,7) == "entity." then
        local player = tonumber(args[1])
        table.remove(args,1)
        return handle_entity(cmd:sub(8),player,args)
    elseif cmd == "chat.post" then
        minetest.chat_send_all(argtext)
    end
    return nil
end

-- TODO:
--  world: setting, getPlayerId (need multiplayer support), getPlayerIds (need multiplayer)
--  entity: getPitch (untested), getRotation (untested), getDirection, getTilePos, setTilePos
--  events: clear, block.hits, chat.posts, setting
