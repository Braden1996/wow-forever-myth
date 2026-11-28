--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.AddToKnownTargetingList(unit: UnitToken): Maybe<boolean>
	return Maybe.of(C_CombatAudioAlert.AddToKnownTargetingList(unit))
end

function Wrappers.AddToKnownTargetingListInto(reuse: Maybe<boolean>, unit: UnitToken): Maybe<boolean>
	return Reuse.maybe(reuse, C_CombatAudioAlert.AddToKnownTargetingList(unit))
end

function Wrappers.RemoveFromKnownTargetingList(unit: UnitToken): Maybe<boolean>
	return Maybe.of(C_CombatAudioAlert.RemoveFromKnownTargetingList(unit))
end

function Wrappers.RemoveFromKnownTargetingListInto(reuse: Maybe<boolean>, unit: UnitToken): Maybe<boolean>
	return Reuse.maybe(reuse, C_CombatAudioAlert.RemoveFromKnownTargetingList(unit))
end

function Wrappers.SpeakText(
	text: string,
	category: Enum_CombatAudioAlertCategory,
	allowOverlap: boolean?
): Maybe<number>
	return Maybe.of(C_CombatAudioAlert.SpeakText(text, category, allowOverlap))
end

function Wrappers.SpeakTextInto(
	reuse: Maybe<number>,
	text: string,
	category: Enum_CombatAudioAlertCategory,
	allowOverlap: boolean?
): Maybe<number>
	return Reuse.maybe(reuse, C_CombatAudioAlert.SpeakText(text, category, allowOverlap))
end

return Wrappers
