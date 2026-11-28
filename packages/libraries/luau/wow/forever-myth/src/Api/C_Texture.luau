--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAtlasInfo(atlas: textureAtlas): Maybe<AtlasInfo>
	return Maybe.of(C_Texture.GetAtlasInfo(atlas))
end

function Wrappers.GetAtlasInfoInto(reuse: Maybe<AtlasInfo>, atlas: textureAtlas): Maybe<AtlasInfo>
	return Reuse.maybe(reuse, C_Texture.GetAtlasInfo(atlas))
end

return Wrappers
