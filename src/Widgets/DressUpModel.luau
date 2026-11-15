--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetItemTransmogInfo(object: DressUpModel, inventorySlot: number): Maybe<ItemTransmogInfoMixin>
	return Maybe.of(object:GetItemTransmogInfo(inventorySlot))
end

function Wrappers.GetItemTransmogInfoInto(
	reuse: Maybe<ItemTransmogInfoMixin>,
	object: DressUpModel,
	inventorySlot: number
): Maybe<ItemTransmogInfoMixin>
	return Reuse.maybe(reuse, object:GetItemTransmogInfo(inventorySlot))
end

function Wrappers.TryOn(
	object: DressUpModel,
	linkOrItemModifiedAppearanceID: IDOrLink,
	handSlotName: string?,
	spellEnchantID: number?
): Maybe<Enum_ItemTryOnReason>
	return Maybe.of(object:TryOn(linkOrItemModifiedAppearanceID, handSlotName, spellEnchantID))
end

function Wrappers.TryOnInto(
	reuse: Maybe<Enum_ItemTryOnReason>,
	object: DressUpModel,
	linkOrItemModifiedAppearanceID: IDOrLink,
	handSlotName: string?,
	spellEnchantID: number?
): Maybe<Enum_ItemTryOnReason>
	return Reuse.maybe(reuse, object:TryOn(linkOrItemModifiedAppearanceID, handSlotName, spellEnchantID))
end

return Wrappers
