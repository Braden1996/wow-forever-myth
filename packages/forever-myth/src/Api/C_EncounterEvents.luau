--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetEventColor(encounterEventID: number, trigger: Enum_EncounterEventColorTrigger): Maybe<ColorMixin>
	return Maybe.of(C_EncounterEvents.GetEventColor(encounterEventID, trigger))
end

function Wrappers.GetEventColorInto(
	reuse: Maybe<ColorMixin>,
	encounterEventID: number,
	trigger: Enum_EncounterEventColorTrigger
): Maybe<ColorMixin>
	return Reuse.maybe(reuse, C_EncounterEvents.GetEventColor(encounterEventID, trigger))
end

function Wrappers.GetEventInfo(encounterEventID: number): Maybe<EncounterEventInfo>
	return Maybe.of(C_EncounterEvents.GetEventInfo(encounterEventID))
end

function Wrappers.GetEventInfoInto(
	reuse: Maybe<EncounterEventInfo>,
	encounterEventID: number
): Maybe<EncounterEventInfo>
	return Reuse.maybe(reuse, C_EncounterEvents.GetEventInfo(encounterEventID))
end

function Wrappers.GetEventSound(
	encounterEventID: number,
	trigger: Enum_EncounterEventSoundTrigger
): Maybe<EncounterEventSoundInfo>
	return Maybe.of(C_EncounterEvents.GetEventSound(encounterEventID, trigger))
end

function Wrappers.GetEventSoundInto(
	reuse: Maybe<EncounterEventSoundInfo>,
	encounterEventID: number,
	trigger: Enum_EncounterEventSoundTrigger
): Maybe<EncounterEventSoundInfo>
	return Reuse.maybe(reuse, C_EncounterEvents.GetEventSound(encounterEventID, trigger))
end

return Wrappers
