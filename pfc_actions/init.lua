local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pfc_core.action = {}
local action = pfc_core.action

local function get_flavor_text(object)
	if object then
		local flavor_text = (object.type == "node" and minetest.get_node(object.under).name) or (object.type == "object" and object.infotext) or "..."

		return flavor_text
		
	end
end

action.get_flavor_text = get_flavor_text

minetest.register_item(modname .. ":" ..'examine', {
    type = 'none',
	description = "Examine",
    wield_image = 'pfc_hand.png',
	inventory_image = "limnium_probe.png",
    wield_scale = {x = 0.5, y = 1, z = 1},
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 0,
        groupcaps = {
            crumbly = {
                times = {[2] = 3.00, [3] = 0.70},
                uses = 0,
                maxlevel = 1,
            },
            snappy = {
                times = {[3] = 0.40},
                uses = 0,
                maxlevel = 1,
            },
            oddly_breakable_by_hand = {
                times = {[1] = 3.50, [2] = 2.00, [3] = 0.70},
                uses = 0,
            },
        },
        damage_groups = {fleshy = 10},
    },
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing then

			local under = pointed_thing.under

			if under then
				say(pointed_thing)
				pfc_core.textgen.change_player_hudtext(get_flavor_text(pointed_thing) .. 1234567890)
			end
            
        end
    end,

    on_secondary_use = function(itemstack, user, pointed_thing)  if pointed_thing then

		local under = pointed_thing.under

		if under then
			say(pointed_thing)
		end
		
	end end
})