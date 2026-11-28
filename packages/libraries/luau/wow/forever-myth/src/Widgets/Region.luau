--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetDrawLayerResults = {
	read layer: DrawLayer,
	read sublayer: number,
}

export type GetVertexColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
	read colorA: number,
}

local Wrappers = {}

function Wrappers.GetDrawLayer(object: Region): GetDrawLayerResults
	local r1, r2 = object:GetDrawLayer()
	return {
		layer = r1,
		sublayer = r2,
	}
end

function Wrappers.GetDrawLayerInto(reuse: GetDrawLayerResults, object: Region): GetDrawLayerResults
	local r1, r2 = object:GetDrawLayer()
	local fields = Reuse.fields(reuse)
	fields.layer = r1
	fields.sublayer = r2
	return reuse
end

function Wrappers.GetVertexColor(object: Region): Maybe<GetVertexColorResults>
	local r1, r2, r3, r4 = object:GetVertexColor()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	})
end

function Wrappers.GetVertexColorInto(reuse: GetVertexColorResults, object: Region): Maybe<GetVertexColorResults>
	local r1, r2, r3, r4 = object:GetVertexColor()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return Reuse.just(reuse)
end

return Wrappers
