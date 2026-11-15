--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCurrencyIDForStore(storeFrontID: number): Maybe<number>
	return Maybe.of(C_AccountStore.GetCurrencyIDForStore(storeFrontID))
end

function Wrappers.GetCurrencyIDForStoreInto(reuse: Maybe<number>, storeFrontID: number): Maybe<number>
	return Reuse.maybe(reuse, C_AccountStore.GetCurrencyIDForStore(storeFrontID))
end

function Wrappers.GetItemInfo(itemID: number): Maybe<AccountStoreItemInfo>
	return Maybe.of(C_AccountStore.GetItemInfo(itemID))
end

function Wrappers.GetItemInfoInto(reuse: Maybe<AccountStoreItemInfo>, itemID: number): Maybe<AccountStoreItemInfo>
	return Reuse.maybe(reuse, C_AccountStore.GetItemInfo(itemID))
end

return Wrappers
