--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCollectionDataByID(collectionID: number): Maybe<ConsoleScriptCollectionData>
	return Maybe.of(C_ConsoleScriptCollection.GetCollectionDataByID(collectionID))
end

function Wrappers.GetCollectionDataByIDInto(
	reuse: Maybe<ConsoleScriptCollectionData>,
	collectionID: number
): Maybe<ConsoleScriptCollectionData>
	return Reuse.maybe(reuse, C_ConsoleScriptCollection.GetCollectionDataByID(collectionID))
end

function Wrappers.GetCollectionDataByTag(collectionTag: string): Maybe<ConsoleScriptCollectionData>
	return Maybe.of(C_ConsoleScriptCollection.GetCollectionDataByTag(collectionTag))
end

function Wrappers.GetCollectionDataByTagInto(
	reuse: Maybe<ConsoleScriptCollectionData>,
	collectionTag: string
): Maybe<ConsoleScriptCollectionData>
	return Reuse.maybe(reuse, C_ConsoleScriptCollection.GetCollectionDataByTag(collectionTag))
end

return Wrappers
