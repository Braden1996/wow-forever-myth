--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetPushedTextOffsetResults = {
	read offsetX: uiUnit,
	read offsetY: uiUnit,
}

local Wrappers = {}

function Wrappers.GetPushedTextOffset(object: Button): GetPushedTextOffsetResults
	local r1, r2 = object:GetPushedTextOffset()
	return {
		offsetX = r1,
		offsetY = r2,
	}
end

function Wrappers.GetPushedTextOffsetInto(reuse: GetPushedTextOffsetResults, object: Button): GetPushedTextOffsetResults
	local r1, r2 = object:GetPushedTextOffset()
	local fields = Reuse.fields(reuse)
	fields.offsetX = r1
	fields.offsetY = r2
	return reuse
end

return Wrappers
