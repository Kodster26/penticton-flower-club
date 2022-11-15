local modn = minetest.get_current_modname()
local modpath = minetest.get_modpath(modn)

pfc_core.event = {}
local pfc_event = pfc_core.event
pfc_event.events = {}
pfc_event.id_iterator = 0
pfc_event.objtest = {fff = "ggg", id = 1}

pfc_event.iterate_new_id = function()
	local id_iter = pfc_event.id_iterator
	id_iter = id_iter + 1
	return id_iter

end

pfc_event.add_event = function(event) -- #TODO Standardize with rest of object prototypes in game
	event.id = event.id or pfc_event.iterate_new_id()
	pfc_event.events[event.id] = event
	if event.is_persistent then
		pfc_event.persistent_events[#pfc_event.persistent_events+1] = event.id
	end
end





dofile(modpath .. "/event.lua")
dofile(modpath .. "/persistence.lua")




--pfc_core.observer.link_observer_to_object(observer, edef)



minetest.after(4, function()

local pfc_event = pfc_core.event
local event = pfc_event.event
--[[for n = 1, 2 do
local timer = pfc_core.timer
timer = timer.timer:new({duration = 1, obj = event})
timer:add()
timer:start()
end]]



local observer = pfc_core.observer.observers[444]

local edef = {
	conditions = {{paramobject = pfc_event.objtest, objectparams = {{id = 1}}}},
	action_sequence = {{signal = "testsignaldelete", params = {{x = -117, y = 42, z = 165}}}}
}
edef = event:new(edef)

observer:link(edef)

pfc_event.add_event(edef)
	--pfc_event.events[1]:check_and_trigger()


local proximity_event = pfc_event.event



end)