from gallery import *


class Warehouse(Gallery):
    def box(self, roof_point):
        column = roof_point.clone()
        self.warp(start=column, y=self.origin.y - 1 - column.y, block=self.wall_material)
        column.z += self.deep
        self.warp(start=column, y=self.origin.y - 1 - column.y, block=self.wall_material)

    def on_success(self):
        self.mc.postToChat("Warehouse ready")
        self.mc.postToChat("Dig the door by yourself")


if __name__ == "__main__":
    o = Warehouse()
    o.run()
