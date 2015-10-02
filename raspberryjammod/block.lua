local block = {}

function block.Block(id,meta)
    if meta == nil then meta = 0 end
    return id + 0x1000 * meta
end

block.AIR                 = block.Block(0)
block.STONE               = block.Block(1)
block.GRASS               = block.Block(2)
block.DIRT                = block.Block(3)
block.COBBLESTONE         = block.Block(4)
block.WOOD_PLANKS         = block.Block(5)
block.SAPLING             = block.Block(6)
block.BEDROCK             = block.Block(7)
block.WATER_FLOWING       = block.Block(8)
block.WATER_STATIONARY    = block.Block(9)
block.LAVA_FLOWING        = block.Block(10)
block.LAVA_STATIONARY     = block.Block(11)
block.SAND                = block.Block(12)
block.GRAVEL              = block.Block(13)
block.GOLD_ORE            = block.Block(14)
block.IRON_ORE            = block.Block(15)
block.COAL_ORE            = block.Block(16)
block.WOOD                = block.Block(17)
block.LEAVES              = block.Block(18)
block.GLASS               = block.Block(20)
block.LAPIS_LAZULI_ORE    = block.Block(21)
block.LAPIS_LAZULI_BLOCK  = block.Block(22)
block.SANDSTONE           = block.Block(24)
block.BED                 = block.Block(26)
block.COBWEB              = block.Block(30)
block.GRASS_TALL          = block.Block(31)
block.WOOL                = block.Block(35)
block.FLOWER_YELLOW       = block.Block(37)
block.FLOWER_CYAN         = block.Block(38)
block.MUSHROOM_BROWN      = block.Block(39)
block.MUSHROOM_RED        = block.Block(40)
block.GOLD_BLOCK          = block.Block(41)
block.IRON_BLOCK          = block.Block(42)
block.STONE_SLAB_DOUBLE   = block.Block(43)
block.STONE_SLAB          = block.Block(44)
block.BRICK_BLOCK         = block.Block(45)
block.TNT                 = block.Block(46)
block.BOOKSHELF           = block.Block(47)
block.MOSS_STONE          = block.Block(48)
block.OBSIDIAN            = block.Block(49)
block.TORCH               = block.Block(50)
block.FIRE                = block.Block(51)
block.STAIR_WOOD         = block.Block(53)
block.CHEST               = block.Block(54)
block.DIAMOND_ORE         = block.Block(56)
block.DIAMOND_BLOCK       = block.Block(57)
block.CRAFTING_TABLE      = block.Block(58)
block.FARMLAND            = block.Block(60)
block.FURNACE_INACTIVE    = block.Block(61)
block.FURNACE_ACTIVE      = block.Block(62)
block.DOOR_WOOD           = block.Block(64)
block.LADDER              = block.Block(65)
block.STAIR_COBBLESTONE  = block.Block(67)
block.DOOR_IRON           = block.Block(71)
block.REDSTONE_ORE        = block.Block(73)
block.STONE_BUTTON        = block.Block(77)
block.SNOW                = block.Block(78)
block.ICE                 = block.Block(79)
block.SNOW_BLOCK          = block.Block(80)
block.CACTUS              = block.Block(81)
block.CLAY                = block.Block(82)
block.SUGAR_CANE          = block.Block(83)
block.FENCE               = block.Block(85)
block.GLOWSTONE_BLOCK     = block.Block(89)
block.BEDROCK_INVISIBLE   = block.Block(95)
block.STAINED_GLASS =       block.Block(95)
block.TRAPDOOR            = block.Block(96)
block.IRON_TRAPDOOR       = block.Block(167)
block.STONE_BRICK         = block.Block(98)
block.GLASS_PANE          = block.Block(102)
block.MELON               = block.Block(103)
block.FENCE_GATE          = block.Block(107)
block.WATERLILY           = block.Block(111)
block.WOOD_SLAB_DOUBLE    = block.Block(125)
block.WOOD_SLAB           = block.Block(126)
block.WOOD_BUTTON         = block.Block(143)
block.REDSTONE_BLOCK      = block.Block(152)
block.QUARTZ_BLOCK        = block.Block(155)
block.HARDENED_CLAY_STAINED = block.Block(159)
block.SEA_LANTERN         = block.Block(169)
block.CARPET              = block.Block(171)
block.COAL_BLOCK          = block.Block(173)
block.REDSTONE_LAMP_INACTIVE = block.Block(123)
block.REDSTONE_LAMP_ACTIVE   = block.Block(124)
block.SUNFLOWER  = block.Block(175,0)
block.LILAC      = block.Block(175,1)
block.DOUBLE_TALLGRASS = block.Block(175,2)
block.LARGE_FERN       = block.Block(175,3)
block.ROSE_BUSH        = block.Block(175,4)
block.PEONY            = block.Block(175,5)
block.WOOL_WHITE = block.Block(block.WOOL, 0)
block.WOOL_ORANGE = block.Block(block.WOOL, 1)
block.WOOL_MAGENTA = block.Block(block.WOOL, 2)
block.WOOL_LIGHT_BLUE = block.Block(block.WOOL, 3)
block.WOOL_YELLOW = block.Block(block.WOOL, 4)
block.WOOL_LIME = block.Block(block.WOOL, 5)
block.WOOL_PINK = block.Block(block.WOOL, 6)
block.WOOL_GRAY = block.Block(block.WOOL, 7)
block.WOOL_LIGHT_GRAY = block.Block(block.WOOL, 8)
block.WOOL_CYAN = block.Block(block.WOOL, 9)
block.WOOL_PURPLE = block.Block(block.WOOL, 10)
block.WOOL_BLUE = block.Block(block.WOOL, 11)
block.WOOL_BROWN = block.Block(block.WOOL, 12)
block.WOOL_GREEN = block.Block(block.WOOL, 13)
block.WOOL_RED = block.Block(block.WOOL, 14)
block.WOOL_BLACK = block.Block(block.WOOL, 15)
block.CARPET_WHITE = block.Block(block.CARPET, 0)
block.CARPET_ORANGE = block.Block(block.CARPET, 1)
block.CARPET_MAGENTA = block.Block(block.CARPET, 2)
block.CARPET_LIGHT_BLUE = block.Block(block.CARPET, 3)
block.CARPET_YELLOW = block.Block(block.CARPET, 4)
block.CARPET_LIME = block.Block(block.CARPET, 5)
block.CARPET_PINK = block.Block(block.CARPET, 6)
block.CARPET_GRAY = block.Block(block.CARPET, 7)
block.CARPET_LIGHT_GRAY = block.Block(block.CARPET, 8)
block.CARPET_CYAN = block.Block(block.CARPET, 9)
block.CARPET_PURPLE = block.Block(block.CARPET, 10)
block.CARPET_BLUE = block.Block(block.CARPET, 11)
block.CARPET_BROWN = block.Block(block.CARPET, 12)
block.CARPET_GREEN = block.Block(block.CARPET, 13)
block.CARPET_RED = block.Block(block.CARPET, 14)
block.CARPET_BLACK = block.Block(block.CARPET, 15)
block.STAINED_GLASS_WHITE = block.Block(block.STAINED_GLASS, 0)
block.STAINED_GLASS_ORANGE = block.Block(block.STAINED_GLASS, 1)
block.STAINED_GLASS_MAGENTA = block.Block(block.STAINED_GLASS, 2)
block.STAINED_GLASS_LIGHT_BLUE = block.Block(block.STAINED_GLASS, 3)
block.STAINED_GLASS_YELLOW = block.Block(block.STAINED_GLASS, 4)
block.STAINED_GLASS_LIME = block.Block(block.STAINED_GLASS, 5)
block.STAINED_GLASS_PINK = block.Block(block.STAINED_GLASS, 6)
block.STAINED_GLASS_GRAY = block.Block(block.STAINED_GLASS, 7)
block.STAINED_GLASS_LIGHT_GRAY = block.Block(block.STAINED_GLASS, 8)
block.STAINED_GLASS_CYAN = block.Block(block.STAINED_GLASS, 9)
block.STAINED_GLASS_PURPLE = block.Block(block.STAINED_GLASS, 10)
block.STAINED_GLASS_BLUE = block.Block(block.STAINED_GLASS, 11)
block.STAINED_GLASS_BROWN = block.Block(block.STAINED_GLASS, 12)
block.STAINED_GLASS_GREEN = block.Block(block.STAINED_GLASS, 13)
block.STAINED_GLASS_RED = block.Block(block.STAINED_GLASS, 14)
block.STAINED_GLASS_BLACK = block.Block(block.STAINED_GLASS, 15)
block.HARDENED_CLAY_STAINED_WHITE = block.Block(block.HARDENED_CLAY_STAINED, 0)
block.HARDENED_CLAY_STAINED_ORANGE = block.Block(block.HARDENED_CLAY_STAINED, 1)
block.HARDENED_CLAY_STAINED_MAGENTA = block.Block(block.HARDENED_CLAY_STAINED, 2)
block.HARDENED_CLAY_STAINED_LIGHT_BLUE = block.Block(block.HARDENED_CLAY_STAINED, 3)
block.HARDENED_CLAY_STAINED_YELLOW = block.Block(block.HARDENED_CLAY_STAINED, 4)
block.HARDENED_CLAY_STAINED_LIME = block.Block(block.HARDENED_CLAY_STAINED, 5)
block.HARDENED_CLAY_STAINED_PINK = block.Block(block.HARDENED_CLAY_STAINED, 6)
block.HARDENED_CLAY_STAINED_GRAY = block.Block(block.HARDENED_CLAY_STAINED, 7)
block.HARDENED_CLAY_STAINED_LIGHT_GRAY = block.Block(block.HARDENED_CLAY_STAINED, 8)
block.HARDENED_CLAY_STAINED_CYAN = block.Block(block.HARDENED_CLAY_STAINED, 9)
block.HARDENED_CLAY_STAINED_PURPLE = block.Block(block.HARDENED_CLAY_STAINED, 10)
block.HARDENED_CLAY_STAINED_BLUE = block.Block(block.HARDENED_CLAY_STAINED, 11)
block.HARDENED_CLAY_STAINED_BROWN = block.Block(block.HARDENED_CLAY_STAINED, 12)
block.HARDENED_CLAY_STAINED_GREEN = block.Block(block.HARDENED_CLAY_STAINED, 13)
block.HARDENED_CLAY_STAINED_RED = block.Block(block.HARDENED_CLAY_STAINED, 14)
block.HARDENED_CLAY_STAINED_BLACK = block.Block(block.HARDENED_CLAY_STAINED, 15)
block.LEAVES_OAK_DECAYABLE = block.Block(block.LEAVES, 0)
block.LEAVES_SPRUCE_DECAYABLE = block.Block(block.LEAVES, 1)
block.LEAVES_BIRCH_DECAYABLE = block.Block(block.LEAVES, 2)
block.LEAVES_JUNGLE_DECAYABLE = block.Block(block.LEAVES, 3)
block.LEAVES_SPRUCE_DECAYABLE_CD = block.Block(block.LEAVES, 9)
block.LEAVES_JUNGLE_DECAYABLE_CD = block.Block(block.LEAVES, 11)
block.LEAVES_OAK_PERMANENT = block.Block(block.LEAVES, 4)
block.LEAVES_SPRUCE_PERMANENT = block.Block(block.LEAVES, 5)
block.LEAVES_BIRCH_PERMANENT = block.Block(block.LEAVES, 6)
block.LEAVES_JUNGLE_PERMANENT = block.Block(block.LEAVES, 7)
block.LEAVES_OAK_PERMANENT_CD = block.Block(block.LEAVES, 12)
block.LEAVES_SPRUCE_PERMANENT_CD = block.Block(block.LEAVES, 13)
block.LEAVES_BIRCH_PERMANENT_CD = block.Block(block.LEAVES, 14)
block.LEAVES_JUNGLE_PERMANENT_CD = block.Block(block.LEAVES, 15)
block.LEAVES2 = block.Block(161)
block.LEAVES_ACACIA_DECAYABLE = block.Block(block.LEAVES2, 0)
block.LEAVES_DARK_OAK_DECAYABLE = block.Block(block.LEAVES2, 1)
block.LEAVES_ACACIA_PERMANENT = block.Block(block.LEAVES2, 4)
block.LEAVES_DARK_OAK_PERMANENT = block.Block(block.LEAVES2, 5)
block.LEAVES_ACACIA_DECAYABLE_CD = block.Block(block.LEAVES2, 8)
block.LEAVES_DARK_OAK_DECAYABLE_CD = block.Block(block.LEAVES2, 9)
block.LEAVES_ACACIA_PERMANENT_CD = block.Block(block.LEAVES2, 12)
block.LEAVES_DARK_OAK_PERMANENT_CD = block.Block(block.LEAVES2, 13)

