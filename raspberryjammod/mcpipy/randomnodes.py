from mc import *
from random import choice,randint

mc = Minecraft()
nodes = mc.conn.sendReceive("world.getAllNodes").split("|")
pos = mc.player.getTilePos()

for i in range(1000):
    n = choice(nodes)
    if "lava" in n or "fire" in n or "water" in n: continue
    mc.conn.send("world.setNode", pos.x+randint(0,29), pos.y+randint(0,29),
        pos.z+randint(0,29), n)