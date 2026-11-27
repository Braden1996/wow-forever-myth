--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetBuybackItemID(buybackSlotIndex: number): Maybe<number>
	return Maybe.of(C_MerchantFrame.GetBuybackItemID(buybackSlotIndex))
end

function Wrappers.GetBuybackItemIDInto(reuse: Maybe<number>, buybackSlotIndex: number): Maybe<number>
	return Reuse.maybe(reuse, C_MerchantFrame.GetBuybackItemID(buybackSlotIndex))
end

function Wrappers.GetItemInfo(index: number): Maybe<MerchantItemInfo>
	return Maybe.of(C_MerchantFrame.GetItemInfo(index))
end

function Wrappers.GetItemInfoInto(reuse: Maybe<MerchantItemInfo>, index: number): Maybe<MerchantItemInfo>
	return Reuse.maybe(reuse, C_MerchantFrame.GetItemInfo(index))
end

function Wrappers.GetMerchantCurrencies(): Maybe<{ number }>
	return Maybe.of(C_MerchantFrame.GetMerchantCurrencies())
end

function Wrappers.GetMerchantCurrenciesInto(reuse: Maybe<{ number }>): Maybe<{ number }>
	return Reuse.maybe(reuse, C_MerchantFrame.GetMerchantCurrencies())
end

return Wrappers