block.BLOCK = {}
block.BLOCK[block.AIR] = {name="air"}
block.BLOCK[block.STONE] = {name="default:stone"}
block.BLOCK[block.GRASS] = {name="default:dirt_with_grass"}
block.BLOCK[block.DIRT] = {name="default:dirt"}
block.BLOCK[block.COBBLESTONE] = {name="default:cobble"}
block.BLOCK[block.WOOD_PLANKS]={name="default:wood"}
block.BLOCK[block.SAPLING]={name="default:sapling"}
block.BLOCK[block.BEDROCK]={name="default:obsidian"}
block.BLOCK[block.WATER_FLOWING]={name="default:water_flowing"}
block.BLOCK[block.WATER_STATIONARY]={name="default:water_source"}
block.BLOCK[block.LAVA_FLOWING]={name="default:lava_flowing"}
block.BLOCK[block.LAVA_STATIONARY]={name="default:lava_source"}
block.BLOCK[block.SAND]={name="default:sand"}
block.BLOCK[block.GRAVEL]={name="default:gravel"}
block.BLOCK[block.GOLD_ORE]={name="default:stone_with_gold"}
block.BLOCK[block.IRON_ORE]={name="default:stone_with_iron"}
block.BLOCK[block.COAL_ORE]={name="default:stone_with_coal"}
block.BLOCK[block.WOOD]={name="default:wood"}
block.BLOCK[block.LEAVES]={name="default:leaves"}
block.BLOCK[block.GLASS]={name="default:glass"}
block.BLOCK[block.LAPIS_LAZULI_ORE]={name="wool:blue"} -- fix
block.BLOCK[block.LAPIS_LAZULI_BLOCK]={name="wool:blue"}
block.BLOCK[block.SANDSTONE]={name="default:sandstone"}
-- block.BLOCK[block.BED]={name="default:"}
-- block.BLOCK[block.COBWEB]={name="default:"}
block.BLOCK[block.GRASS_TALL]={name="default:junglegrass"}
block.BLOCK[block.WOOL]={name="wool:white"}
block.BLOCK[block.WATERLILY]={name="flowers:dandelion_white"} --fix
block.BLOCK[block.FLOWER_YELLOW]={name="flowers:dandelion_yellow"}
block.BLOCK[block.FLOWER_CYAN]={name="flowers:geranium"}
block.BLOCK[block.MUSHROOM_BROWN]={name="flowers:mushroom_brown"}
block.BLOCK[block.MUSHROOM_RED]={name="flowers:mushroom_red"}
block.BLOCK[block.GOLD_BLOCK]={name="default:goldblock"}
block.BLOCK[block.IRON_BLOCK]={name="default:steelblock"}
--block.BLOCK[block.STONE_SLAB_DOUBLE]={name="default:"}
block.BLOCK[block.BRICK_BLOCK]={name="default:brick"}
block.BLOCK[block.TNT]={name="tnt:tnt"}
block.BLOCK[block.BOOKSHELF]={name="default:bookshelf"}
block.BLOCK[block.MOSS_STONE]={name="default:mossycobble"}
block.BLOCK[block.OBSIDIAN]={name="default:obsidian"}
block.BLOCK[block.TORCH]={name="default:torch"}
block.BLOCK[block.FIRE]={name="fire:basic_flame"}
block.BLOCK[block.CHEST]={name="default:chest"}
block.BLOCK[block.DIAMOND_ORE]={name="default:stone_with_diamond"}
block.BLOCK[block.DIAMOND_BLOCK]={name="default:diamondblock"}
--block.BLOCK[block.CRAFTING_TABLE]={name="default:"}
block.BLOCK[block.FARMLAND]={name="farming:soil"}
block.BLOCK[block.FURNACE_INACTIVE]={name="default:furnace"}
block.BLOCK[block.FURNACE_ACTIVE]={name="default:furnace_active"}
block.BLOCK[block.LADDER]={name="default:ladder"}
block.BLOCK[block.REDSTONE_ORE]={name="wool:red"} -- fix
--block.BLOCK[block.STONE_BUTTON]={name="default:"}
block.BLOCK[block.SNOW]={name="default:snow"}
block.BLOCK[block.ICE]={name="default:ice"}
block.BLOCK[block.SNOW_BLOCK]={name="default:snowblock"}
block.BLOCK[block.CACTUS]={name="default:cactus"}
block.BLOCK[block.CLAY]={name="default:clay"}
block.BLOCK[block.SUGAR_CANE]={name="farming:straw"} -- fix
block.BLOCK[block.FENCE]={name="default:fence_wood"}
block.BLOCK[block.GLOWSTONE_BLOCK]={name="default:meselamp"} -- fix
--block.BLOCK[block.BEDROCK_INVISIBLE]={name="default:"}
block.BLOCK[block.STAINED_GLASS]={name="default:glass"} -- fix
block.BLOCK[block.STONE_BRICK]={name="default:stonebrick"}
block.BLOCK[block.GLASS_PANE]={name="default:glass"} -- fix
--block.BLOCK[block.MELON]={name="default:"}
block.BLOCK[block.WOOD_SLAB_DOUBLE]={name="default:wood"} --fix
--block.BLOCK[block.FENCE_GATE]={name="default:"}
--block.BLOCK[block.WOOD_BUTTON]={name="default:"}
block.BLOCK[block.REDSTONE_BLOCK]={name="wool:red"} -- fix
block.BLOCK[block.QUARTZ_BLOCK]={name="wool:white"}
block.BLOCK[block.HARDENED_CLAY_STAINED]={name="wool:white"} --fix
block.BLOCK[block.SEA_LANTERN]={name="default:meselamp"}
block.BLOCK[block.CARPET]={name="wool:white"} -- fix
block.BLOCK[block.COAL_BLOCK]={name="default:coalblock"}
--block.BLOCK[block.REDSTONE_LAMP_INACTIVE]={name="default:"}
block.BLOCK[block.REDSTONE_LAMP_ACTIVE]={name="default:meselamp"}
block.BLOCK[block.SUNFLOWER]={name="flowers:tulip"}
block.BLOCK[block.LILAC]={name="flowers:viola"}
block.BLOCK[block.DOUBLE_TALLGRASS]={name="default:grass_2"} --fix
--block.BLOCK[block.LARGE_FERN]={name="default:"}
block.BLOCK[block.ROSE_BUSH]={name="flowers:rose"}
block.BLOCK[block.PEONY]={name="flowers:rose"} --fix
block.BLOCK[block.WOOL_WHITE]={name="wool:white"}
block.BLOCK[block.WOOL_ORANGE]={name="wool:orange"}
block.BLOCK[block.WOOL_MAGENTA]={name="wool:magenta"}
block.BLOCK[block.WOOL_LIGHT_BLUE]={name="wool:cyan"} --fix
block.BLOCK[block.WOOL_YELLOW]={name="wool:yellow"}
block.BLOCK[block.WOOL_LIME]={name="wool:green"}
block.BLOCK[block.WOOL_PINK]={name="wool:pink"}
block.BLOCK[block.WOOL_GRAY]={name="wool:dark_grey"}
block.BLOCK[block.WOOL_LIGHT_GRAY]={name="wool:grey"}
block.BLOCK[block.WOOL_CYAN]={name="wool:cyan"}
block.BLOCK[block.WOOL_PURPLE]={name="wool:violet"}
block.BLOCK[block.WOOL_BLUE]={name="wool:blue"}
block.BLOCK[block.WOOL_BROWN]={name="wool:brown"}
block.BLOCK[block.WOOL_GREEN]={name="wool:dark_green"}
block.BLOCK[block.WOOL_RED]={name="wool:red"}
block.BLOCK[block.WOOL_BLACK]={name="wool:black"}
block.BLOCK[block.CARPET_WHITE]={name="wool:white"}
block.BLOCK[block.CARPET_ORANGE]={name="wool:orange"}
block.BLOCK[block.CARPET_MAGENTA]={name="wool:magenta"}
block.BLOCK[block.CARPET_LIGHT_BLUE]={name="wool:cyan"} --fix
block.BLOCK[block.CARPET_YELLOW]={name="wool:yellow"}
block.BLOCK[block.CARPET_LIME]={name="wool:green"}
block.BLOCK[block.CARPET_PINK]={name="wool:pink"}
block.BLOCK[block.CARPET_GRAY]={name="wool:dark_grey"}
block.BLOCK[block.CARPET_LIGHT_GRAY]={name="wool:grey"}
block.BLOCK[block.CARPET_CYAN]={name="wool:cyan"}
block.BLOCK[block.CARPET_PURPLE]={name="wool:violet"}
block.BLOCK[block.CARPET_BLUE]={name="wool:blue"}
block.BLOCK[block.CARPET_BROWN]={name="wool:brown"}
block.BLOCK[block.CARPET_GREEN]={name="wool:dark_green"}
block.BLOCK[block.CARPET_RED]={name="wool:red"}
block.BLOCK[block.CARPET_BLACK]={name="wool:black"}
block.BLOCK[block.HARDENED_CLAY_STAINED_WHITE]={name="wool:white"}
block.BLOCK[block.HARDENED_CLAY_STAINED_ORANGE]={name="wool:orange"}
block.BLOCK[block.HARDENED_CLAY_STAINED_MAGENTA]={name="wool:magenta"}
block.BLOCK[block.HARDENED_CLAY_STAINED_LIGHT_BLUE]={name="wool:cyan"} --fix
block.BLOCK[block.HARDENED_CLAY_STAINED_YELLOW]={name="wool:yellow"}
block.BLOCK[block.HARDENED_CLAY_STAINED_LIME]={name="wool:green"}
block.BLOCK[block.HARDENED_CLAY_STAINED_PINK]={name="wool:pink"}
block.BLOCK[block.HARDENED_CLAY_STAINED_GRAY]={name="wool:dark_grey"}
block.BLOCK[block.HARDENED_CLAY_STAINED_LIGHT_GRAY]={name="wool:grey"}
block.BLOCK[block.HARDENED_CLAY_STAINED_CYAN]={name="wool:cyan"}
block.BLOCK[block.HARDENED_CLAY_STAINED_PURPLE]={name="wool:violet"}
block.BLOCK[block.HARDENED_CLAY_STAINED_BLUE]={name="wool:blue"}
block.BLOCK[block.HARDENED_CLAY_STAINED_BROWN]={name="wool:brown"}
block.BLOCK[block.HARDENED_CLAY_STAINED_GREEN]={name="wool:dark_green"}
block.BLOCK[block.HARDENED_CLAY_STAINED_RED]={name="wool:red"}
block.BLOCK[block.HARDENED_CLAY_STAINED_BLACK]={name="wool:black"}
--block.BLOCK[block.LEAVES_OAK_DECAYABLE]={name="default:leaves"}
block.BLOCK[block.LEAVES_SPRUCE_DECAYABLE]={name="default:pine_needles"}
--block.BLOCK[block.LEAVES_BIRCH_DECAYABLE]={name="default:leaves"}
block.BLOCK[block.LEAVES_JUNGLE_DECAYABLE]={name="default:jungleleaves"}
block.BLOCK[block.LEAVES_OAK_PERMANENT]={name="default:leaves", param2=1}
block.BLOCK[block.LEAVES_SPRUCE_PERMANENT]={name="default:pine_needles", param2=1}
block.BLOCK[block.LEAVES_BIRCH_PERMANENT]={name="default:leaves", param2=1}
block.BLOCK[block.LEAVES_SPRUCE_DECAYABLE_CD]={name="default:pine_needles"}
block.BLOCK[block.LEAVES_JUNGLE_DECAYABLE_CD]={name="default:jungleleaves"}
block.BLOCK[block.LEAVES_JUNGLE_PERMANENT]={name="default:jungleleaves", param2=1}
block.BLOCK[block.LEAVES_OAK_PERMANENT_CD]={name="default:leaves", param2=1}
block.BLOCK[block.LEAVES_SPRUCE_PERMANENT_CD]={name="default:pine_needles", param2=1}
block.BLOCK[block.LEAVES_BIRCH_PERMANENT_CD]={name="default:leaves", param2=1}
block.BLOCK[block.LEAVES_JUNGLE_PERMANENT_CD]={name="default:jungleleaves", param2=1}
block.BLOCK[block.LEAVES2] = {name="default:leaves"}
block.BLOCK[block.LEAVES_ACACIA_DECAYABLE] = {name="default:acacia_leaves"}
--block.BLOCK[block.LEAVES_DARK_OAK_DECAYABLE] =
block.BLOCK[block.LEAVES_ACACIA_PERMANENT] = {name="default:acacia_leaves", param2=1}
block.BLOCK[block.LEAVES_DARK_OAK_PERMANENT] = {name="default:leaves", param2=1}
block.BLOCK[block.LEAVES_ACACIA_PERMANENT_CD] = {name="default:acacia_leaves", param2=1}
block.BLOCK[block.LEAVES_DARK_OAK_PERMANENT_CD] = {name="default:leaves", param2=1}

