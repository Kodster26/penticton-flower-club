local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)


pfc_core.tech = {}


dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/entity.lua")