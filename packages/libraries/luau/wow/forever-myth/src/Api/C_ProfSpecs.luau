--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetDefaultSpecSkillLine(): Maybe<number>
	return Maybe.of(C_ProfSpecs.GetDefaultSpecSkillLine())
end

function Wrappers.GetDefaultSpecSkillLineInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_ProfSpecs.GetDefaultSpecSkillLine())
end

function Wrappers.GetNewSpecReminderProfName(): Maybe<string>
	return Maybe.of(C_ProfSpecs.GetNewSpecReminderProfName())
end

function Wrappers.GetNewSpecReminderProfNameInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_ProfSpecs.GetNewSpecReminderProfName())
end

function Wrappers.GetRootPathForTab(tabTreeID: number): Maybe<number>
	return Maybe.of(C_ProfSpecs.GetRootPathForTab(tabTreeID))
end

function Wrappers.GetRootPathForTabInto(reuse: Maybe<number>, tabTreeID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ProfSpecs.GetRootPathForTab(tabTreeID))
end

function Wrappers.GetSpendCurrencyForPath(pathID: number): Maybe<number>
	return Maybe.of(C_ProfSpecs.GetSpendCurrencyForPath(pathID))
end

function Wrappers.GetSpendCurrencyForPathInto(reuse: Maybe<number>, pathID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ProfSpecs.GetSpendCurrencyForPath(pathID))
end

function Wrappers.GetTabInfo(tabTreeID: number): Maybe<ProfTabInfo>
	return Maybe.of(C_ProfSpecs.GetTabInfo(tabTreeID))
end

function Wrappers.GetTabInfoInto(reuse: Maybe<ProfTabInfo>, tabTreeID: number): Maybe<ProfTabInfo>
	return Reuse.maybe(reuse, C_ProfSpecs.GetTabInfo(tabTreeID))
end

function Wrappers.GetUnlockRankForPerk(perkID: number): Maybe<number>
	return Maybe.of(C_ProfSpecs.GetUnlockRankForPerk(perkID))
end

function Wrappers.GetUnlockRankForPerkInto(reuse: Maybe<number>, perkID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ProfSpecs.GetUnlockRankForPerk(perkID))
end

return Wrappers
