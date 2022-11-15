
local modn = minetest.get_current_modname()






-- flora schematics

local flora_schems = {"tree1","tree2","tree3","tree4","tree5","trunk1","trunk2"}
local seeds = {44, 20, 48, 96, 26, 233}
local seeds2 = {44,67,109,3,91,26,14,233,39,98,41,222,32}
local schem = "tree1"
minetest.register_decoration({   
	--species = "seagrass2",
	deco_type = "schematic",
	schematic = schem .. ".mts",
	rotation = "random",
	place_on = "pfc_terrain:grass",
	noise_params = {
		offset = -0.13,
		scale = 0.4,
		spread = {x = 300, y = 300, z = 300},
		seed = 22,
		octaves = 2,
		persist = 0.1,
		lacunarity = 2,
		flags = "absvalue, force_placement, all_floors"
	},
	biomes = "unknown",
	y_min = -50,
	y_max = 2000,
	spawn_by = "pfc_terrain:grass",
	num_spawn_by = -1,
})

for n = 1, #seeds do
schem = "tree2"
minetest.register_decoration({   
	--species = "seagrass2",
	deco_type = "schematic",
	schematic = schem .. ".mts",
	rotation = "random",
	place_on = "pfc_terrain:grass",
	noise_params = {
		offset = -0.13,
		scale = 0.3,
		spread = {x = 220, y = 120, z = 220},
		seed = 5 + seeds[n],
		octaves = 1,
		persist = 0.1,
		lacunarity = 2,
		flags = "absvalue, force_placement, all_floors"
	},
	biomes = "unknown",
	y_min = -50,
	y_max = 2000,
	spawn_by = "pfc_terrain:grass",
	num_spawn_by = -1,
})

schem = "tree3"
minetest.register_decoration({   
	--species = "seagrass2",
	deco_type = "schematic",
	schematic = schem .. ".mts",
	rotation = "random",
	place_on = "pfc_terrain:grass",
	noise_params = {
		offset = -0.3,
		scale = 0.4,
		spread = {x = 120, y = 120, z = 120},
		seed = seeds[n],
		octaves = 3,
		persist = 0.1,
		lacunarity = 2,
		flags = "absvalue, force_placement, all_floors"
	},
	biomes = "unknown",
	y_min = -50,
	y_max = 2000,
	spawn_by = "pfc_terrain:grass",
	num_spawn_by = -1,
})
end
schem = "tree4"

minetest.register_decoration({   
	--species = "seagrass2",
	deco_type = "schematic",
	schematic = schem .. ".mts",
	rotation = "random",
	place_on = "pfc_terrain:grass",
	noise_params = {
		offset = -0.3,
		scale = 0.4,
		spread = {x = 120, y = 120, z = 120},
		seed = 35,
		octaves = 1,
		persist = 0.1,
		lacunarity = 2,
		flags = "absvalue, force_placement, all_floors"
	},
	biomes = "unknown",
	y_min = -50,
	y_max = 2000,
	spawn_by = "pfc_terrain:grass",
	num_spawn_by = -1,
})

for n = 1, #seeds do
schem = "tree5"

minetest.register_decoration({   
	--species = "seagrass2",
	deco_type = "schematic",
	schematic = schem .. ".mts",
	rotation = "random",
	place_on = "pfc_terrain:grass",
	noise_params = {
		offset = -0.25,
		scale = 0.3,
		spread = {x = 100, y =350, z = 100},
		seed = seeds[n],
		octaves = 1,
		persist = 0.1,
		lacunarity = 2,
		flags = "absvalue"
	},
	biomes = "unknown",
	y_min = -50,
	y_max = 2000,
	spawn_by = "pfc_terrain:grass",
	num_spawn_by = -1,
})
end
schem = "trunk1"

minetest.register_decoration({   
	--species = "seagrass2",
	deco_type = "schematic",
	schematic = schem .. ".mts",
	rotation = "random",
	place_on = "pfc_terrain:grass",
	noise_params = {
		offset = -0.3,
		scale = 0.15,
		spread = {x = 120, y = 120, z = 120},
		seed = 22,
		octaves = 1,
		persist = 0.1,
		lacunarity = 2,
		flags = "absvalue"
	},
	biomes = "unknown",
	y_min = -50,
	y_max = 2000,
	spawn_by = "pfc_terrain:grass",
	num_spawn_by = -1,
})

schem = "trunk2"

minetest.register_decoration({   
	--species = "seagrass2",
	deco_type = "schematic",
	schematic = schem .. ".mts",
	rotation = "random",
	place_on = "pfc_terrain:grass",
	noise_params = {
		offset = -0.3,
		scale = 0.15,
		spread = {x = 120, y = 120, z = 120},
		seed = 8,
		octaves = 1,
		persist = 0.1,
		lacunarity = 2,
		flags = "absvalue"
	},
	biomes = "unknown",
	y_min = -50,
	y_max = 2000,
	spawn_by = "pfc_terrain:grass",
	num_spawn_by = -1,
})

-- Low-lying Plants 
local plants = {"flower", "tallgrass","flower2","flower3","shroom1","shroom2","grass3"}
local seeds = {44, 20, 48, 96, 26}

for x = 1, 4 do
for n = 1, #plants do
	local is_grass = string.find(plants[n],"grass")
local deco = {   
	--species = "seagrass2",
	deco_type = "simple",
	place_on = "pfc_terrain:grass",
	noise_params = {
		offset = -0.018,
		scale = is_grass and 0.2 or 0.05,
		spread = {x = 120, y = 120, z = 120},
		seed = seeds[n],
		octaves = is_grass and 3 or 2,
		persist = 0.66,
		flags = "all_surfaces"
	},
	biomes = "unknown",
	y_min = -50,
	y_max = 2000,
	spawn_by = "pfc_terrain:grass",
	num_spawn_by = -1,
	
	decoration = modn..":" .. plants[n],
	--height = 1,
	--height_max = 1,
	param2 = 0,
	param2_max = 4,
	place_offset_y = 0,
}

minetest.register_decoration(deco)

end
end
local nodeboxes = {"lilypad"}

for n = 1, #nodeboxes do

	local deco = {   
		--species = "seagrass2",
		deco_type = "simple",
		place_on = {"mapgen_water_source", modn .. ":water_source"},
		sidelen = 32,
		noise_params = {
			offset = -0.016,
			scale = 0.122,
			spread = {x = 20, y = 20, z = 20},
			seed = 34,
			octaves = 3,
			persist = 0.1,
			lacunarity = 2,
			flags = "liquid_surface"
		},
		y_min = -50,
		y_max = 2000,
		biomes = "unknown",
		decoration = modn ..":" .. nodeboxes[n],
		--height = 1,
		--height_max = 1,
		place_offset_y = 1,
		spawn_by = modn..":grass",
		num_spawn_by = 2
	}
	
	minetest.register_decoration(deco)
	
end
local rocknames = {"flat","glove","round","spike","stub","pillar_45","pillar_90","large_flat"}

for n = 1, #rocknames do
	local rock = rocknames[n]
	minetest.register_decoration({   
		--species = "seagrass2",
		deco_type = "simple",
		place_on = "pfc_terrain:grass",
		noise_params = {
			offset = -0.3,
			scale = 0.3,
			spread = {x = 90, y = 60, z = 90},
			seed = 8,
			octaves = 2,
			persist = 0.1,
			lacunarity = 2,
			flags = "absvalue"
		},
		biomes = "unknown",
		y_min = -200,
		y_max = 2000,
		spawn_by = "pfc_terrain:grass",
		num_spawn_by = -1,
		decoration = modn ..":" .. rock,
	})
end
