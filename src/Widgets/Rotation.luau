--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetOriginResults = {
	read point: FramePoint,
	read originX: number,
	read originY: number,
}

local Wrappers = {}

function Wrappers.GetOrigin(object: Rotation): GetOriginResults
	local r1, r2, r3 = object:GetOrigin()
	return {
		point = r1,
		originX = r2,
		originY = r3,
	}
end

function Wrappers.GetOriginInto(reuse: GetOriginResults, object: Rotation): GetOriginResults
	local r1, r2, r3 = object:GetOrigin()
	local fields = Reuse.fields(reuse)
	fields.point = r1
	fields.originX = r2
	fields.originY = r3
	return reuse
end

return Wrappers
