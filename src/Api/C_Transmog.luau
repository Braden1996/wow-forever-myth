--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAllSetAppearancesByID(setID: number): Maybe<{ TransmogSetItemInfo }>
	return Maybe.of(C_Transmog.GetAllSetAppearancesByID(setID))
end

function Wrappers.GetAllSetAppearancesByIDInto(
	reuse: Maybe<{ TransmogSetItemInfo }>,
	setID: number
): Maybe<{ TransmogSetItemInfo }>
	return Reuse.maybe(reuse, C_Transmog.GetAllSetAppearancesByID(setID))
end

function Wrappers.GetItemIDForSource(itemModifiedAppearanceID: number): Maybe<number>
	return Maybe.of(C_Transmog.GetItemIDForSource(itemModifiedAppearanceID))
end

function Wrappers.GetItemIDForSourceInto(reuse: Maybe<number>, itemModifiedAppearanceID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Transmog.GetItemIDForSource(itemModifiedAppearanceID))
end

function Wrappers.GetSlotForInventoryType(inventoryType: number): Maybe<number>
	return Maybe.of(C_Transmog.GetSlotForInventoryType(inventoryType))
end

function Wrappers.GetSlotForInventoryTypeInto(reuse: Maybe<number>, inventoryType: number): Maybe<number>
	return Reuse.maybe(reuse, C_Transmog.GetSlotForInventoryType(inventoryType))
end

function Wrappers.GetSlotVisualInfo(transmogLocation: TransmogLocationMixin): Maybe<TransmogSlotVisualInfo>
	return Maybe.of(C_Transmog.GetSlotVisualInfo(transmogLocation))
end

function Wrappers.GetSlotVisualInfoInto(
	reuse: Maybe<TransmogSlotVisualInfo>,
	transmogLocation: TransmogLocationMixin
): Maybe<TransmogSlotVisualInfo>
	return Reuse.maybe(reuse, C_Transmog.GetSlotVisualInfo(transmogLocation))
end

return Wrappers
