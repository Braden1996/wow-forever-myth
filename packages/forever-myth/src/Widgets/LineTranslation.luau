--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetOffsetResults = {
	read offsetX: uiUnit,
	read offsetY: uiUnit,
}

local Wrappers = {}

function Wrappers.GetOffset(object: LineTranslation): GetOffsetResults
	local r1, r2 = object:GetOffset()
	return {
		offsetX = r1,
		offsetY = r2,
	}
end

function Wrappers.GetOffsetInto(reuse: GetOffsetResults, object: LineTranslation): GetOffsetResults
	local r1, r2 = object:GetOffset()
	local fields = Reuse.fields(reuse)
	fields.offsetX = r1
	fields.offsetY = r2
	return reuse
end

return Wrappers
