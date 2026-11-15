--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetEssenceInfo(essenceID: number): Maybe<AzeriteEssenceInfo>
	return Maybe.of(C_AzeriteEssence.GetEssenceInfo(essenceID))
end

function Wrappers.GetEssenceInfoInto(reuse: Maybe<AzeriteEssenceInfo>, essenceID: number): Maybe<AzeriteEssenceInfo>
	return Reuse.maybe(reuse, C_AzeriteEssence.GetEssenceInfo(essenceID))
end

function Wrappers.GetEssences(): Maybe<{ AzeriteEssenceInfo }>
	return Maybe.of(C_AzeriteEssence.GetEssences())
end

function Wrappers.GetEssencesInto(reuse: Maybe<{ AzeriteEssenceInfo }>): Maybe<{ AzeriteEssenceInfo }>
	return Reuse.maybe(reuse, C_AzeriteEssence.GetEssences())
end

function Wrappers.GetMilestoneEssence(milestoneID: number): Maybe<number>
	return Maybe.of(C_AzeriteEssence.GetMilestoneEssence(milestoneID))
end

function Wrappers.GetMilestoneEssenceInto(reuse: Maybe<number>, milestoneID: number): Maybe<number>
	return Reuse.maybe(reuse, C_AzeriteEssence.GetMilestoneEssence(milestoneID))
end

function Wrappers.GetMilestoneInfo(milestoneID: number): Maybe<AzeriteMilestoneInfo>
	return Maybe.of(C_AzeriteEssence.GetMilestoneInfo(milestoneID))
end

function Wrappers.GetMilestoneInfoInto(
	reuse: Maybe<AzeriteMilestoneInfo>,
	milestoneID: number
): Maybe<AzeriteMilestoneInfo>
	return Reuse.maybe(reuse, C_AzeriteEssence.GetMilestoneInfo(milestoneID))
end

function Wrappers.GetMilestoneSpell(milestoneID: number): Maybe<number>
	return Maybe.of(C_AzeriteEssence.GetMilestoneSpell(milestoneID))
end

function Wrappers.GetMilestoneSpellInto(reuse: Maybe<number>, milestoneID: number): Maybe<number>
	return Reuse.maybe(reuse, C_AzeriteEssence.GetMilestoneSpell(milestoneID))
end

function Wrappers.GetMilestones(): Maybe<{ AzeriteMilestoneInfo }>
	return Maybe.of(C_AzeriteEssence.GetMilestones())
end

function Wrappers.GetMilestonesInto(reuse: Maybe<{ AzeriteMilestoneInfo }>): Maybe<{ AzeriteMilestoneInfo }>
	return Reuse.maybe(reuse, C_AzeriteEssence.GetMilestones())
end

return Wrappers
