#!/usr/bin/env python

#
# mcpipy.com retrieved from URL below, written by zhuowei
# http://www.minecraftforum.net/topic/1638036-my-first-script-for-minecraft-pi-api-a-rainbow/

import mcpi.minecraft as minecraft
import mcpi.block as block
from math import *
from lib import server

colors = [14, 1, 4, 5, 3, 11, 10]

mc = minecraft.Minecraft.create(server.address)
height = 60

pos = mc.player.getPos()

mc.setBlocks(pos.x - 64, pos.y, pos.z, pos.x + 64, pos.y + height + len(colors), pos.z, 0)
for x in range(0, 128):
        for colourindex in range(0, len(colors)):
                y = sin((x / 128.0) * pi) * (pos.y + height) + colourindex
                mc.setBlock(pos.x + x - 64, int(y), pos.z, block.WOOL.id, colors[len(colors) - 1 - colourindex])