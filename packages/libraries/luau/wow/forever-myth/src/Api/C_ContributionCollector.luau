--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetRequiredContributionCurrencyResults = {
	read currencyID: number,
	read currencyAmount: number,
}

export type GetRequiredContributionItemResults = {
	read itemID: number,
	read itemCount: number,
}

export type GetStateResults = {
	read contributionState: Enum_ContributionState,
	read contributionPercentageComplete: number,
	read timeOfNextStateChange: Maybe<time_t>,
	read startTime: time_t,
}

local Wrappers = {}

function Wrappers.GetContributionAppearance(
	contributionID: number,
	contributionState: Enum_ContributionState
): Maybe<ContributionAppearance>
	return Maybe.of(C_ContributionCollector.GetContributionAppearance(contributionID, contributionState))
end

function Wrappers.GetContributionAppearanceInto(
	reuse: Maybe<ContributionAppearance>,
	contributionID: number,
	contributionState: Enum_ContributionState
): Maybe<ContributionAppearance>
	return Reuse.maybe(reuse, C_ContributionCollector.GetContributionAppearance(contributionID, contributionState))
end

function Wrappers.GetRequiredContributionCurrency(contributionID: number): Maybe<GetRequiredContributionCurrencyResults>
	local r1, r2 = C_ContributionCollector.GetRequiredContributionCurrency(contributionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		currencyID = r1,
		currencyAmount = r2,
	})
end

function Wrappers.GetRequiredContributionCurrencyInto(
	reuse: GetRequiredContributionCurrencyResults,
	contributionID: number
): Maybe<GetRequiredContributionCurrencyResults>
	local r1, r2 = C_ContributionCollector.GetRequiredContributionCurrency(contributionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.currencyID = r1
	fields.currencyAmount = r2
	return Reuse.just(reuse)
end

function Wrappers.GetRequiredContributionItem(contributionID: number): Maybe<GetRequiredContributionItemResults>
	local r1, r2 = C_ContributionCollector.GetRequiredContributionItem(contributionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemID = r1,
		itemCount = r2,
	})
end

function Wrappers.GetRequiredContributionItemInto(
	reuse: GetRequiredContributionItemResults,
	contributionID: number
): Maybe<GetRequiredContributionItemResults>
	local r1, r2 = C_ContributionCollector.GetRequiredContributionItem(contributionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemID = r1
	fields.itemCount = r2
	return Reuse.just(reuse)
end

function Wrappers.GetState(contributionID: number): GetStateResults
	local r1, r2, r3, r4 = C_ContributionCollector.GetState(contributionID)
	return {
		contributionState = r1,
		contributionPercentageComplete = r2,
		timeOfNextStateChange = Maybe.of(r3),
		startTime = r4,
	}
end

function Wrappers.GetStateInto(reuse: GetStateResults, contributionID: number): GetStateResults
	local r1, r2, r3, r4 = C_ContributionCollector.GetState(contributionID)
	local fields = Reuse.fields(reuse)
	fields.contributionState = r1
	fields.contributionPercentageComplete = r2
	fields.timeOfNextStateChange = Reuse.maybe(fields.timeOfNextStateChange, r3)
	fields.startTime = r4
	return reuse
end

return Wrappers
