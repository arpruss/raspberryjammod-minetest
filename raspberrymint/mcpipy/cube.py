#!/usr/bin/env python

import buildings.payload as payload
import sys
from mcpi import block


class Cube(payload.Payload):
  def __init__(self):
    payload.Payload.__init__(self)
    self.side = int(sys.argv[1]) if len(sys.argv) >= 2 else 2
    self.block = self.solve_block(sys.argv[2]) if len(sys.argv) >= 3 else block.BRICK_BLOCK

  def run(self):
    self.warp(x=self.side, y=self.side, z=self.side, block=self.block)
    self.mc.postToChat("Oh! A cube!")


o = Cube()
o.run()
