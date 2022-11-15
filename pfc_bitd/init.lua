local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)

pfc_core.bitd = {}
local bitd = pfc_core.bitd
bitd.nissho_exists = false

dofile(modp .. "/entity.lua")

-- Player

local player = pfc_core.player


-- Observer 

local observer = pfc_core.observer.default_observer_def:new()

bitd.observer = observer

observer.on_timer = function()
	
	--say("A bump in the dark... " .. pfc_core.player:get_player_name())
	bitd.get_dark_spots_around_player()
	bitd.refresh_timer()
end


-- Timer


local timerdef = {duration = 6, obj = observer}

local function refresh_timer()
	local timer = pfc_core.timer.timer:new(timerdef)
	timer:add()
	timer:start()
end

bitd.refresh_timer = refresh_timer




-- Darkness Check

local function get_dark_spots_around_player(radius)
	local player = pfc_core.player
	local vector = vector
	if player then

		radius = 4--radius or pfc_core.viewing_range or 15
		-- no time for voxelmanip stuff

		local pos = player:get_pos()

		local corner1, corner2 = vector.add(pos, radius), vector.subtract(pos, radius)

		local air_positions = minetest.find_nodes_in_area(corner1, corner2, {"air"})

-- nouse later
		local chosen_pos 
-- nouse later

		local light_order = {}
		for n = 1, #air_positions do
			local pos = air_positions[n]
			light_order[n] = minetest.get_node_light(pos)
			if light_order[n] <= 10  then
				chosen_pos = light_order[n]
			end
		end
		
		if chosen_pos then 
		--bitd.play_ambience(pos)
		end
		--printd(air_positions)


	end


end

bitd.get_dark_spots_around_player = get_dark_spots_around_player

local function play_ambience(pos)
	print("souind played", pos)
	local sound_params = {
		gain = 1.0,
		fade = 0.0,
		pitch = 1.0
	}
	local sound_spec = {
		name = "spooky1",
		gain = 1.0,
		pitch = 1.0,
	}

	minetest.sound_play(sound_spec, sound_params, true)

end

bitd.play_ambience = play_ambience


-- runtime calls

minetest.after(2, function() local player = pfc_core.player observer:link(player) print(observer.object.object) print(player) end)

minetest.after(3,refresh_timer)

