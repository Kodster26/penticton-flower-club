local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pfc_core.puzzle = {}
local pfc_puzzle = pfc_core.puzzle

pfc_puzzle.trinkets = {"sun_trinket","moon_trinket"}

dofile(modpath .. "/node.lua")
dofile(modpath .. "/effects.lua")

