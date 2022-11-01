local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)



local register_node = minetest.register_node

local testnodes = {"lamp1","wall_edge", "basenode"}
local on_punches = { [2] = function(pos, node, puncher, pointed_thing) local fdir = node; print("hi") end}
for n = 1, #testnodes do

	local noden = testnodes[n]
register_node(modname .. ":" .. noden,{
	description = noden,

    drawtype = "normal",  -- See "Node drawtypes"

    visual_scale = 1.0,
    
    use_texture_alpha = ...,
   
    palette = "",
    
	tiles = {"hl_dev.png"},

    paramtype = "none",  -- See "Nodes"

    paramtype2 = "facedir",  -- See "Nodes"

    place_param2 = 0,
    
    is_ground_content = true,
    
    sunlight_propagates = false,

	light_source = 4,

	glow = 3,

    walkable = true,  -- If true, objects collide with node

    pointable = false,  -- If true, can be pointed at

    diggable = true,  -- If false, can never be dug

    climbable = false,  -- If true, can be climbed on like a ladder

    move_resistance = 0,
    
    buildable_to = false,  -- If true, placed nodes can replace this node

    floodable = false,
    
    liquidtype = "none",  -- specifies liquid flowing physics
    
    liquid_alternative_flowing = "",
    liquid_alternative_source = "",
    
    liquid_viscosity = 0,
    
    liquid_renewable = true,
    
    liquid_move_physics = nil,

    mesh = noden .. ".obj",
    -- File name of mesh when using "mesh" drawtype

	on_punch = on_punches[n],

    selection_box = {
        -- see [Node boxes] for possibilities
    },
    -- Custom selection box definition. Multiple boxes can be defined.
    -- If "nodebox" drawtype is used and selection_box is nil, then node_box
    -- definition is used for the selection box.

    

   
    mod_origin = modname
    
})

end
