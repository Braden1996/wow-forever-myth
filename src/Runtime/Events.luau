--!strict
local Listener = require("./Listener")
local Task = require("@truemyth/Task")

type Task<T, E> = Task.Task<T, E>

type function readerOf(handler: type, result: type): type
	if not handler:is("function") then
		error("expected an event of EventPayloads, got " .. tostring(handler), 0)
	end
	return types.newfunction(handler:parameters(), { head = { result } })
end

export type Reader<E, T> = readerOf<EventHandler<E>, T>

local Events = {}

local function uncheckedRead(read: unknown): (...any) -> any
	return read :: any
end

local function uncheckedDeferred(deferred: unknown): Task.Deferred<any, never>
	return deferred :: any
end

local function uncheckedBurstTask<T>(task: Task<{ any }, never>): Task<{ T }, never>
	return task :: any
end

local function uncheckedTask<T>(task: Task<any, never>): Task<T, never>
	return task :: any
end

local function nextAny(event: FrameEvent, read: (...any) -> any): Task<any, never>
	local deferred = uncheckedDeferred(Task.withResolvers())
	local unsubscribe: Listener.Unsubscribe
	unsubscribe = Listener.subscribe(event, function(...: any)
		unsubscribe()
		deferred.resolve(read(...))
	end)
	return deferred.task
end

local function nextBurstAny(event: FrameEvent, seconds: number, read: (...any) -> any): Task<{ any }, never>
	local deferred = uncheckedDeferred(Task.withResolvers())
	local burst: { any } = {}
	local count = 0
	local unsubscribe: Listener.Unsubscribe
	unsubscribe = Listener.subscribe(event, function(...: any)
		if count == 0 then
			C_Timer.After(seconds, function()
				unsubscribe()
				deferred.resolve(burst)
			end)
		end
		count += 1
		burst[count] = read(...)
	end)
	return deferred.task
end

function Events.next<T, A...>(event: FrameEvent, read: (A...) -> T): Task<T, never>
	return uncheckedTask(nextAny(event, uncheckedRead(read)))
end

function Events.nextBurst<T, A...>(event: FrameEvent, seconds: number, read: (A...) -> T): Task<{ T }, never>
	return uncheckedBurstTask(nextBurstAny(event, seconds, uncheckedRead(read)))
end

return Events