block.BLOCK[block.Block(228)] = {name="air"}
block.BLOCK[block.Block(229)] = {name="air"}
block.BLOCK[block.Block(236)] = {name="air"}
block.BLOCK[block.Block(254)] = {name="air"}

block.BLOCK[block.Block(block.WOOD_SLAB,0)] = {name="stairs:slab_wood", param2=0}
block.BLOCK[block.Block(block.WOOD_SLAB,8)] = {name="stairs:slab_wood", param2=20}
block.BLOCK[block.Block(block.WOOD_SLAB,1)] = {name="stairs:slab_pine_wood", param2=0}
block.BLOCK[block.Block(block.WOOD_SLAB,9)] = {name="stairs:slab_pine_wood", param2=20}
block.BLOCK[block.Block(block.WOOD_SLAB,2)] = {name="stairs:slab_wood", param2=0}  -- FIX: birch
block.BLOCK[block.Block(block.WOOD_SLAB,10)] = {name="stairs:slab_wood", param2=20}
block.BLOCK[block.Block(block.WOOD_SLAB,3)] = {name="stairs:slab_junglewood", param2=0}
block.BLOCK[block.Block(block.WOOD_SLAB,11)] = {name="stairs:slab_junglewood", param2=20}
block.BLOCK[block.Block(block.WOOD_SLAB,4)] = {name="stairs:slab_acacia_wood", param2=0}
block.BLOCK[block.Block(block.WOOD_SLAB,12)] = {name="stairs:slab_acacia_wood", param2=20}
block.BLOCK[block.Block(block.WOOD_SLAB,5)] = {name="stairs:slab_wood", param2=0} -- FIX: dark oak
block.BLOCK[block.Block(block.WOOD_SLAB,13)] = {name="stairs:slab_wood", param2=20}

