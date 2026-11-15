--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetTopLeftNotchSafeRegionResults = {
	read left: number,
	read right: number,
	read top: number,
	read bottom: number,
}

export type GetTopRightNotchSafeRegionResults = {
	read left: number,
	read right: number,
	read top: number,
	read bottom: number,
}

local Wrappers = {}

function Wrappers.GetTopLeftNotchSafeRegion(): GetTopLeftNotchSafeRegionResults
	local r1, r2, r3, r4 = C_UI.GetTopLeftNotchSafeRegion()
	return {
		left = r1,
		right = r2,
		top = r3,
		bottom = r4,
	}
end

function Wrappers.GetTopLeftNotchSafeRegionInto(
	reuse: GetTopLeftNotchSafeRegionResults
): GetTopLeftNotchSafeRegionResults
	local r1, r2, r3, r4 = C_UI.GetTopLeftNotchSafeRegion()
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.right = r2
	fields.top = r3
	fields.bottom = r4
	return reuse
end

function Wrappers.GetTopRightNotchSafeRegion(): GetTopRightNotchSafeRegionResults
	local r1, r2, r3, r4 = C_UI.GetTopRightNotchSafeRegion()
	return {
		left = r1,
		right = r2,
		top = r3,
		bottom = r4,
	}
end

function Wrappers.GetTopRightNotchSafeRegionInto(
	reuse: GetTopRightNotchSafeRegionResults
): GetTopRightNotchSafeRegionResults
	local r1, r2, r3, r4 = C_UI.GetTopRightNotchSafeRegion()
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.right = r2
	fields.top = r3
	fields.bottom = r4
	return reuse
end

return Wrappers
