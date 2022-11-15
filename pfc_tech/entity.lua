local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)

local pfc_tech = pfc_core.tech

local function setup_probe(probe)
	
	local observer = pfc_core.observer.default_observer_def:new()
	--print("setup probe")
	function observer:on_timer()
	--print("ontimer called")
		local ent = self.object.object
		
		if observer.object.path then
			
			local path = observer.object.path
			--print(#self.object.path)

			if #path == 0 then
				path = nil
				observer.object.path = nil
			else
				ent:move_to(path[#path])
				path[#path] = nil
			end
			
			
			
			--printd(observer.object.path)
		else
			local pos = ent:get_pos()
			--print(pos, "pos")
			local radius = 3
			local radius_vector = {x = radius, y = 0, z = radius}
			if pos then

				local near_water = minetest.find_nodes_in_area(vector.add(pos, radius_vector), vector.subtract(pos, radius_vector), {"pfc_terrain:water_source"})
				if #near_water > 0 then
				
					local choice = near_water[math.random( 1,#near_water )]--math.random(1,#near_water)]
					--local new_pos = near_water[choice]

					local path = minetest.find_path(pos,choice,radius,1,1,"A*")
					--print(#path, "#path")
					if path then
						local reverse_path = {}
						for n = 1, #path do
							reverse_path[n] = path[(#path + 1) - n]
							--print("eibnerfiubfg")
						end
						observer.object.path = reverse_path
						--printd(reverse_path, "path")
					end
				end

			end
		end

		local timer = pfc_core.timer.timer:new({duration = 0.1, obj = observer})
		--observer:link(probe)
		timer:add()
		timer:start()
	end

	local timer = pfc_core.timer.timer:new({duration = 0.1, obj = observer})
	observer:link(probe)
	timer:add()
	timer:start()

end

pfc_tech.setup_probe = setup_probe





local probe = {
    hp_max = 10,
    breath_max = 0,
    zoom_fov = 0.0,
    eye_height = 1.625,
    physical = false,
    collide_with_objects = true,
    collisionbox = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },  -- default
    selectionbox = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5, rotate = false },
    pointable = true,
    visual = "mesh",
    visual_size = {x = 10, y = 10, z = 10},
    -- Multipliers for the visual size. If `z` is not specified, `x` will be used
    -- to scale the entity along both horizontal axes.
    textures = {"limnium.png"},
    -- Number of required textures depends on visual.
    -- "cube" uses 6 textures just like a node, but all 6 must be defined.
    -- "sprite" uses 1 texture.
    -- "upright_sprite" uses 2 textures: {front, back}.
    -- "wielditem" expects 'textures = {itemname}' (see 'visual' above).
    -- "mesh" requires one texture for each mesh buffer/material (in order)
	mesh = "doc_foote.obj",
    colors = {},
    -- Number of required colors depends on visual
    use_texture_alpha = false,
    -- Use texture's alpha channel.
    -- Excludes "upright_sprite" and "wielditem".
    -- Note: currently causes visual issues when viewed through other
    -- semi-transparent materials such as water.
    spritediv = {x = 1, y = 1},
    -- Used with spritesheet textures for animation and/or frame selection
    -- according to position relative to player.
    -- Defines the number of columns and rows in the spritesheet:
    -- {columns, rows}.
    initial_sprite_basepos = {x = 0, y = 0},
    -- Used with spritesheet textures.
    -- Defines the {column, row} position of the initially used frame in the
    -- spritesheet.
    is_visible = true,
    -- If false, object is invisible and can't be pointed.
    makes_footstep_sound = false,
    -- If true, is able to make footstep sounds of nodes
    -- (see node sound definition for details).
    backface_culling = true,
    -- Set to false to disable backface_culling for model
    glow = 0,
    nametag = "",
    -- The name to display on the head of the object. By default empty.
    -- If the object is a player, a nil or empty nametag is replaced by the player's name.
    -- For all other objects, a nil or empty string removes the nametag.
    -- To hide a nametag, set its color alpha to zero. That will disable it entirely.
    infotext = "",
    -- Same as infotext for nodes. Empty by default
    static_save = false,
    -- If false, never save this object statically. It will simply be
    -- deleted when the block gets unloaded.
    -- The get_staticdata() callback is never called then.
    -- Defaults to 'true'.
    damage_texture_modifier = "^[brighten",
    -- Texture modifier to be applied for a short duration when object is hit
    shaded = true,
    -- Setting this to 'false' disables diffuse lighting of entity
    show_on_minimap = false,
    -- Defaults to true for players, false for other entities.
    -- If set to true the entity will show as a marker on the minimap.
	on_activate = function(self) pfc_core.tech.setup_probe(self.object) end
}

minetest.register_entity(modn .. ":" .. "entity_probe", probe)