block.BLOCK[block.Block(block.STONE_SLAB,0)] = {name="stairs:slab_stone", param2=0}
block.BLOCK[block.Block(block.STONE_SLAB,8)] = {name="stairs:slab_stone", param2=20}
block.BLOCK[block.Block(block.STONE_SLAB,1)] = {name="stairs:slab_sandstone", param2=0}
block.BLOCK[block.Block(block.STONE_SLAB,9)] = {name="stairs:slab_sandstone", param2=20}
block.BLOCK[block.Block(block.STONE_SLAB,2)] = {name="stairs:slab_wood", param2=0}
block.BLOCK[block.Block(block.STONE_SLAB,10)] = {name="stairs:slab_wood", param2=20}
block.BLOCK[block.Block(block.STONE_SLAB,3)] = {name="stairs:slab_cobble", param2=0}
block.BLOCK[block.Block(block.STONE_SLAB,11)] = {name="stairs:slab_cobble", param2=20}
block.BLOCK[block.Block(block.STONE_SLAB,4)] = {name="stairs:slab_brick", param2=0}
block.BLOCK[block.Block(block.STONE_SLAB,12)] = {name="stairs:slab_brick", param2=20}
block.BLOCK[block.Block(block.STONE_SLAB,6)] = {name="stairs:slab_stonebrick", param2=0}
block.BLOCK[block.Block(block.STONE_SLAB,13)] = {name="stairs:slab_stonebrick", param2=20}
block.BLOCK[block.Block(block.STONE_SLAB,7)] = {name="stairs:slab_desert_stonebrick", param2=0} -- FIX: nether brick
block.BLOCK[block.Block(block.STONE_SLAB,14)] = {name="stairs:slab_desert_stonebrick", param2=20}
block.BLOCK[block.Block(block.STONE_SLAB,8)] = {name="stairs:slab_desert_stone", param2=0} -- FIX: quartz
block.BLOCK[block.Block(block.STONE_SLAB,15)] = {name="stairs:slab_desert_stone", param2=20}

