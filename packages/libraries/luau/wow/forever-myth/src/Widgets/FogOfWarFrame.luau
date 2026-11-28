--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetFogOfWarBackgroundTexture(object: FogOfWarFrame): Maybe<FileAsset>
	return Maybe.of(object:GetFogOfWarBackgroundTexture())
end

function Wrappers.GetFogOfWarBackgroundTextureInto(reuse: Maybe<FileAsset>, object: FogOfWarFrame): Maybe<FileAsset>
	return Reuse.maybe(reuse, object:GetFogOfWarBackgroundTexture())
end

function Wrappers.GetFogOfWarMaskTexture(object: FogOfWarFrame): Maybe<FileAsset>
	return Maybe.of(object:GetFogOfWarMaskTexture())
end

function Wrappers.GetFogOfWarMaskTextureInto(reuse: Maybe<FileAsset>, object: FogOfWarFrame): Maybe<FileAsset>
	return Reuse.maybe(reuse, object:GetFogOfWarMaskTexture())
end

return Wrappers
