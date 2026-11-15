--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetQuestOfferMajorFactionReputationRewards(): Maybe<{ QuestRewardReputationInfo }>
	return Maybe.of(C_QuestOffer.GetQuestOfferMajorFactionReputationRewards())
end

function Wrappers.GetQuestOfferMajorFactionReputationRewardsInto(
	reuse: Maybe<{ QuestRewardReputationInfo }>
): Maybe<{ QuestRewardReputationInfo }>
	return Reuse.maybe(reuse, C_QuestOffer.GetQuestOfferMajorFactionReputationRewards())
end

function Wrappers.GetQuestRequiredCurrencyInfo(questRewardIndex: number): Maybe<QuestRequiredCurrencyInfo>
	return Maybe.of(C_QuestOffer.GetQuestRequiredCurrencyInfo(questRewardIndex))
end

function Wrappers.GetQuestRequiredCurrencyInfoInto(
	reuse: Maybe<QuestRequiredCurrencyInfo>,
	questRewardIndex: number
): Maybe<QuestRequiredCurrencyInfo>
	return Reuse.maybe(reuse, C_QuestOffer.GetQuestRequiredCurrencyInfo(questRewardIndex))
end

function Wrappers.GetQuestRewardCurrencyInfo(
	questInfoType: string,
	questRewardIndex: number
): Maybe<QuestRewardCurrencyInfo>
	return Maybe.of(C_QuestOffer.GetQuestRewardCurrencyInfo(questInfoType, questRewardIndex))
end

function Wrappers.GetQuestRewardCurrencyInfoInto(
	reuse: Maybe<QuestRewardCurrencyInfo>,
	questInfoType: string,
	questRewardIndex: number
): Maybe<QuestRewardCurrencyInfo>
	return Reuse.maybe(reuse, C_QuestOffer.GetQuestRewardCurrencyInfo(questInfoType, questRewardIndex))
end

return Wrappers
