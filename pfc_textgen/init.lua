do
local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)


pfc_core.textgen = {}
local textgen = pfc_core.textgen



local function gentext(str) -- Returns a texturespec string containing the string in images over the default game text background

	local function string_to_array(str) -- Returns an array containing the individual chars of a string
		local result = {}

		for n = 1, str:len() do
			local char = string.sub(str, n, n)

			if char == "." then
				char = "fullstop"
			elseif char == "" or char == " " then
				char = "space"
			elseif char == ":" then
				char = "colon"
			elseif char == ";" then
				char = "semicolon"
			elseif char == "_" then
				char = "underscore"
			end

			result[n] = char
		end

		return result
	end

	if str and type(str) == "string" then
		str = str:lower()
		local char_array = string_to_array(str)
		local x_tile_index = 0
		local result = "pfc_textbg.png^[resize:" .. #char_array * 16 .. "x16" .. "^[combine:" .. tostring(16 * #char_array) + 16 .. "x16:"

		for n = 1, #char_array do
			local char = char_array[n]
			result = result .. (n - 1) * 16 .. ",0" .. "=" .. char .. ".png" .. (n < #char_array and ":" or "")

		
		end
		return result
	end
end

textgen.gentext = gentext




local function change_player_hudtext(hudtext)

	local player = pfc_core.player

	local player_hud_exists = pfc_core.textgen.hudtext_id

	hudtext = gentext(hudtext)

	if player_hud_exists then
		player:hud_remove(pfc_core.textgen.hudtext_id)
	end
		
		local hudthing = player:hud_add(
			{
			hud_elem_type = "image",
			
		
			position = {x=0.5, y=0.5},
			
		
			name = "textgen",
		
			scale = {x = 2, y = 2},
		
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
		})
		pfc_core.textgen.hudtext_id = hudthing
end

pfc_core.textgen.change_player_hudtext = change_player_hudtext


return end


--end

