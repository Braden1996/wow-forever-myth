--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetPOITextureCoordsResults = {
	read textureCoordsX: number,
	read textureCoordsY: number,
	read textureCoordsZ: number,
	read textureCoordsW: number,
}

local Wrappers = {}

function Wrappers.GetPOITextureCoords(index: number?): GetPOITextureCoordsResults
	local r1, r2, r3, r4 = C_Minimap.GetPOITextureCoords(index)
	return {
		textureCoordsX = r1,
		textureCoordsY = r2,
		textureCoordsZ = r3,
		textureCoordsW = r4,
	}
end

function Wrappers.GetPOITextureCoordsInto(reuse: GetPOITextureCoordsResults, index: number?): GetPOITextureCoordsResults
	local r1, r2, r3, r4 = C_Minimap.GetPOITextureCoords(index)
	local fields = Reuse.fields(reuse)
	fields.textureCoordsX = r1
	fields.textureCoordsY = r2
	fields.textureCoordsZ = r3
	fields.textureCoordsW = r4
	return reuse
end

function Wrappers.GetTrackingInfo(spellIndex: number): Maybe<MinimapScriptTrackingInfo>
	return Maybe.of(C_Minimap.GetTrackingInfo(spellIndex))
end

function Wrappers.GetTrackingInfoInto(
	reuse: Maybe<MinimapScriptTrackingInfo>,
	spellIndex: number
): Maybe<MinimapScriptTrackingInfo>
	return Reuse.maybe(reuse, C_Minimap.GetTrackingInfo(spellIndex))
end

function Wrappers.GetUiMapID(): Maybe<number>
	return Maybe.of(C_Minimap.GetUiMapID())
end

function Wrappers.GetUiMapIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Minimap.GetUiMapID())
end

return Wrappers
