
local calendar = pfc_core.calendar

calendar.current_day = 0
calendar.max_day = 6
calendar.hud_indices = {
	vignette = 1003,
	text = 112
}


local function roll_day_up()
	local calendar = pfc_core.calendar
	local current_day = calendar.current_day
	local max_day = calendar.max_day
	local new_current_day = current_day + 1
	
	return new_current_day <= max_day and new_current_day or 0

end

calendar.roll_day_up = roll_day_up


local function reposition_player_on_day_change()
	local home = pfc_core.home
	local player = pfc_core.player

	if player then
		local pos = player:get_pos()
		local home_pos = home.osl
		
		return pos and home_pos and player.set_pos(pos)
	end


end

local function display_day_change_hud_message()
	-- #TODO apply rolling HUD element
	local player = pfc_core.player

	if player then
		local calendar = pfc_core.calendar
		local day_change_message = calendar.day_change_message
		day_change_message = pfc_core.textgen.gentext(day_change_message) -- #TODO merge lines

		if day_change_message then
			
			if not pfc_api.check_hud_occupied(112) then
				local hud_def = calendar.day_text_hud_def
				hud_def.text = day_change_message
				player:hud_add(hud_def)

			end
		end


	end

end


local function end_day()
	local calendar = pfc_core.calendar
	
end





calendar.day_text_hud_def = {
		hud_elem_type = "image",
		
	
		position = {x=0.5, y=0.5},
		
	
		name = "textgen",
	
		scale = {x = 8, y = 8},
	
		text = hudtext,--"pfc_air.png^[resize:64x16^[combine:64x16:0,0=b.png:16,0=b.png:32,0=c.png:48,0=d.png",
	
		text2 = "<text>",
	
		number = 0,
	
		item = 0,
	
		direction = 0,
		-- Direction: 0: left-right, 1: right-left, 2: top-bottom, 3: bottom-top
	
		alignment = {x=0, y=0},
	
		offset = {x=0, y=128},
	
		world_pos = {x=0, y=0, z=0},
	
		size = {x=0, y=0},
	
		z_index = 101,
		-- Z index: lower z-index HUDs are displayed behind higher z-index HUDs
	
		style = 0,
}

