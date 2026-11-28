--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCooldownTimesResults = {
	read start: number,
	read duration: number,
}

local Wrappers = {}

function Wrappers.GetCooldownTimes(object: Cooldown): GetCooldownTimesResults
	local r1, r2 = object:GetCooldownTimes()
	return {
		start = r1,
		duration = r2,
	}
end

function Wrappers.GetCooldownTimesInto(reuse: GetCooldownTimesResults, object: Cooldown): GetCooldownTimesResults
	local r1, r2 = object:GetCooldownTimes()
	local fields = Reuse.fields(reuse)
	fields.start = r1
	fields.duration = r2
	return reuse
end

function Wrappers.GetCountdownFormatter(object: Cooldown): Maybe<NumericFormatter>
	return Maybe.of(object:GetCountdownFormatter())
end

function Wrappers.GetCountdownFormatterInto(reuse: Maybe<NumericFormatter>, object: Cooldown): Maybe<NumericFormatter>
	return Reuse.maybe(reuse, object:GetCountdownFormatter())
end

return Wrappers
