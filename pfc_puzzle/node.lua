local modname = minetest.get_current_modname()

local pfc_puzzle = pfc_core.puzzle
local register_node = minetest.register_node

-- Nodeboxes
local signlike_nodes = {"flat","glove","round","spike","stub","pillar_45","pillar_90","large_flat"}

for n = 1, #signlike_nodes do
    local noden = signlike_nodes[n]
    register_node(modname .. ":" .. noden,{
        description = noden,
    
        drawtype = "mesh",  -- See "Node drawtypes"
    
        visual_scale = 1.0,
        
        --use_texture_alpha = ...,
       
        palette = "",
        
        tiles = {"limnium" .. ".png"},
        
        mesh = noden .. ".obj",

        paramtype = "none",  -- See "Nodes"
    
        paramtype2 = "facedir",  -- See "Nodes"
    
        place_param2 = 0,
        
        is_ground_content = true,
        
    
        groups = {cracky = 2},


        walkable = true,  -- If true, objects collide with node
    
        pointable = true,  -- If true, can be pointed at
    
        diggable = true,  -- If false, can never be dug
    
        climbable = false,  -- If true, can be climbed on like a ladder
            
        buildable_to = false,  -- If true, placed nodes can replace this node
    
        floodable = false,
        -- Custom selection box definition. Multiple boxes can be defined.
        -- If "nodebox" drawtype is used and selection_box is nil, then node_box
        -- definition is used for the selection box.
           
        mod_origin = modname
        
    })
end


-- Nodeboxes
local puzzle_meshes = {"pedestal","monolith"}
local trinkets = pfc_puzzle.trinkets
for n = 1, #puzzle_meshes do
    local noden = puzzle_meshes[n]
    register_node(modname .. ":" .. noden,{
        description = noden,
    
        drawtype = "mesh",  -- See "Node drawtypes"
    
        visual_scale = 1.0,
        
        --use_texture_alpha = ...,
       
        palette = "",
        
        tiles = {"limnium" .. ".png"},
        
        mesh = noden .. ".obj",

        paramtype = "none",  -- See "Nodes"
    
        paramtype2 = "facedir",  -- See "Nodes"
    
        place_param2 = 0,
        
        is_ground_content = true,
        
    
        groups = {cracky = 2},


        walkable = true,  -- If true, objects collide with node
    
        pointable = true,  -- If true, can be pointed at
    
        diggable = true,  -- If false, can never be dug
    
        climbable = false,  -- If true, can be climbed on like a ladder
            
        buildable_to = false,  -- If true, placed nodes can replace this node
    
        floodable = false,
        -- Custom selection box definition. Multiple boxes can be defined.
        -- If "nodebox" drawtype is used and selection_box is nil, then node_box
        -- definition is used for the selection box.
           
        mod_origin = modname,
		on_punch = function(pos) minetest.remove_node(pos) end,
		on_construct = function(pos)

			pos.y = pos.y + 1
			
			minetest.add_entity(pos,modname .. ":" .. trinkets[math.random(1,#trinkets)])
			
			pos.y = pos.y + 0.1

			minetest.add_entity(pos,modname .. ":" .. "sphere_effect")
		end
        
    })
end