local function defineTrapdoor(base_num,base_name)
   block.BLOCK[block.Block(base_num,0)] = {name=base_name, param2=2}
   block.BLOCK[block.Block(base_num,1)] = {name=base_name, param2=0}
   block.BLOCK[block.Block(base_num,2)] = {name=base_name, param2=1}
   block.BLOCK[block.Block(base_num,3)] = {name=base_name, param2=3}
   block.BLOCK[block.Block(base_num,4+0)] = {name=base_name.."_open", param2=2}
   block.BLOCK[block.Block(base_num,4+1)] = {name=base_name.."_open", param2=0}
   block.BLOCK[block.Block(base_num,4+2)] = {name=base_name.."_open", param2=1}
   block.BLOCK[block.Block(base_num,4+3)] = {name=base_name.."_open", param2=3}
   block.BLOCK[block.Block(base_num,8+0)] = {name=base_name, param2=22}
   block.BLOCK[block.Block(base_num,8+1)] = {name=base_name, param2=20}
   block.BLOCK[block.Block(base_num,8+2)] = {name=base_name, param2=23}
   block.BLOCK[block.Block(base_num,8+3)] = {name=base_name, param2=21}
   block.BLOCK[block.Block(base_num,4+8+0)] = {name=base_name.."_open", param2=22}
   block.BLOCK[block.Block(base_num,4+8+1)] = {name=base_name.."_open", param2=20}
   block.BLOCK[block.Block(base_num,4+8+2)] = {name=base_name.."_open", param2=23}
   block.BLOCK[block.Block(base_num,4+8+3)] = {name=base_name.."_open", param2=21}
