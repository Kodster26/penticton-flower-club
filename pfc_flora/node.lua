local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)



local register_node = minetest.register_node

local testnodes = {"shrub1","treetop1","treetop2"}
local tiletable = {}

for n = 1, #testnodes do

local noden = testnodes[n]
register_node(modname .. ":" .. noden,{
	description = noden,

    drawtype = "mesh",  -- See "Node drawtypes"

    visual_scale = 1.0,
    
    use_texture_alpha = true,
   
    palette = "",
    
	tiles = {"planty.png"},--tiletable[noden] or {"dirt.png"},

    paramtype = "none",  -- See "Nodes"

    paramtype2 = "facedir",  -- See "Nodes"

    place_param2 = 0,
    
    is_ground_content = true,
    
	waving = 1,
    sunlight_propagates = false,

    groups = {cracky = 2, oddly_breakable_by_hand = 3},

	--light_source = 1,

	glow = 0,

    walkable = false,  -- If true, objects collide with node

    pointable = false,  -- If true, can be pointed at

    diggable = true,  -- If false, can never be dug

    climbable = false,  -- If true, can be climbed on like a ladder

    move_resistance = 2,
    
    buildable_to = false,  -- If true, placed nodes can replace this node

    floodable = false,
    

    mesh = noden .. ".obj",-- noden .. ".obj",
    -- File name of mesh when using "mesh" drawtype

    selection_box = {
        -- see [Node boxes] for possibilities
    },
    -- Custom selection box definition. Multiple boxes can be defined.
    -- If "nodebox" drawtype is used and selection_box is nil, then node_box
    -- definition is used for the selection box.

   
    mod_origin = modname
    
})

end

local woodynodes = {"trunk1","trunk1_fallen", "trunk3_fallen"}

for n = 1, #woodynodes do

	local noden = woodynodes[n]
	register_node(modname .. ":" .. noden,{
		description = noden,
	
		drawtype = "mesh",  -- See "Node drawtypes"
	
		visual_scale = 1.0,
		
		use_texture_alpha = ...,
	   
		palette = "",
		
		tiles = {"trunky.png"},--tiletable[noden] or {"dirt.png"},
	
		paramtype = "none",  -- See "Nodes"
	
		paramtype2 = "facedir",  -- See "Nodes"
	
		place_param2 = 0,
		

		is_ground_content = true,
		
		sunlight_propagates = false,
	
		groups = {cracky = 2, oddly_breakable_by_hand = 2},
	
		--light_source = 1,
	
		glow = 0,
	
		walkable = true,  -- If true, objects collide with node
	
		pointable = true,  -- If true, can be pointed at
	
		diggable = true,  -- If false, can never be dug
	
		climbable = false,  -- If true, can be climbed on like a ladder
	
		move_resistance = 0,
		
		buildable_to = false,  -- If true, placed nodes can replace this node
	
		floodable = false,
		
	
		mesh = noden .. ".obj",-- noden .. ".obj",
		-- File name of mesh when using "mesh" drawtype
	
		selection_box = {
			-- see [Node boxes] for possibilities
		},
		-- Custom selection box definition. Multiple boxes can be defined.
		-- If "nodebox" drawtype is used and selection_box is nil, then node_box
		-- definition is used for the selection box.
	
	   
		mod_origin = modname
		
	})
	
	end
	


-- Nodeboxes
local nodeboxy_nodes = {"lilypad"}

for n = 1, #nodeboxy_nodes do
    local noden = nodeboxy_nodes[n]
    register_node(modname .. ":" .. noden,{
        description = noden,
    
        drawtype = "nodebox",  -- See "Node drawtypes"
    
        visual_scale = 1.0,
        
        --use_texture_alpha = ...,
       
        palette = "",
        
        tiles = {nodeboxy_nodes[n] .. ".png"},
    
        paramtype = "light",  -- See "Nodes"
    
        paramtype2 = "facedir",  -- See "Nodes"
    
        place_param2 = 0,
        
        is_ground_content = true,
        
        sunlight_propagates = true,
    
        groups = {cracky = 2},
    
        waving = 3,
        
        node_box = {
            type = "fixed",
            fixed = {
                {-0.5000, -0.5000, -0.5000, 0.5000, -0.4375, 0.5000}
            }
        },

        walkable = false,  -- If true, objects collide with node
    
        pointable = false,  -- If true, can be pointed at
    
        diggable = true,  -- If false, can never be dug
    
        climbable = false,  -- If true, can be climbed on like a ladder
    
        move_resistance = 0,
        
        buildable_to = false,  -- If true, placed nodes can replace this node
    
        floodable = false,
        -- Custom selection box definition. Multiple boxes can be defined.
        -- If "nodebox" drawtype is used and selection_box is nil, then node_box
        -- definition is used for the selection box.
    
        on_construct = function() say("weiubne3grui9bn") end,
       
        mod_origin = modname
        
    })
end

local plantlike_nodes = {"flower", "tallgrass","grass3", "flower2","flower3","shroom1","shroom2"}

for n = 1, #plantlike_nodes do
    local noden = plantlike_nodes[n]
    register_node(modname .. ":" .. noden,{
        description = noden,
    
        drawtype = "plantlike",  -- See "Node drawtypes"
    
        visual_scale = 1.0,
        
        --use_texture_alpha = ...,
       
        palette = "",
        
        tiles = {noden .. ".png"},
    
        paramtype = "light",  -- See "Nodes"
    
        paramtype2 = "meshoptions",  -- See "Nodes"
    
        place_param2 = 0,
        
        is_ground_content = true,
        
        sunlight_propagates = true,
    
        groups = {cracky = 2},
    
        waving = 2,
        
        glow = 0,
    
        walkable = false,  -- If true, objects collide with node
    
        pointable = false,  -- If true, can be pointed at
    
        diggable = true,  -- If false, can never be dug
    
        climbable = false,  -- If true, can be climbed on like a ladder
    
        move_resistance = 0,
        
        buildable_to = true,  -- If true, placed nodes can replace this node
    
        floodable = false,
        -- Custom selection box definition. Multiple boxes can be defined.
        -- If "nodebox" drawtype is used and selection_box is nil, then node_box
        -- definition is used for the selection box.
    
        on_construct = function() end,
       
        mod_origin = modname
        
    })
end
