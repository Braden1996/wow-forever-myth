--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.PlaySound(severity: Enum_EncounterEventSeverity): Maybe<number>
	return Maybe.of(C_EncounterWarnings.PlaySound(severity))
end

function Wrappers.PlaySoundInto(reuse: Maybe<number>, severity: Enum_EncounterEventSeverity): Maybe<number>
	return Reuse.maybe(reuse, C_EncounterWarnings.PlaySound(severity))
end

return Wrappers
