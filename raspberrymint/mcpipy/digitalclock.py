#
# Code under the MIT license by Alexander Pruss
#

from mc import *
import text
import datetime
import time
import sys
from lib import fonts
import ast

foreground = SEA_LANTERN # this needs Minecraft 1.8
background = AIR

def parseBlock(s):
    try:
        return ast.literal_eval(s)
    except:
        return globals()[s.upper()]

try:
    foreground = parseBlock(sys.argv[1])
except:
    pass

try:
    background = parseBlock(sys.argv[2])
except:
    pass

mc = Minecraft()
pos = mc.player.getTilePos()
forward = text.angleToTextDirection(mc.player.getRotation())

prevTime = ""

while True:
    curTime = datetime.datetime.now().strftime("%I:%M:%S %p")
    if curTime[0]=='0':
        curTime = ' ' + curTime[1:]
    if prevTime != curTime:
        for i in range(len(curTime)):
            if i >= len(prevTime) or prevTime[i] != curTime[i]:
                text.drawText(mc, fonts.FONTS['8x8'], pos + forward * (8 * i), forward, Vec3(0, 1, 0), curTime[i:], foreground, background)
                break
        prevTime = curTime
    time.sleep(0.1)
