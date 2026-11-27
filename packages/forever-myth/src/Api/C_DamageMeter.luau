--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type IsDamageMeterAvailableResults = {
	read isAvailable: boolean,
	read failureReason: string,
}

local Wrappers = {}

function Wrappers.GetSessionDurationSeconds(sessionType: Enum_DamageMeterSessionType): Maybe<number>
	return Maybe.of(C_DamageMeter.GetSessionDurationSeconds(sessionType))
end

function Wrappers.GetSessionDurationSecondsInto(
	reuse: Maybe<number>,
	sessionType: Enum_DamageMeterSessionType
): Maybe<number>
	return Reuse.maybe(reuse, C_DamageMeter.GetSessionDurationSeconds(sessionType))
end

function Wrappers.IsDamageMeterAvailable(): IsDamageMeterAvailableResults
	local r1, r2 = C_DamageMeter.IsDamageMeterAvailable()
	return {
		isAvailable = r1,
		failureReason = r2,
	}
end

function Wrappers.IsDamageMeterAvailableInto(reuse: IsDamageMeterAvailableResults): IsDamageMeterAvailableResults
	local r1, r2 = C_DamageMeter.IsDamageMeterAvailable()
	local fields = Reuse.fields(reuse)
	fields.isAvailable = r1
	fields.failureReason = r2
	return reuse
end

return Wrappers