end

defineTrapdoor(block.TRAPDOOR,"doors:trapdoor")
defineTrapdoor(block.IRON_TRAPDOOR,"doors:trapdoor")

local function defineDoor(base_num,base_name)
   block.BLOCK[block.Block(base_num,0)] = {name=base_name.."_b_2"}
   block.BLOCK[block.Block(base_num,1)] = {name=base_name.."_b_2"}
   block.BLOCK[block.Block(base_num,2)] = {name=base_name.."_b_2"}
   block.BLOCK[block.Block(base_num,3)] = {name=base_name.."_b_2"}
   block.BLOCK[block.Block(base_num,4+0)] = {name=base_name.."_b_2"}
   block.BLOCK[block.Block(base_num,4+1)] = {name=base_name.."_b_2"}
   block.BLOCK[block.Block(base_num,4+2)] = {name=base_name.."_b_2"}
   block.BLOCK[block.Block(base_num,4+3)] = {name=base_name.."_b_2"}
   block.BLOCK[block.Block(base_num,8+0)] = {name=base_name.."_t_2"}
   block.BLOCK[block.Block(base_num,8+1)] = {name=base_name.."_t_2"}
   block.BLOCK[block.Block(base_num,8+2)] = {name=base_name.."_t_2"}
   block.BLOCK[block.Block(base_num,8+3)] = {name=base_name.."_t_2"}
   block.BLOCK[block.Block(base_num,4+8+0)] = {name=base_name.."_t_2"}
   block.BLOCK[block.Block(base_num,4+8+1)] = {name=base_name.."_t_2"}
   block.BLOCK[block.Block(base_num,4+8+2)] = {name=base_name.."_t_2"}
   block.BLOCK[block.Block(base_num,4+8+3)] = {name=base_name.."_t_2"}
