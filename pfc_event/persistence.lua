local pfc_event = pfc_core.event
pfc_event.iterator = {

	current = 0
}
pfc_event.persistent_events = {}
-- unfinished

minetest.register_globalstep(function(dtime)

	local events = pfc_event.events
	local persistent_events = pfc_event.persistent_events

	for n = 1, #persistent_events do
		local persistent_event_id = persistent_events[n]
		local event = events[persistent_event_id]

		event:check_and_trigger()
	end
end)