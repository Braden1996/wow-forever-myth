local bundlePath = assert(arg[1], "usage: luajit tests/lua51/run.lua dist/ForeverMyth.lua")

local LUA51 = {
	assert = assert,
	error = error,
	getmetatable = getmetatable,
	ipairs = ipairs,
	next = next,
	pairs = pairs,
	pcall = pcall,
	print = print,
	rawequal = rawequal,
	rawget = rawget,
	rawset = rawset,
	select = select,
	setmetatable = setmetatable,
	tonumber = tonumber,
	tostring = tostring,
	type = type,
	unpack = unpack,
	xpcall = xpcall,
	coroutine = coroutine,
	math = math,
	string = string,
	table = table,
}

local function newWorld()
	local env = {}
	for name, value in pairs(LUA51) do
		env[name] = value
	end
	env._G = env
	local frames, timers, requested = {}, {}, {}
	env.CreateFrame = function()
		local frame = { scripts = {}, events = {} }
		function frame:SetScript(script, handler)
			self.scripts[script] = handler
		end
		function frame:RegisterEvent(event)
			self.events[event] = true
		end
		function frame:UnregisterEvent(event)
			self.events[event] = nil
		end
		frames[#frames + 1] = frame
		return frame
	end
	env.C_Timer = {
		After = function(seconds, callback)
			timers[#timers + 1] = { seconds = seconds, callback = callback }
		end,
	}
	env.C_Item = {
		GetItemIDForItemInfo = function(itemInfo)
			return itemInfo
		end,
		RequestLoadItemDataByID = function(itemID)
			requested[#requested + 1] = itemID
		end,
	}
	local world = { env = env, timers = timers, requested = requested }
	function world.fire(event, ...)
		for _, frame in ipairs(frames) do
			if frame.events[event] and frame.scripts.OnEvent then
				frame.scripts.OnEvent(frame, event, ...)
			end
		end
	end
	return world
end

local function load(world)
	local chunk = assert(loadfile(bundlePath))
	setfenv(chunk, world.env)
	local namespace = {}
	local lib = chunk("MyAddon", namespace)
	assert(namespace.ForeverMyth == lib, "the addon namespace did not receive the library")
	return lib
end

local passed, failed = 0, 0

local function test(name, body)
	local ok, problem = pcall(body)
	if ok then
		passed = passed + 1
	else
		failed = failed + 1
		print("FAIL lua51 > " .. name .. ": " .. tostring(problem))
	end
end

local function expectOk(lib, task, value)
	local result = lib.Task.peek(task)
	assert(result ~= nil, "the task is still pending")
	assert(result.kind == "Ok", "expected Ok, got " .. tostring(result.kind))
	assert(result.value == value, "expected " .. tostring(value) .. ", got " .. tostring(result.value))
end

test("a load resolves every waiter when its event fires", function()
	local world = newWorld()
	local lib = load(world)
	local name = nil
	world.env.C_Item.GetItemNameByID = function()
		return name
	end
	local first = lib.Api.C_Item.GetItemNameByIDAsync(42)
	local second = lib.Api.C_Item.GetItemNameByIDAsync(42)
	assert(lib.Task.isPending(first) and lib.Task.isPending(second), "pending before the event")
	assert(world.requested[1] == 42 and world.requested[2] == 42, "the item was requested")
	world.fire("ITEM_DATA_LOAD_RESULT", 7, true)
	assert(lib.Task.isPending(first), "another item's event does not settle it")
	name = "Hogger's Sword"
	world.fire("ITEM_DATA_LOAD_RESULT", 42, true)
	expectOk(lib, first, "Hogger's Sword")
	expectOk(lib, second, "Hogger's Sword")
end)

test("a failed load rejects with LoadFailed", function()
	local world = newWorld()
	local lib = load(world)
	world.env.C_Item.GetItemNameByID = function()
		return nil
	end
	local task = lib.Api.C_Item.GetItemNameByIDAsync(9)
	world.fire("ITEM_DATA_LOAD_RESULT", 9, false)
	local result = lib.Task.peek(task)
	assert(
		result and result.kind == "Err" and result.error.kind == "LoadFailed" and result.error.key == 9,
		"expected LoadFailed for 9"
	)
end)

test("a timer task resolves when C_Timer fires", function()
	local world = newWorld()
	local lib = load(world)
	local task = lib.Api.C_Timer.AfterAsync(2)
	assert(world.timers[1].seconds == 2 and lib.Task.isPending(task), "a pending two-second timer")
	world.timers[1].callback()
	expectOk(lib, task, nil)
end)

test("maybe, record, Into and Result wrappers run", function()
	local world = newWorld()
	local lib = load(world)
	local x = 1
	world.env.UnitPosition = function()
		return x, 2, 3, 1429
	end
	world.env.C_AddOns = {
		LoadAddOn = function(name)
			if name == "Present" then
				return true, nil
			end
			return false, nil
		end,
	}
	local position = lib.Api.UnitPosition("player")
	assert(position.positionX == 1 and position.mapID == 1429, "the position record")
	x = 5
	assert(
		lib.Api.UnitPositionInto(position, "player") == position and position.positionX == 5,
		"Into refills the record"
	)
	assert(lib.Api.C_AddOns.LoadAddOn("Present").kind == "Ok", "LoadAddOn succeeds")
	local missing = lib.Api.C_AddOns.LoadAddOn("Missing")
	assert(missing.kind == "Err" and missing.error == "UNKNOWN", "LoadAddOn fails with the fallback reason")
end)

test("combat, events and timing run on Lua 5.1", function()
	local world = newWorld()
	local lib = load(world)
	local inCombat = true
	world.env.InCombatLockdown = function()
		return inCombat
	end
	local afterCombat = lib.Combat.run(function()
		return "after"
	end)
	local burst = lib.Events.nextBurst("BAG_UPDATE", 1, function(bagIndex)
		return bagIndex
	end)
	world.fire("BAG_UPDATE", 4)
	world.fire("BAG_UPDATE", 5)
	inCombat = false
	world.fire("PLAYER_REGEN_ENABLED")
	expectOk(lib, afterCombat, "after")
	local throttled = lib.Timing.throttle(1, function(a, b, c)
		return tostring(a) .. tostring(b) .. tostring(c)
	end)
	expectOk(lib, throttled(nil, 2, nil), "nil2nil")
	assert(#world.timers == 2, "the burst window and the throttle cooldown are scheduled")
	world.timers[1].callback()
	local bags = lib.Task.peek(burst).value
	assert(bags[1] == 4 and bags[2] == 5 and #bags == 2, "the burst holds both firings")
end)

print(
	string.format(
		"%s lua51 %d passed, %d failed (%s)",
		failed == 0 and "ok  " or "FAIL",
		passed,
		failed,
		jit and jit.version or _VERSION
	)
)
if failed > 0 then
	os.exit(1)
end
