local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)



pfc_core = {
	visual = {},
	timer = {},
	calendar = {}
}

local viewing_range = 150
pfc_core.viewing_range = viewing_range

dofile(modpath .. "/timer.lua")
dofile(modpath .. "/visual_adjust.lua")
dofile(modpath .. "/calendar.lua")
dofile(modpath .. "/hud.lua")








function say(...)
	minetest.chat_send_all((type(...) == "string" and ...) or dump(...))
end




minetest.register_on_joinplayer(function(player, last_login)

	if pfc_core.player then
	
	else
		local core = pfc_core

		pfc_core.player = player
		player:hud_set_hotbar_image("gui_hotbar2.png")
		--player:hud_set_hotbar_itemcount(16)

		
		pfc_core.visual.set_sky_to_dark(player)
		--pfc_core.visual.set_vision_tint(player)
		pfc_core.visual.set_view_range(pfc_core.viewing_range)
	end
	
end)



