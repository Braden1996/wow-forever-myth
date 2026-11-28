--!strict
local Lib = require("../../packages/runtimes/cli/src/support/Lib")

local spec: Lib.Spec = function(lib, t, world)
	local Task = lib.Task
	local inCombat = false
	world.set("InCombatLockdown", function(): boolean
		return inCombat
	end)

	local function settledValue(task: unknown): unknown
		local result = Task.peek(task)
		t.truthy(result, "the task has settled")
		t.equal(result.kind, "Ok")
		return result.value
	end

	t.test("combat: outOfCombat resolves at once outside combat", function()
		inCombat = false
		t.equal(settledValue(lib.Combat.outOfCombat()), nil)
		t.equal(world.registered("PLAYER_REGEN_ENABLED"), false)
	end)

	t.test("combat: run waits for PLAYER_REGEN_ENABLED, in order, then unregisters", function()
		inCombat = true
		local order: { string } = {}
		local first = lib.Combat.run(function(): string
			table.insert(order, "first")
			return "anchored"
		end)
		local second = lib.Combat.run(function(): number
			table.insert(order, "second")
			return 2
		end)
		t.truthy(Task.isPending(first) and Task.isPending(second), "pending in combat")
		t.equal(world.registered("PLAYER_REGEN_ENABLED"), true)
		inCombat = false
		world.fire("PLAYER_REGEN_ENABLED")
		t.equal(order, { "first", "second" })
		t.equal(settledValue(first), "anchored")
		t.equal(settledValue(second), 2)
		t.equal(world.registered("PLAYER_REGEN_ENABLED"), false)
	end)

	t.test("combat: work queued while leaving combat runs at once", function()
		inCombat = true
		local inner: unknown = nil
		lib.Combat.run(function()
			inner = lib.Combat.run(function(): string
				return "inner"
			end)
		end)
		inCombat = false
		world.fire("PLAYER_REGEN_ENABLED")
		t.equal(settledValue(inner), "inner")
	end)

	t.test("events: next reads the first firing's payload and unsubscribes", function()
		local level = lib.Events.next("PLAYER_LEVEL_UP", function(newLevel: number): number
			return newLevel
		end)
		t.truthy(Task.isPending(level), "pending before the event")
		world.fire("PLAYER_LEVEL_UP", 12, 100, 20)
		world.fire("PLAYER_LEVEL_UP", 13, 100, 20)
		t.equal(settledValue(level), 12)
		t.equal(world.registered("PLAYER_LEVEL_UP"), false)
	end)

	t.test("events: nextBurst collects every firing within the window of the first", function()
		local bags = lib.Events.nextBurst("BAG_UPDATE", 0.2, function(bagIndex: number): number
			return bagIndex
		end)
		t.equal(world.pendingTimers(), 0, "no timer before the first firing")
		world.fire("BAG_UPDATE", 0)
		world.fire("BAG_UPDATE", 3)
		world.advance(0.1)
		world.fire("BAG_UPDATE", 0)
		t.truthy(Task.isPending(bags), "pending inside the window")
		world.advance(0.1)
		t.equal(settledValue(bags), { 0, 3, 0 })
		t.equal(world.registered("BAG_UPDATE"), false)
	end)

	t.test("events: a burst re-armed when it settles misses no firing", function()
		local bursts: { { number } } = {}
		local function arm()
			Task.whenSettled(
				lib.Events.nextBurst("BAG_UPDATE", 1, function(bagIndex: number): number
					return bagIndex
				end),
				function(result: { kind: string, value: { number } })
					table.insert(bursts, result.value)
					if #bursts < 2 then
						arm()
					end
				end
			)
		end
		arm()
		world.fire("BAG_UPDATE", 1)
		world.advance(1)
		world.fire("BAG_UPDATE", 2)
		world.advance(1)
		t.equal(bursts, { { 1 }, { 2 } })
		t.equal(world.registered("BAG_UPDATE"), false)
	end)

	t.test("timing: debounce runs once with the last arguments and resolves every caller", function()
		local runs = 0
		local debounced = lib.Timing.debounce(1, function(a: number, b: number): number
			runs += 1
			return a + b
		end)
		local first = debounced(1, 1)
		world.advance(0.5)
		local second = debounced(2, 3)
		world.advance(0.5)
		t.truthy(Task.isPending(first), "the second call restarted the wait")
		world.advance(0.5)
		t.equal(runs, 1)
		t.equal(settledValue(first), 5)
		t.equal(settledValue(second), 5)
		local third = debounced(4, 4)
		world.advance(1)
		t.equal(runs, 2)
		t.equal(settledValue(third), 8)
	end)

	t.test("timing: throttle runs at once, then once at the end of the window with the last arguments", function()
		local seen: { string } = {}
		local throttled = lib.Timing.throttle(1, function(name: string): string
			table.insert(seen, name)
			return string.upper(name)
		end)
		local leading = throttled("a")
		t.equal(settledValue(leading), "A")
		local skipped = throttled("b")
		local trailing = throttled("c")
		t.truthy(Task.isPending(trailing), "waits for the window")
		world.advance(1)
		t.equal(seen, { "a", "c" })
		t.equal(settledValue(skipped), "C")
		t.equal(settledValue(trailing), "C")
		world.advance(1)
		t.equal(world.pendingTimers(), 0, "an idle window ends the cooldown")
		t.equal(settledValue(throttled("d")), "D")
		world.advance(1)
		t.equal(seen, { "a", "c", "d" })
	end)

	t.test("timing: throttle and debounce keep nil arguments in place", function()
		local throttled = lib.Timing.throttle(1, function(a: string?, b: string?, c: string?): string
			return tostring(a) .. tostring(b) .. tostring(c)
		end)
		t.equal(settledValue(throttled(nil, "x", nil)), "nilxnil")
		world.advance(1)
		local debounced = lib.Timing.debounce(1, function(...: unknown): number
			return select("#", ...)
		end)
		local count = debounced(nil, nil)
		world.advance(1)
		t.equal(settledValue(count), 2)
	end)
end

return spec
