#
# Code under the MIT license by Alexander Pruss
#

import sys
from mcturtle import *


class Surface:
    def __init__(self, turtle):
        self.turtle = turtle

    def row(self, len):
        self.turtle.go(len - 1)

    def square(self, side):
        for i in range(side):
            self.row(side)
            if side - i > 1:
                self.turtle.angle(0)
                self.turtle.go(1)
            turn = 180 * (i % 2)
            self.turtle.angle(turn -90)

    def cube(self, side):
        pos = self.turtle.position.clone()
        for i in range(side):
            self.turtle.angle(90)
            self.square(side)
            self.turtle.goto(pos.x, pos.y + i + 1, pos.z)


class Payload:
    def __init__(self):
        self.turtle = Turtle()
        self.side = int(sys.argv[1]) if len(sys.argv) >= 2 else 2

    def run(self):
        self.turtle.pendelay(0)
        self.turtle.penblock(GLASS)
        draw = Surface(self.turtle)
        draw.cube(self.side)


o = Payload()
o.run()
