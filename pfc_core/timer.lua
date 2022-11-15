
local pfc_timer = pfc_core.timer
local timerpool = {}
local timerpool_active = {}

pfc_timer.timer_pool = timerpool
pfc_timer.timer_pool_active = timerpool_active



-- #FIXME -  implementation is wack, timer storage is bad, why use pairs and sequence

--[[
	Timer def
]]

local timer = {

	start_time = 0,
	duration = 1,
	--cycle = 1,
	obj = {}
}

function timer:new(g)


	for k, v in pairs(timer) do -- no tables, can use simple implementation for now

		g[k] = g[k] or v

	end

	
	return g

end

function timer:add()

	local timerpool = timerpool
	local id = #timerpool + 1
	self.id = id
	timerpool[id] = self
	return id
end


function timer:start()

	self.start_time = minetest.get_gametime()

	self.stop_time = self.start_time + self.duration

	local active_pool_index = #timerpool_active+1
	timerpool_active[active_pool_index] = self
	timerpool[self.id] = nil
	self.id = active_pool_index

	return self.start_time
end

function timer:check() -- compares current gametime to the timer's stoptime, calls stop() if true

	local gametime = minetest.get_gametime()

	if gametime >= self.stop_time then
		self:stop()
	end

end


function timer:stop() -- calls on_stop() of timer if it exists and removes references to timer, including self
	
	if self.cycle then
		
		if self.cycle <= 0 then
			return self:terminate()
		end

		self.cycle = self.cycle - 1

	end
	if self.on_stop then
		self:on_stop(self.id)
	end
	
	
	
end


function timer:terminate()
	timerpool_active[self.id] = nil
	self = {}
	self = nil
end

function timer:on_stop(x)

	local obj = self.obj

	if obj then
		return obj.on_timer and obj:on_timer(x)
	end
end



pfc_timer.timer = timer


local function iterate_active_timerpool()
	local active_pool = timerpool_active
	for k, v in pairs(active_pool) do

		local timer = v
		if timer then
			timer:check()
		end
	end
end

pfc_timer.iterate_active_timerpool = iterate_active_timerpool

minetest.register_globalstep(function(dtime)

	iterate_active_timerpool()
	

end)
