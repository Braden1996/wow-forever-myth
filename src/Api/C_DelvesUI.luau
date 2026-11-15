--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type IsDelveEntranceTierEnabledResults = {
	read isEnabled: boolean,
	read failureReason: Maybe<string>,
}

local Wrappers = {}

function Wrappers.GetDelveEntranceDescriptionString(): Maybe<string>
	return Maybe.of(C_DelvesUI.GetDelveEntranceDescriptionString())
end

function Wrappers.GetDelveEntranceDescriptionStringInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_DelvesUI.GetDelveEntranceDescriptionString())
end

function Wrappers.GetDelveEntranceHeaderString(): Maybe<string>
	return Maybe.of(C_DelvesUI.GetDelveEntranceHeaderString())
end

function Wrappers.GetDelveEntranceHeaderStringInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_DelvesUI.GetDelveEntranceHeaderString())
end

function Wrappers.GetDelveEntranceTitleString(): Maybe<string>
	return Maybe.of(C_DelvesUI.GetDelveEntranceTitleString())
end

function Wrappers.GetDelveEntranceTitleStringInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_DelvesUI.GetDelveEntranceTitleString())
end

function Wrappers.GetDelvesMinRequiredLevel(): Maybe<number>
	return Maybe.of(C_DelvesUI.GetDelvesMinRequiredLevel())
end

function Wrappers.GetDelvesMinRequiredLevelInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_DelvesUI.GetDelvesMinRequiredLevel())
end

function Wrappers.GetPlayerCompanionPDEID(companionID: number?): Maybe<number>
	return Maybe.of(C_DelvesUI.GetPlayerCompanionPDEID(companionID))
end

function Wrappers.GetPlayerCompanionPDEIDInto(reuse: Maybe<number>, companionID: number?): Maybe<number>
	return Reuse.maybe(reuse, C_DelvesUI.GetPlayerCompanionPDEID(companionID))
end

function Wrappers.GetTieredEntranceOptionalAffixTraitTreeID(): Maybe<number>
	return Maybe.of(C_DelvesUI.GetTieredEntranceOptionalAffixTraitTreeID())
end

function Wrappers.GetTieredEntranceOptionalAffixTraitTreeIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_DelvesUI.GetTieredEntranceOptionalAffixTraitTreeID())
end

function Wrappers.IsDelveEntranceTierEnabled(tier: number): IsDelveEntranceTierEnabledResults
	local r1, r2 = C_DelvesUI.IsDelveEntranceTierEnabled(tier)
	return {
		isEnabled = r1,
		failureReason = Maybe.of(r2),
	}
end

function Wrappers.IsDelveEntranceTierEnabledInto(
	reuse: IsDelveEntranceTierEnabledResults,
	tier: number
): IsDelveEntranceTierEnabledResults
	local r1, r2 = C_DelvesUI.IsDelveEntranceTierEnabled(tier)
	local fields = Reuse.fields(reuse)
	fields.isEnabled = r1
	fields.failureReason = Reuse.maybe(fields.failureReason, r2)
	return reuse
end

return Wrappers
