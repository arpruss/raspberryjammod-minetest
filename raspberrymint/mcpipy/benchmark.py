from time import time
from mcpi.minecraft import Minecraft
mc = Minecraft.create()

t = time()
for i in range(1000):
    mc.getBlock(0,0,0)
ms = 1000.*(time()-t)/1000.
print("getBlock : {}ms".format(ms))
mc.postToChat("getBlock : {}ms".format(ms))

t = time()
for i in range(10000):
    mc.setBlock(0,0,0,2)
ms = 1000.*(time()-t)/1000
mc.getBlock(0,0,0)
print("setBlock same : {}ms".format(ms))
mc.postToChat("setBlock same : {}ms".format(ms))

t = time()
for i in range(10000):
    mc.setBlock(0,0,0,i&2)
ms = 1000.*(time()-t)/1000
mc.getBlock(0,0,0)
print("setBlock different : {}ms".format(ms))
mc.postToChat("setBlock different : {}ms".format(ms))
