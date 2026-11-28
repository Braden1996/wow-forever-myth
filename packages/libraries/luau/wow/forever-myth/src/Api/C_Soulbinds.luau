--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type CanActivateSoulbindResults = {
	read result: boolean,
	read errorDescription: Maybe<string>,
}

export type CanResetConduitsInSoulbindResults = {
	read result: boolean,
	read errorDescription: Maybe<string>,
}

local Wrappers = {}

function Wrappers.CanActivateSoulbind(soulbindID: number): CanActivateSoulbindResults
	local r1, r2 = C_Soulbinds.CanActivateSoulbind(soulbindID)
	return {
		result = r1,
		errorDescription = Maybe.of(r2),
	}
end

function Wrappers.CanActivateSoulbindInto(
	reuse: CanActivateSoulbindResults,
	soulbindID: number
): CanActivateSoulbindResults
	local r1, r2 = C_Soulbinds.CanActivateSoulbind(soulbindID)
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.errorDescription = Reuse.maybe(fields.errorDescription, r2)
	return reuse
end

function Wrappers.CanResetConduitsInSoulbind(soulbindID: number): CanResetConduitsInSoulbindResults
	local r1, r2 = C_Soulbinds.CanResetConduitsInSoulbind(soulbindID)
	return {
		result = r1,
		errorDescription = Maybe.of(r2),
	}
end

function Wrappers.CanResetConduitsInSoulbindInto(
	reuse: CanResetConduitsInSoulbindResults,
	soulbindID: number
): CanResetConduitsInSoulbindResults
	local r1, r2 = C_Soulbinds.CanResetConduitsInSoulbind(soulbindID)
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.errorDescription = Reuse.maybe(fields.errorDescription, r2)
	return reuse
end

function Wrappers.GetConduitCollectionData(conduitID: number): Maybe<ConduitCollectionData>
	return Maybe.of(C_Soulbinds.GetConduitCollectionData(conduitID))
end

function Wrappers.GetConduitCollectionDataInto(
	reuse: Maybe<ConduitCollectionData>,
	conduitID: number
): Maybe<ConduitCollectionData>
	return Reuse.maybe(reuse, C_Soulbinds.GetConduitCollectionData(conduitID))
end

function Wrappers.GetConduitCollectionDataAtCursor(): Maybe<ConduitCollectionData>
	return Maybe.of(C_Soulbinds.GetConduitCollectionDataAtCursor())
end

function Wrappers.GetConduitCollectionDataAtCursorInto(
	reuse: Maybe<ConduitCollectionData>
): Maybe<ConduitCollectionData>
	return Reuse.maybe(reuse, C_Soulbinds.GetConduitCollectionDataAtCursor())
end

function Wrappers.GetConduitCollectionDataByVirtualID(virtualID: number): Maybe<ConduitCollectionData>
	return Maybe.of(C_Soulbinds.GetConduitCollectionDataByVirtualID(virtualID))
end

function Wrappers.GetConduitCollectionDataByVirtualIDInto(
	reuse: Maybe<ConduitCollectionData>,
	virtualID: number
): Maybe<ConduitCollectionData>
	return Reuse.maybe(reuse, C_Soulbinds.GetConduitCollectionDataByVirtualID(virtualID))
end

return Wrappers
