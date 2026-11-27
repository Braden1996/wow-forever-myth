--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetNamePlateHitTestInsetsResults = {
	read left: uiUnit,
	read right: uiUnit,
	read top: uiUnit,
	read bottom: uiUnit,
}

local Wrappers = {}

function Wrappers.GetNamePlateHitTestInsets(type: Enum_NamePlateType): GetNamePlateHitTestInsetsResults
	local r1, r2, r3, r4 = C_NamePlateManager.GetNamePlateHitTestInsets(type)
	return {
		left = r1,
		right = r2,
		top = r3,
		bottom = r4,
	}
end

function Wrappers.GetNamePlateHitTestInsetsInto(
	reuse: GetNamePlateHitTestInsetsResults,
	type: Enum_NamePlateType
): GetNamePlateHitTestInsetsResults
	local r1, r2, r3, r4 = C_NamePlateManager.GetNamePlateHitTestInsets(type)
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.right = r2
	fields.top = r3
	fields.bottom = r4
	return reuse
end

return Wrappers
