from mc import *
mc = Minecraft()
vp = mc.player.getPos()
mc.postToChat("You are in position {}, {}, {}".format(int(vp.x), int(vp.y), int(vp.z)))