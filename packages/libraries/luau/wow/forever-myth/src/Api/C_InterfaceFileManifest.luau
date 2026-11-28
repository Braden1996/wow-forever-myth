--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetInterfaceArtFiles(): Maybe<{ string }>
	return Maybe.of(C_InterfaceFileManifest.GetInterfaceArtFiles())
end

function Wrappers.GetInterfaceArtFilesInto(reuse: Maybe<{ string }>): Maybe<{ string }>
	return Reuse.maybe(reuse, C_InterfaceFileManifest.GetInterfaceArtFiles())
end

return Wrappers
