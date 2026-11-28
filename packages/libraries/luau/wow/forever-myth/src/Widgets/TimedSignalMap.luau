--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetNextSignalResults = {
	read key: number,
	read time: FrameTime,
}

local Wrappers = {}

function Wrappers.GetNextSignal(object: TimedSignalMap): GetNextSignalResults
	local r1, r2 = object:GetNextSignal()
	return {
		key = r1,
		time = r2,
	}
end

function Wrappers.GetNextSignalInto(reuse: GetNextSignalResults, object: TimedSignalMap): GetNextSignalResults
	local r1, r2 = object:GetNextSignal()
	local fields = Reuse.fields(reuse)
	fields.key = r1
	fields.time = r2
	return reuse
end

function Wrappers.GetSignalTime(object: TimedSignalMap, key: number): Maybe<FrameTime>
	return Maybe.of(object:GetSignalTime(key))
end

function Wrappers.GetSignalTimeInto(reuse: Maybe<FrameTime>, object: TimedSignalMap, key: number): Maybe<FrameTime>
	return Reuse.maybe(reuse, object:GetSignalTime(key))
end

return Wrappers
