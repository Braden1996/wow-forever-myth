--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.BankBagTypeAndIDToInvSlot(bankType: Enum_BankType, slotIndex: number): Maybe<number>
	return Maybe.of(C_Bank.BankBagTypeAndIDToInvSlot(bankType, slotIndex))
end

function Wrappers.BankBagTypeAndIDToInvSlotInto(
	reuse: Maybe<number>,
	bankType: Enum_BankType,
	slotIndex: number
): Maybe<number>
	return Reuse.maybe(reuse, C_Bank.BankBagTypeAndIDToInvSlot(bankType, slotIndex))
end

function Wrappers.FetchBankLockedReason(bankType: Enum_BankType): Maybe<Enum_BankLockedReason>
	return Maybe.of(C_Bank.FetchBankLockedReason(bankType))
end

function Wrappers.FetchBankLockedReasonInto(
	reuse: Maybe<Enum_BankLockedReason>,
	bankType: Enum_BankType
): Maybe<Enum_BankLockedReason>
	return Reuse.maybe(reuse, C_Bank.FetchBankLockedReason(bankType))
end

function Wrappers.FetchNextPurchasableBankTabData(bankType: Enum_BankType): Maybe<PurchasableBankTabData>
	return Maybe.of(C_Bank.FetchNextPurchasableBankTabData(bankType))
end

function Wrappers.FetchNextPurchasableBankTabDataInto(
	reuse: Maybe<PurchasableBankTabData>,
	bankType: Enum_BankType
): Maybe<PurchasableBankTabData>
	return Reuse.maybe(reuse, C_Bank.FetchNextPurchasableBankTabData(bankType))
end

return Wrappers
