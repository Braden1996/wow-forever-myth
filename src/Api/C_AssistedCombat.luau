--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type IsAvailableResults = {
	read isAvailable: boolean,
	read failureReason: string,
}

local Wrappers = {}

function Wrappers.GetActionSpell(): Maybe<number>
	return Maybe.of(C_AssistedCombat.GetActionSpell())
end

function Wrappers.GetActionSpellInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_AssistedCombat.GetActionSpell())
end

function Wrappers.GetNextCastSpell(checkForVisibleButton: boolean?): Maybe<number>
	return Maybe.of(C_AssistedCombat.GetNextCastSpell(checkForVisibleButton))
end

function Wrappers.GetNextCastSpellInto(reuse: Maybe<number>, checkForVisibleButton: boolean?): Maybe<number>
	return Reuse.maybe(reuse, C_AssistedCombat.GetNextCastSpell(checkForVisibleButton))
end

function Wrappers.IsAvailable(): IsAvailableResults
	local r1, r2 = C_AssistedCombat.IsAvailable()
	return {
		isAvailable = r1,
		failureReason = r2,
	}
end

function Wrappers.IsAvailableInto(reuse: IsAvailableResults): IsAvailableResults
	local r1, r2 = C_AssistedCombat.IsAvailable()
	local fields = Reuse.fields(reuse)
	fields.isAvailable = r1
	fields.failureReason = r2
	return reuse
end

return Wrappers
