#
# Code under the MIT license by Alexander Pruss
#

from mc import *
from random import *
from time import *

mc = Minecraft()
pos = mc.player.getTilePos()

goldPieces = 0

while goldPieces < 10:
    x = pos.x + randint(-10,10)
    z = pos.z + randint(-10,10)
    if mc.getBlock(x,pos.y-1,z) != GOLD_BLOCK.id:
        mc.setBlock(x,pos.y-1,z,GOLD_BLOCK)
        goldPieces = goldPieces + 1

startTime = time()
while goldPieces > 0:
    pos = mc.player.getTilePos()
    if mc.getBlock(pos.x,pos.y - 1,pos.z) == GOLD_BLOCK.id:
        mc.setBlock(pos.x,pos.y - 1,pos.z,COBBLESTONE)
        mc.player.setPos(pos.x,pos.y + 5, pos.z)
        goldPieces = goldPieces - 1
    sleep(0.01)

mc.postToChat("You took "+str(time()-startTime)+" seconds")
