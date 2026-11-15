--!strict
local Maybe = require("@truemyth/Maybe")
local Task = require("@truemyth/Task")

type Maybe<T> = Maybe.Maybe<T>
type Task<T, E> = Task.Task<T, E>

export type LoadFailed = { read kind: "LoadFailed", read api: string, read key: number? }

export type Spec<T> = {
	api: string,
	event: FrameEvent,
	key: number?,
	request: (key: number) -> (),
	read: () -> Maybe<T>,
}

type AnySpec = Spec<any>
type Settle = (success: boolean) -> ()

local Loads = {}

local waiting: { [string]: { [number]: { Settle } } } = {}
local listener: Frame? = nil

local function uncheckedAnySpec(spec: unknown): AnySpec
	return spec :: any
end

local function uncheckedTask<T>(task: Task<any, LoadFailed>): Task<T, LoadFailed>
	return task :: any
end

local function uncheckedDeferred(deferred: unknown): Task.Deferred<any, LoadFailed>
	return deferred :: any
end

local function settleAll(event: string, key: unknown, success: unknown)
	local byKey = waiting[event]
	if byKey == nil or type(key) ~= "number" then
		return
	end
	local settles = byKey[key]
	if settles == nil then
		return
	end
	byKey[key] = nil
	for _, settle in settles do
		settle(success == true)
	end
end

local function ensureListener(): Frame
	local existing = listener
	if existing then
		return existing
	end
	local frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", function(_self: Frame, event: unknown, key: unknown, success: unknown)
		if type(event) == "string" then
			settleAll(event, key, success)
		end
	end)
	listener = frame
	return frame
end

local function enqueue(event: FrameEvent, key: number, settle: Settle)
	local byKey = waiting[event]
	if byKey == nil then
		byKey = {}
		waiting[event] = byKey
		ensureListener():RegisterEvent(event)
	end
	local settles = byKey[key]
	if settles == nil then
		settles = {}
		byKey[key] = settles
	end
	table.insert(settles, settle)
end

local function failure(spec: AnySpec): LoadFailed
	return { kind = "LoadFailed", api = spec.api, key = spec.key }
end

local function loadAny(spec: AnySpec): Task<any, LoadFailed>
	local cached = spec.read()
	if cached.kind == "Just" then
		return Task.resolve(cached.value)
	end
	local key = spec.key
	if key == nil then
		return Task.reject(failure(spec))
	end
	local deferred = uncheckedDeferred(Task.withResolvers())
	enqueue(spec.event, key, function(success: boolean)
		local loaded = if success then spec.read() else Maybe.nothing()
		if loaded.kind == "Just" then
			deferred.resolve(loaded.value)
		else
			deferred.reject(failure(spec))
		end
	end)
	spec.request(key)
	return deferred.task
end

function Loads.load<T>(spec: Spec<T>): Task<T, LoadFailed>
	return uncheckedTask(loadAny(uncheckedAnySpec(spec)))
end

return Loads
