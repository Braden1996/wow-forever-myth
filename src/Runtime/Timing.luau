--!strict
local Task = require("@truemyth/Task")

type Task<T, E> = Task.Task<T, E>
type Deferred = Task.Deferred<any, never>
type Arguments = { count: number, values: { any } }
type Run = (...any) -> any

local Timing = {}

local function uncheckedRun(run: unknown): Run
	return run :: any
end

local function uncheckedCaller<R, A...>(caller: (...any) -> Task<any, never>): (A...) -> Task<R, never>
	return caller :: any
end

local function uncheckedDeferred(deferred: unknown): Deferred
	return deferred :: any
end

local function capture(...: any): Arguments
	return { count = select("#", ...), values = { ... } }
end

local function settle(waiters: { Deferred }, run: Run, arguments: Arguments)
	local value = run(unpack(arguments.values, 1, arguments.count))
	for _, waiter in ipairs(waiters) do
		waiter.resolve(value)
	end
end

local function debounceAny(seconds: number, run: Run): (...any) -> Task<any, never>
	local generation = 0
	local waiters: { Deferred } = {}
	local latest: Arguments = capture()
	return function(...: any): Task<any, never>
		generation += 1
		local scheduled = generation
		latest = capture(...)
		local deferred = uncheckedDeferred(Task.withResolvers())
		table.insert(waiters, deferred)
		C_Timer.After(seconds, function()
			if scheduled ~= generation then
				return
			end
			local settling = waiters
			waiters = {}
			settle(settling, run, latest)
		end)
		return deferred.task
	end
end

local function throttleAny(seconds: number, run: Run): (...any) -> Task<any, never>
	local cooling = false
	local waiters: { Deferred } = {}
	local latest: Arguments = capture()
	local function cooled()
		if #waiters == 0 then
			cooling = false
			return
		end
		local settling = waiters
		waiters = {}
		C_Timer.After(seconds, cooled)
		settle(settling, run, latest)
	end
	return function(...: any): Task<any, never>
		local deferred = uncheckedDeferred(Task.withResolvers())
		if cooling then
			latest = capture(...)
			table.insert(waiters, deferred)
			return deferred.task
		end
		cooling = true
		C_Timer.After(seconds, cooled)
		settle({ deferred }, run, capture(...))
		return deferred.task
	end
end

function Timing.debounce<R, A...>(seconds: number, run: (A...) -> R): (A...) -> Task<R, never>
	return uncheckedCaller(debounceAny(seconds, uncheckedRun(run)))
end

function Timing.throttle<R, A...>(seconds: number, run: (A...) -> R): (A...) -> Task<R, never>
	return uncheckedCaller(throttleAny(seconds, uncheckedRun(run)))
end

return Timing
