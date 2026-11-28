--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type CanTransferCurrencyResults = {
	read canTransferCurrency: boolean,
	read failureReason: Maybe<Enum_AccountCurrencyTransferResult>,
}

export type DoesWarModeBonusApplyResults = {
	read warModeApplies: Maybe<boolean>,
	read limitOncePerTooltip: Maybe<boolean>,
}

local Wrappers = {}

function Wrappers.CanTransferCurrency(currencyID: number): CanTransferCurrencyResults
	local r1, r2 = C_CurrencyInfo.CanTransferCurrency(currencyID)
	return {
		canTransferCurrency = r1,
		failureReason = Maybe.of(r2),
	}
end

function Wrappers.CanTransferCurrencyInto(
	reuse: CanTransferCurrencyResults,
	currencyID: number
): CanTransferCurrencyResults
	local r1, r2 = C_CurrencyInfo.CanTransferCurrency(currencyID)
	local fields = Reuse.fields(reuse)
	fields.canTransferCurrency = r1
	fields.failureReason = Reuse.maybe(fields.failureReason, r2)
	return reuse
end

function Wrappers.DoesWarModeBonusApply(currencyID: number): DoesWarModeBonusApplyResults
	local r1, r2 = C_CurrencyInfo.DoesWarModeBonusApply(currencyID)
	return {
		warModeApplies = Maybe.of(r1),
		limitOncePerTooltip = Maybe.of(r2),
	}
end

function Wrappers.DoesWarModeBonusApplyInto(
	reuse: DoesWarModeBonusApplyResults,
	currencyID: number
): DoesWarModeBonusApplyResults
	local r1, r2 = C_CurrencyInfo.DoesWarModeBonusApply(currencyID)
	local fields = Reuse.fields(reuse)
	fields.warModeApplies = Reuse.maybe(fields.warModeApplies, r1)
	fields.limitOncePerTooltip = Reuse.maybe(fields.limitOncePerTooltip, r2)
	return reuse
end

function Wrappers.FetchCurrencyDataFromAccountCharacters(currencyID: number): Maybe<{ CharacterCurrencyData }>
	return Maybe.of(C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters(currencyID))
end

function Wrappers.FetchCurrencyDataFromAccountCharactersInto(
	reuse: Maybe<{ CharacterCurrencyData }>,
	currencyID: number
): Maybe<{ CharacterCurrencyData }>
	return Reuse.maybe(reuse, C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters(currencyID))
end

function Wrappers.GetBackpackCurrencyInfo(index: number): Maybe<BackpackCurrencyInfo>
	return Maybe.of(C_CurrencyInfo.GetBackpackCurrencyInfo(index))
end

function Wrappers.GetBackpackCurrencyInfoInto(
	reuse: Maybe<BackpackCurrencyInfo>,
	index: number
): Maybe<BackpackCurrencyInfo>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetBackpackCurrencyInfo(index))
end

function Wrappers.GetBasicCurrencyInfo(currencyType: number, quantity: number?): Maybe<CurrencyDisplayInfo>
	return Maybe.of(C_CurrencyInfo.GetBasicCurrencyInfo(currencyType, quantity))
end

function Wrappers.GetBasicCurrencyInfoInto(
	reuse: Maybe<CurrencyDisplayInfo>,
	currencyType: number,
	quantity: number?
): Maybe<CurrencyDisplayInfo>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetBasicCurrencyInfo(currencyType, quantity))
end

function Wrappers.GetCostToTransferCurrency(currencyID: number, quantity: number): Maybe<number>
	return Maybe.of(C_CurrencyInfo.GetCostToTransferCurrency(currencyID, quantity))
end

function Wrappers.GetCostToTransferCurrencyInto(
	reuse: Maybe<number>,
	currencyID: number,
	quantity: number
): Maybe<number>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetCostToTransferCurrency(currencyID, quantity))
end

function Wrappers.GetCurrencyContainerInfo(currencyType: number, quantity: number): Maybe<CurrencyDisplayInfo>
	return Maybe.of(C_CurrencyInfo.GetCurrencyContainerInfo(currencyType, quantity))
end

function Wrappers.GetCurrencyContainerInfoInto(
	reuse: Maybe<CurrencyDisplayInfo>,
	currencyType: number,
	quantity: number
): Maybe<CurrencyDisplayInfo>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetCurrencyContainerInfo(currencyType, quantity))
end

function Wrappers.GetCurrencyInfo(type: number): Maybe<CurrencyInfo>
	return Maybe.of(C_CurrencyInfo.GetCurrencyInfo(type))
end

function Wrappers.GetCurrencyInfoInto(reuse: Maybe<CurrencyInfo>, type: number): Maybe<CurrencyInfo>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetCurrencyInfo(type))
end

function Wrappers.GetCurrencyInfoFromLink(link: string): Maybe<CurrencyInfo>
	return Maybe.of(C_CurrencyInfo.GetCurrencyInfoFromLink(link))
end

function Wrappers.GetCurrencyInfoFromLinkInto(reuse: Maybe<CurrencyInfo>, link: string): Maybe<CurrencyInfo>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetCurrencyInfoFromLink(link))
end

function Wrappers.GetCurrencyListInfo(index: number): Maybe<CurrencyInfo>
	return Maybe.of(C_CurrencyInfo.GetCurrencyListInfo(index))
end

function Wrappers.GetCurrencyListInfoInto(reuse: Maybe<CurrencyInfo>, index: number): Maybe<CurrencyInfo>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetCurrencyListInfo(index))
end

function Wrappers.GetFactionGrantedByCurrency(currencyID: number): Maybe<number>
	return Maybe.of(C_CurrencyInfo.GetFactionGrantedByCurrency(currencyID))
end

function Wrappers.GetFactionGrantedByCurrencyInto(reuse: Maybe<number>, currencyID: number): Maybe<number>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetFactionGrantedByCurrency(currencyID))
end

function Wrappers.GetMaxTransferableAmountFromQuantity(currencyID: number, requestedQuantity: number): Maybe<number>
	return Maybe.of(C_CurrencyInfo.GetMaxTransferableAmountFromQuantity(currencyID, requestedQuantity))
end

function Wrappers.GetMaxTransferableAmountFromQuantityInto(
	reuse: Maybe<number>,
	currencyID: number,
	requestedQuantity: number
): Maybe<number>
	return Reuse.maybe(reuse, C_CurrencyInfo.GetMaxTransferableAmountFromQuantity(currencyID, requestedQuantity))
end

return Wrappers
