local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)

local pfc_puzzle = pfc_core.puzzle

-- Sphere

local entity_name = modn .. ":" .. "sphere_effect"
local sphere = {
    hp_max = 255,
    breath_max = 5,
    physical = false,
    collide_with_objects = false,
    visual = "mesh",
    visual_size = {x = 1, y = 1, z = 1},
    -- Multipliers for the visual size. If `z` is not specified, `x` will be used
    -- to scale the entity along both horizontal axes.
    textures = {"color_1.png"},
    mesh = "area_sphere.obj",
    -- Number of required textures depends on visual.
    -- "cube" uses 6 textures just like a node, but all 6 must be defined.
    -- "sprite" uses 1 texture.
    -- "upright_sprite" uses 2 textures: {front, back}.
    -- "wielditem" expects 'textures = {itemname}' (see 'visual' above).
    -- "mesh" requires one texture for each mesh buffer/material (in order)
    colors = {},
    -- Number of required colors depends on visual
    use_texture_alpha = true,
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
    glow = 8,
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
    on_activate = function(self)
		local object = self.object
        local observer = pfc_core.observer.default_observer_def:new()
		local timer = pfc_core.timer.timer:new({obj = observer, duration = 6, cycle = 1})
		timer:add()
		timer:start()
		observer.on_timer = function()print("huh") object:remove() end

    end,
    on_step = function(self)
		print("I live")
        local obj = self.object
		local properties = obj:get_properties()
		local visual_size = properties.visual_size
		properties.visual_size = vector.multiply(properties.visual_size, {x = 1.2, y = 1.2, z = 1.2})
		properties.hp_max = properties.hp_max - 10
		properties.textures = {"color_1.png^[opacity:" .. properties.hp_max}
		obj:set_properties(properties)
		
    end,
    on_deactivate = function(self)
		local object = self.object
		minetest.add_entity(object:get_pos(), entity_name) 
	end
}

minetest.register_entity(entity_name, sphere)





-- lenspiece
local trinkets = pfc_puzzle.trinkets
local trinket_textures = {moon_trinket = "color_2.png^moon_surface_effect.png"}
for n = 1, #trinkets do
local trinket = trinkets[n]
local entity_name = modn .. ":" .. trinket
local entity = {
    hp_max = 255,
    breath_max = 5,
    physical = false,
    collide_with_objects = false,
    visual = "mesh",
    visual_size = {x = 10, y = 10, z = 10},
    -- Multipliers for the visual size. If `z` is not specified, `x` will be used
    -- to scale the entity along both horizontal axes.
    textures = {trinket_textures[trinket] or "color_3.png"},
    mesh = trinket .. ".obj",
    -- Number of required textures depends on visual.
    -- "cube" uses 6 textures just like a node, but all 6 must be defined.
    -- "sprite" uses 1 texture.
    -- "upright_sprite" uses 2 textures: {front, back}.
    -- "wielditem" expects 'textures = {itemname}' (see 'visual' above).
    -- "mesh" requires one texture for each mesh buffer/material (in order)
    colors = {},
    -- Number of required colors depends on visual
    use_texture_alpha = true,
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
    glow = 8,
	automatic_rotate = 0.5,
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
    on_activate = function(self)

		self.object:set_rotation({x = math.random(0,1),y = math.random(0,1),z = math.random(0,1)})
    end,
    on_deactivate = function(self)
	end
}

minetest.register_entity(entity_name, entity)
end