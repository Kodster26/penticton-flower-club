local pfc_event = pfc_core.event

local event = {
	id = nil,
	remaining_cycles = 1,
	is_persistent = false, -- One of "consumable" (false), or "persistent" (true). consumable events cannot be triggered if cycles is 0, persistent events do not check
	conditions = {}, -- List of parameters to check for when this object is iterated upon or signaled to trigger
	--[[ Follows the form;
	{
		{objectparams = {paramname = paramvalue}, ...}, object = ObjectRef},{...},{...}
	}]]


	trigger_signal = "trigger", -- Signal that causes the object to call it's trigger() method
	action_sequence = {}, -- Sequence of actiondefs to be executed in order when trigger() is called.
	-- actiondefs are of the form {signal = "signalname" (optional func = "function"), params = {param1, param2}}
	observer = {}, -- Connected observer object (if any)
	actionable_objects = {}, -- List of ObjectRefs that the eventobj has to affect, objects from outside of this can also be called
	is_event = true
}

pfc_event.event = event



function event:check_conditions() -- sequentially checks trigger parameters of the object. Returns true if all conditions are met and triggering is possible. Returns false if any one of the conditions is not met.

	local should_trigger = false

	local conditions = self.conditions

	if (not conditions) or #conditions == 0 then return true end

	for n = 1, #conditions do

		local condition = conditions[n]
		local param = nil
		local objparams = condition.objectparams
		local paramobject = condition.paramobject

		if paramobject then --#TODO Add string objectname/id support
			for nn = 1, #objparams do

				local objparam = objparams[nn]

				for k,v in pairs(objparam) do

					local required_param = v
					param = paramobject[k]

					if param == required_param then

						should_trigger = true
					else
						
						should_trigger = false

					return end
				end
			end	
		end
	end

	return should_trigger

end


function event:trigger() -- sequentially performs all action in action_sequence
	local is_persistent = self.is_persistent
	
	local cycles = self.remaining_cycles
	
	
	if cycles == 0 then
		return
	end
	local function next_action(i)
	
		local action = self.action_sequence[i]

		if not action then
			return
		end


		local signal = action.signal
		local func = action.func
		local params = action.params
		if(signal)then
			
			params = pfc_api.copy(params)
			self:emit_signal(signal, unpack(params))
		elseif(func)then
			func(unpack(params))
		end

		local wait = action.wait
		
		return wait and minetest.after(wait, next_action(i + 1)) or next_action(i + 1)

	end
	
	do 
		next_action(1)
	end

	cycles = is_persistent and cycles or cycles - 1 -- maintain cycle integer if persistent, decrement by one if consumable

end


function event:check_and_trigger() -- Does what it says on the sachet
	if self:check_conditions() then
		self:trigger()
	end

end

function event:new(g)
	g = g or {}
	local event = {}
	
	for k,v in pairs(self) do

		local val = g[k] or v
		
		if(type(v) == "table")then

			local tab = {}

			for kk, vv in pairs(val) do
				tab[kk] = vv
			end

			val = tab

		end
		event[k] = val -- note; reference values in g will be passed as reference #REVIEW potential problems
		
	end

	return event
end


function event:emit_signal(signal, ...)
	if signal then

		if self.observer then
			self.observer:emit_signal(signal, ...)
		end
	end


end


function event:on_timer(x)
	say("event timer")
end
