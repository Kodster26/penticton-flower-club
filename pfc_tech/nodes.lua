local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)



local register_node = minetest.register_node

local testnodes = {"doc_foote","insolabe","insolabe_crib","console", "monitor"}


for n = 1, #testnodes do

local noden = testnodes[n]
register_node(modname .. ":" .. noden,{
	description = noden,

    drawtype = "mesh",  -- See "Node drawtypes"

    visual_scale = 1.0,
    
    use_texture_alpha = ...,
   
    palette = "",
    
	tiles = {"limnium.png"},

    paramtype = "none",  -- See "Nodes"

    paramtype2 = "facedir",  -- See "Nodes"

    place_param2 = 0,
    
    is_ground_content = true,
    
    sunlight_propagates = false,

    groups = {cracky = 2},

	--light_source = 1,

	glow = 0,

    walkable = true,  -- If true, objects collide with node

    pointable = true,  -- If true, can be pointed at

    diggable = true,  -- If false, can never be dug

    climbable = false,  -- If true, can be climbed on like a ladder

    move_resistance = 0,
    
    buildable_to = false,  -- If true, placed nodes can replace this node

    floodable = false,
    
    liquidtype = "none",  -- specifies liquid flowing physics
    
    liquid_alternative_flowing = "",
    liquid_alternative_source = "",
    
    liquid_viscosity = 0,
    
    liquid_renewable = false,
    
    liquid_move_physics = nil,

    mesh = noden .. ".obj",
    -- File name of mesh when using "mesh" drawtype

    selection_box = {
        -- see [Node boxes] for possibilities
    },
    -- Custom selection box definition. Multiple boxes can be defined.
    -- If "nodebox" drawtype is used and selection_box is nil, then node_box
    -- definition is used for the selection box.

   on_construct = noden == "doc_foote" and function(pos) minetest.add_entity(pos, "pfc_tech:entity_probe") minetest.remove_node(pos) end,
    mod_origin = modname
    
})

end
