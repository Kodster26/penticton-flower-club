

local function set_sky_to_dark(player)
	player = player or pfc_core.player
	--print(minetest.get_timeofday())
	local sunlight_level = ((math.sin(minetest.get_timeofday()-0.1)+1)/4)
	player:override_day_night_ratio(sunlight_level)

end

pfc_core.visual.set_sky_to_dark = set_sky_to_dark

local function set_vision_tint(player)

	player:hud_add({
		hud_elem_type = "image",
		position = {x=0.5, y=0.5},
		name = "screentint",
		scale = {x = -100, y = -100},
		text = "pfc_air.png",
		number = -401,
		item = 0,
		direction = 0,
		alignment = {x=0, y=0},
		offset = {x=0, y=0},
		world_pos = {x=0, y=0, z=0},
		size = {x=0, y=0},
		z_index = -1001,
		style = 0,
	})

end

pfc_core.visual.set_vision_tint = set_vision_tint

local function set_view_range(range)
	range = range or 20

	local settings = minetest.settings
	settings:set("viewing_range", range)


end

pfc_core.visual.set_view_range = set_view_range