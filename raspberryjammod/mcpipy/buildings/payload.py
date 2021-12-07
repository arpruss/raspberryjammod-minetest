import mcpi.minecraft as minecraft
from mcpi.block import *
import server
from ast import literal_eval


class Payload:
    def __init__(self):
        self.mc = minecraft.Minecraft.create(server.address)
        self.origin = self.mc.player.getPos()
        self.masonry = BRICK_BLOCK

    def warp(self, start=False, x=1, y=1, z=1, block=0):
        if not start:
            start = self.origin
        if not isinstance(block, Block):
            block = self.masonry
        for xx in range(0, int(x), int(x/abs(x))):
            for yy in range(0, int(y), int(y/abs(y))):
                for zz in range(0, int(z), int(z/abs(z))):
                    self.mc.setBlock(start.x + xx, start.y + yy, start.z + zz, block)

    def solve_block(self, name):
        try:
            return literal_eval(name)
        except:
            return globals()[name.upper()]
