--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetMinimumWidthResults = {
	read width: number,
	read forced: boolean,
}

export type GetPaddingResults = {
	read right: number,
	read bottom: number,
	read left: number,
	read top: number,
}

local Wrappers = {}

function Wrappers.GetMinimumWidth(object: GameTooltip): GetMinimumWidthResults
	local r1, r2 = object:GetMinimumWidth()
	return {
		width = r1,
		forced = r2,
	}
end

function Wrappers.GetMinimumWidthInto(reuse: GetMinimumWidthResults, object: GameTooltip): GetMinimumWidthResults
	local r1, r2 = object:GetMinimumWidth()
	local fields = Reuse.fields(reuse)
	fields.width = r1
	fields.forced = r2
	return reuse
end

function Wrappers.GetPadding(object: GameTooltip): GetPaddingResults
	local r1, r2, r3, r4 = object:GetPadding()
	return {
		right = r1,
		bottom = r2,
		left = r3,
		top = r4,
	}
end

function Wrappers.GetPaddingInto(reuse: GetPaddingResults, object: GameTooltip): GetPaddingResults
	local r1, r2, r3, r4 = object:GetPadding()
	local fields = Reuse.fields(reuse)
	fields.right = r1
	fields.bottom = r2
	fields.left = r3
	fields.top = r4
	return reuse
end

return Wrappers
