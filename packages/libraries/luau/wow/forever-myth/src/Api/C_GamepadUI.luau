--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetFirstGamepadActionBarStorageSlotIndexForActiveStance(): Maybe<number>
	return Maybe.of(C_GamepadUI.GetFirstGamepadActionBarStorageSlotIndexForActiveStance())
end

function Wrappers.GetFirstGamepadActionBarStorageSlotIndexForActiveStanceInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_GamepadUI.GetFirstGamepadActionBarStorageSlotIndexForActiveStance())
end

return Wrappers
