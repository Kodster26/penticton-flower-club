local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pfc_core.hud = {}
local hud = pfc_core.hud

local function apply_fading_hud(hud_def, in_or_out, duration, interval)
	local player = pfc_core.player

	if player and hud_def then
		
		local eventlib = pfc_core.event
		local timelib = pfc_core.timer
		local timer = timelib.timer:new({duration = interval, obj = player})

		duration = type(duration) == "number" and duration > 0 and duration or 5
		interval = type(interval) == "number" and interval > 0 and interval or 1


		local eventdef = {
			remaining_cycles = math.floor(duration/interval),
			conditions = {},
			trigger_signal = hud_def.trigger_signal,
			action_sequence = {}
		}
		local event = eventlib.event:new()


	end

end

hud.apply_fading_hud = apply_fading_hud


local function modulate_hud_object(id, ratio) -- intensifies or softens the selected hud object by whole number ratio. Ratios greater than one are applied as intensity 
	local player = pfc_core.player
	
	if player then
		local hud_obj = player:hud_get(id)
		if hud_obj then
			local image = hud_obj.image
			
			if ratio and type(ratio) == "number" then
	
				ratio = math.floor(ratio)

				local effect = ""

				if ratio < 0 then
					effect = "^[opacity:" .. ratio
				else
					
					effect = "^" .. image
					if ratio > 1 then
						for n = 1, ratio - 1 do
							effect = effect .. effect
						end
					end
				end
				
				image = image and image .. effect

			end

			player:hud_change(id, "image", image)
		end
	end
end

hud.modulate_hud_object = modulate_hud_object