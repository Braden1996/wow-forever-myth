--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type EvaluateUnpackedResults = {
	read yR: number,
	read yG: number,
	read yB: number,
	read yA: number,
}

local Wrappers = {}

function Wrappers.EvaluateUnpacked(object: LuaColorCurveObject, x: number): EvaluateUnpackedResults
	local r1, r2, r3, r4 = object:EvaluateUnpacked(x)
	return {
		yR = r1,
		yG = r2,
		yB = r3,
		yA = r4,
	}
end

function Wrappers.EvaluateUnpackedInto(
	reuse: EvaluateUnpackedResults,
	object: LuaColorCurveObject,
	x: number
): EvaluateUnpackedResults
	local r1, r2, r3, r4 = object:EvaluateUnpacked(x)
	local fields = Reuse.fields(reuse)
	fields.yR = r1
	fields.yG = r2
	fields.yB = r3
	fields.yA = r4
	return reuse
end

function Wrappers.GetPoint(object: LuaColorCurveObject, index: number): Maybe<LuaColorCurvePoint>
	return Maybe.of(object:GetPoint(index))
end

function Wrappers.GetPointInto(
	reuse: Maybe<LuaColorCurvePoint>,
	object: LuaColorCurveObject,
	index: number
): Maybe<LuaColorCurvePoint>
	return Reuse.maybe(reuse, object:GetPoint(index))
end

return Wrappers
