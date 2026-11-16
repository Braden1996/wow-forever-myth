--!strict
export type Env = { [string]: any }
export type Frame = {
	scripts: { [string]: (...any) -> () },
	events: { [string]: boolean },
	SetScript: (self: Frame, script: string, handler: (...any) -> ()) -> (),
	RegisterEvent: (self: Frame, event: string) -> (),
	UnregisterEvent: (self: Frame, event: string) -> (),
}

export type World = {
	env: Env,
	frames: { Frame },
	set: (path: string, value: unknown) -> (),
	fire: (event: string, ...any) -> (),
	advance: (seconds: number) -> (),
	pendingTimers: () -> number,
	registered: (event: string) -> boolean,
}

type Timer = { at: number, callback: () -> () }

local World = {}

local function pick(source: { [string]: any }, names: { string }): { [string]: any }
	local copy = {}
	for _, name in names do
		copy[name] = source[name]
	end
	return copy
end

local function uncheckedLibrary(library: unknown): { [string]: any }
	return library :: any
end

local function lua51(): Env
	local env: Env = {
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
		unpack = table.unpack,
		xpcall = xpcall,
		coroutine = pick(uncheckedLibrary(coroutine), { "create", "resume", "running", "status", "wrap", "yield" }),
		math = pick(uncheckedLibrary(math), { "abs", "ceil", "floor", "huge", "max", "min", "pi", "random", "sqrt" }),
		string = pick(
			uncheckedLibrary(string),
			{ "byte", "char", "find", "format", "gmatch", "gsub", "len", "lower", "match", "rep", "sub", "upper" }
		),
		table = pick(uncheckedLibrary(table), { "concat", "insert", "remove", "sort" }),
	}
	env._G = env
	return env
end

local function newFrame(frames: { Frame }): Frame
	local frame: Frame = {
		scripts = {},
		events = {},
		SetScript = function(self: Frame, script: string, handler: (...any) -> ())
			self.scripts[script] = handler
		end,
		RegisterEvent = function(self: Frame, event: string)
			self.events[event] = true
		end,
		UnregisterEvent = function(self: Frame, event: string)
			self.events[event] = nil
		end,
	}
	table.insert(frames, frame)
	return frame
end

function World.new(): World
	local env = lua51()
	local fakes: Env = {}
	setmetatable(env, { __index = fakes })
	local frames: { Frame } = {}
	local timers: { Timer } = {}
	local now = 0
	local function set(path: string, value: unknown)
		local namespace, name = string.match(path, "^([%w_]+)%.([%w_]+)$")
		if namespace and name then
			fakes[namespace] = fakes[namespace] or {}
			fakes[namespace][name] = value
		else
			fakes[path] = value
		end
	end
	local function fire(event: string, ...: any)
		for _, frame in frames do
			local handler = frame.scripts.OnEvent
			if frame.events[event] and handler then
				handler(frame, event, ...)
			end
		end
	end
	local function advance(seconds: number)
		now += seconds
		local due: { Timer } = {}
		local later: { Timer } = {}
		for _, timer in timers do
			table.insert(if timer.at <= now then due else later, timer)
		end
		timers = later
		for _, timer in due do
			timer.callback()
		end
	end
	fakes.CreateFrame = function(_frameType: string): Frame
		return newFrame(frames)
	end
	set("C_Timer.After", function(seconds: number, callback: () -> ())
		table.insert(timers, { at = now + seconds, callback = callback })
	end)
	return {
		env = env,
		frames = frames,
		set = set,
		fire = fire,
		advance = advance,
		pendingTimers = function(): number
			return #timers
		end,
		registered = function(event: string): boolean
			for _, frame in frames do
				if frame.events[event] then
					return true
				end
			end
			return false
		end,
	}
end

return World