-- lots of fixes to be done!
-- it might not be doable as MC upper doors don't have directional data
end

defineDoor(block.DOOR_WOOD, "doors:door_wood")
defineDoor(block.DOOR_IRON, "doors:door_steel")

local function defineStair(base_num,base_name)
   block.BLOCK[block.Block(base_num,0)] = {name=base_name, param2=1}
   block.BLOCK[block.Block(base_num,1)] = {name=base_name, param2=3}
   block.BLOCK[block.Block(base_num,2)] = {name=base_name, param2=2}
   block.BLOCK[block.Block(base_num,3)] = {name=base_name, param2=0}

   block.BLOCK[block.Block(base_num,4)] = {name=base_name, param2=17}
   block.BLOCK[block.Block(base_num,5)] = {name=base_name, param2=21}
   block.BLOCK[block.Block(base_num,6)] = {name=base_name, param2=22}
   block.BLOCK[block.Block(base_num,7)] = {name=base_name, param2=20}
end

defineStair(block.STAIR_WOOD, "stairs:stair_wood")
defineStair(block.STAIR_COBBLESTONE, "stairs:stair_cobble")
defineStair(108, "stairs:stair_brick")
defineStair(109, "stairs:stair_stonebrick")
defineStair(114, "stairs:stair_desert_stonebrick") -- fix: nether brick
defineStair(128, "stairs:stair_sandstone")
defineStair(134, "stairs:stair_pine_wood")
defineStair(135, "stairs:stair_wood") -- fix: birch
defineStair(136, "stairs:stair_junglewood")
defineStair(156, "stairs:stair_desert_stone") -- fix: quartz
defineStair(163, "stairs:stair_acacia_wood")
defineStair(164, "stairs:stair_wood") -- fix: dark oak
defineStair(180, "stairs:stair_sandstone") -- fix: red sandstone
defineStair(203, "stairs:stair_wood") -- fix: purpur

minetest.log("info", "Checking for missing blocks")
for id,entry in pairs(block.BLOCK) do
   if not minetest.registered_nodes[entry.name] then
        minetest.log("error", "Missing block "..entry.name)
        entry.name = "default:stone"
        entry.param2 = "0"
   end
end

return block
