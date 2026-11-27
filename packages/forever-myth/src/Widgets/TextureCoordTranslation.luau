--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetOffsetResults = {
	read offsetU: number,
	read offsetV: number,
}

local Wrappers = {}

function Wrappers.GetOffset(object: TextureCoordTranslation): GetOffsetResults
	local r1, r2 = object:GetOffset()
	return {
		offsetU = r1,
		offsetV = r2,
	}
end

function Wrappers.GetOffsetInto(reuse: GetOffsetResults, object: TextureCoordTranslation): GetOffsetResults
	local r1, r2 = object:GetOffset()
	local fields = Reuse.fields(reuse)
	fields.offsetU = r1
	fields.offsetV = r2
	return reuse
end

return Wrappers
