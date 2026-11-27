--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetMentorRequirementsResults = {
	read achievementIDs: { number },
	read optionalAchievementIDs: { number },
	read optionalCompleteAtLeastCount: number,
}

local Wrappers = {}

function Wrappers.GetMentorLevelRequirement(): Maybe<number>
	return Maybe.of(C_PlayerMentorship.GetMentorLevelRequirement())
end

function Wrappers.GetMentorLevelRequirementInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_PlayerMentorship.GetMentorLevelRequirement())
end

function Wrappers.GetMentorRequirements(): GetMentorRequirementsResults
	local r1, r2, r3 = C_PlayerMentorship.GetMentorRequirements()
	return {
		achievementIDs = r1,
		optionalAchievementIDs = r2,
		optionalCompleteAtLeastCount = r3,
	}
end

function Wrappers.GetMentorRequirementsInto(reuse: GetMentorRequirementsResults): GetMentorRequirementsResults
	local r1, r2, r3 = C_PlayerMentorship.GetMentorRequirements()
	local fields = Reuse.fields(reuse)
	fields.achievementIDs = r1
	fields.optionalAchievementIDs = r2
	fields.optionalCompleteAtLeastCount = r3
	return reuse
end

return Wrappers
