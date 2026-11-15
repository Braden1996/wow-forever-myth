--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetFileID(asset: FileAsset): Maybe<fileID>
	return Maybe.of(C_UIFileAsset.GetFileID(asset))
end

function Wrappers.GetFileIDInto(reuse: Maybe<fileID>, asset: FileAsset): Maybe<fileID>
	return Reuse.maybe(reuse, C_UIFileAsset.GetFileID(asset))
end

return Wrappers
