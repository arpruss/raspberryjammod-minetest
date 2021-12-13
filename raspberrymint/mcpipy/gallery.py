#!/usr/bin/env python

import buildings.payload as payload
import sys
import math
import mcpi.block as block
from mcpi.vec3 import Vec3


class Gallery(payload.Payload):
    def __init__(self):
        payload.Payload.__init__(self)
        self.wall = int(sys.argv[1]) if len(sys.argv) >= 2 else 4
        self.height = int(sys.argv[2]) if len(sys.argv) >= 3 else 6
        self.wide = int(sys.argv[3]) if len(sys.argv) >= 4 else 12
        self.deep = int(sys.argv[4]) if len(sys.argv) >= 5 else 12

        self.wall_material = self.solve_block(sys.argv[5]) if len(sys.argv) >= 6 else block.BRICK_BLOCK
        self.roof_material = self.solve_block(sys.argv[6]) if len(sys.argv) >= 7 else block.OBSIDIAN_GLASS

        delta = self.height - self.wall
        self.radius = (4*delta**2+self.wide**2)/(8*delta)
        self.semi_roof = int(math.ceil(self.wide / 2))
        self.west = Vec3(self.origin.x - self.semi_roof, self.origin.y, self.origin.z)
        self.east = Vec3(self.origin.x + self.semi_roof, self.origin.y, self.origin.z)

    def delta_height(self, x):
        return round(self.radius - math.sqrt(self.radius**2-x**2))

    def box(self, roof_point):
        pass

    def on_success(self):
        self.mc.postToChat("Gallery ready")

    def run(self):
        # Walls
        self.warp(start=self.west, y=self.wall, z=self.deep, block=self.wall_material)
        self.warp(start=self.east, y=self.wall, z=self.deep, block=self.wall_material)

        # Roof
        west = self.west.clone()
        east = self.east.clone()
        for x in range(self.semi_roof, -1, -1):
            y = self.height - self.delta_height(x)
            west.y = east.y = self.origin.y + y
            self.warp(start=west, z=self.deep, block=self.roof_material)
            self.warp(start=east, z=self.deep, block=self.roof_material)
            self.box(west)
            self.box(east)
            west.x += 1
            east.x -= 1

        self.on_success()


if __name__ == "__main__":
    o = Gallery()
    o.run()
