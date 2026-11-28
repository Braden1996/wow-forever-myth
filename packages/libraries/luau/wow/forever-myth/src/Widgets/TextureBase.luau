--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetTexCoordResults = {
	read ulX: number,
	read ulY: number,
	read llX: number,
	read llY: number,
	read urX: number,
	read urY: number,
	read lrX: number,
	read lrY: number,
}

export type GetTextureSliceMarginsResults = {
	read left: number,
	read top: number,
	read right: number,
	read bottom: number,
}

export type GetVertexOffsetResults = {
	read offsetX: uiUnit,
	read offsetY: uiUnit,
}

local Wrappers = {}

function Wrappers.GetTexCoord(object: TextureBase): GetTexCoordResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = object:GetTexCoord()
	return {
		ulX = r1,
		ulY = r2,
		llX = r3,
		llY = r4,
		urX = r5,
		urY = r6,
		lrX = r7,
		lrY = r8,
	}
end

function Wrappers.GetTexCoordInto(reuse: GetTexCoordResults, object: TextureBase): GetTexCoordResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = object:GetTexCoord()
	local fields = Reuse.fields(reuse)
	fields.ulX = r1
	fields.ulY = r2
	fields.llX = r3
	fields.llY = r4
	fields.urX = r5
	fields.urY = r6
	fields.lrX = r7
	fields.lrY = r8
	return reuse
end

function Wrappers.GetTexture(object: TextureBase): Maybe<string>
	return Maybe.of(object:GetTexture())
end

function Wrappers.GetTextureInto(reuse: Maybe<string>, object: TextureBase): Maybe<string>
	return Reuse.maybe(reuse, object:GetTexture())
end

function Wrappers.GetTextureFilePath(object: TextureBase): Maybe<string>
	return Maybe.of(object:GetTextureFilePath())
end

function Wrappers.GetTextureFilePathInto(reuse: Maybe<string>, object: TextureBase): Maybe<string>
	return Reuse.maybe(reuse, object:GetTextureFilePath())
end

function Wrappers.GetTextureSliceMargins(object: TextureBase): Maybe<GetTextureSliceMarginsResults>
	local r1, r2, r3, r4 = object:GetTextureSliceMargins()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		left = r1,
		top = r2,
		right = r3,
		bottom = r4,
	})
end

function Wrappers.GetTextureSliceMarginsInto(
	reuse: GetTextureSliceMarginsResults,
	object: TextureBase
): Maybe<GetTextureSliceMarginsResults>
	local r1, r2, r3, r4 = object:GetTextureSliceMargins()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.top = r2
	fields.right = r3
	fields.bottom = r4
	return Reuse.just(reuse)
end

function Wrappers.GetTextureSliceMode(object: TextureBase): Maybe<Enum_UITextureSliceMode>
	return Maybe.of(object:GetTextureSliceMode())
end

function Wrappers.GetTextureSliceModeInto(
	reuse: Maybe<Enum_UITextureSliceMode>,
	object: TextureBase
): Maybe<Enum_UITextureSliceMode>
	return Reuse.maybe(reuse, object:GetTextureSliceMode())
end

function Wrappers.GetVertexOffset(object: TextureBase, vertexIndex: number): GetVertexOffsetResults
	local r1, r2 = object:GetVertexOffset(vertexIndex)
	return {
		offsetX = r1,
		offsetY = r2,
	}
end

function Wrappers.GetVertexOffsetInto(
	reuse: GetVertexOffsetResults,
	object: TextureBase,
	vertexIndex: number
): GetVertexOffsetResults
	local r1, r2 = object:GetVertexOffset(vertexIndex)
	local fields = Reuse.fields(reuse)
	fields.offsetX = r1
	fields.offsetY = r2
	return reuse
end

return Wrappers
