--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.FlyoutHasSpell(flyoutID: number, spellID: number): Maybe<boolean>
	return Maybe.of(C_Flyout.FlyoutHasSpell(flyoutID, spellID))
end

function Wrappers.FlyoutHasSpellInto(reuse: Maybe<boolean>, flyoutID: number, spellID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_Flyout.FlyoutHasSpell(flyoutID, spellID))
end

function Wrappers.GetFlyoutID(index: number): Maybe<number>
	return Maybe.of(C_Flyout.GetFlyoutID(index))
end

function Wrappers.GetFlyoutIDInto(reuse: Maybe<number>, index: number): Maybe<number>
	return Reuse.maybe(reuse, C_Flyout.GetFlyoutID(index))
end

function Wrappers.GetFlyoutInfo(flyoutID: number): Maybe<FlyoutInfo>
	return Maybe.of(C_Flyout.GetFlyoutInfo(flyoutID))
end

function Wrappers.GetFlyoutInfoInto(reuse: Maybe<FlyoutInfo>, flyoutID: number): Maybe<FlyoutInfo>
	return Reuse.maybe(reuse, C_Flyout.GetFlyoutInfo(flyoutID))
end

function Wrappers.GetFlyoutSlotInfo(flyoutID: number, slotIndex: number): Maybe<FlyoutSlotInfo>
	return Maybe.of(C_Flyout.GetFlyoutSlotInfo(flyoutID, slotIndex))
end

function Wrappers.GetFlyoutSlotInfoInto(
	reuse: Maybe<FlyoutSlotInfo>,
	flyoutID: number,
	slotIndex: number
): Maybe<FlyoutSlotInfo>
	return Reuse.maybe(reuse, C_Flyout.GetFlyoutSlotInfo(flyoutID, slotIndex))
end

function Wrappers.GetFlyoutTexture(flyoutID: number): Maybe<fileID>
	return Maybe.of(C_Flyout.GetFlyoutTexture(flyoutID))
end

function Wrappers.GetFlyoutTextureInto(reuse: Maybe<fileID>, flyoutID: number): Maybe<fileID>
	return Reuse.maybe(reuse, C_Flyout.GetFlyoutTexture(flyoutID))
end

return Wrappers
