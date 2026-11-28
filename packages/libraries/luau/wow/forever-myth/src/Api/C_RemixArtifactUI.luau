--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetAppearanceInfoByIDResults = {
	read uiCameraID: number,
	read altHandUICameraID: Maybe<number>,
}

export type GetArtifactItemInfoResults = {
	read itemID: number,
	read altItemID: Maybe<number>,
	read artifactAppearanceID: number,
	read appearanceModID: number,
	read itemAppearanceID: Maybe<number>,
	read altItemAppearanceID: Maybe<number>,
	read altOnTop: boolean,
}

local Wrappers = {}

function Wrappers.GetAppearanceInfoByID(artifactAppearanceID: number): Maybe<GetAppearanceInfoByIDResults>
	local r1, r2 = C_RemixArtifactUI.GetAppearanceInfoByID(artifactAppearanceID)
	if r1 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		uiCameraID = r1,
		altHandUICameraID = Maybe.of(r2),
	})
end

function Wrappers.GetAppearanceInfoByIDInto(
	reuse: GetAppearanceInfoByIDResults,
	artifactAppearanceID: number
): Maybe<GetAppearanceInfoByIDResults>
	local r1, r2 = C_RemixArtifactUI.GetAppearanceInfoByID(artifactAppearanceID)
	if r1 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.uiCameraID = r1
	fields.altHandUICameraID = Reuse.maybe(fields.altHandUICameraID, r2)
	return Reuse.just(reuse)
end

function Wrappers.GetArtifactArtInfo(): Maybe<RemixArtifactArtInfo>
	return Maybe.of(C_RemixArtifactUI.GetArtifactArtInfo())
end

function Wrappers.GetArtifactArtInfoInto(reuse: Maybe<RemixArtifactArtInfo>): Maybe<RemixArtifactArtInfo>
	return Reuse.maybe(reuse, C_RemixArtifactUI.GetArtifactArtInfo())
end

function Wrappers.GetArtifactItemInfo(): Maybe<GetArtifactItemInfoResults>
	local r1, r2, r3, r4, r5, r6, r7 = C_RemixArtifactUI.GetArtifactItemInfo()
	if r1 == nil or r3 == nil or r4 == nil or r7 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemID = r1,
		altItemID = Maybe.of(r2),
		artifactAppearanceID = r3,
		appearanceModID = r4,
		itemAppearanceID = Maybe.of(r5),
		altItemAppearanceID = Maybe.of(r6),
		altOnTop = r7,
	})
end

function Wrappers.GetArtifactItemInfoInto(reuse: GetArtifactItemInfoResults): Maybe<GetArtifactItemInfoResults>
	local r1, r2, r3, r4, r5, r6, r7 = C_RemixArtifactUI.GetArtifactItemInfo()
	if r1 == nil or r3 == nil or r4 == nil or r7 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemID = r1
	fields.altItemID = Reuse.maybe(fields.altItemID, r2)
	fields.artifactAppearanceID = r3
	fields.appearanceModID = r4
	fields.itemAppearanceID = Reuse.maybe(fields.itemAppearanceID, r5)
	fields.altItemAppearanceID = Reuse.maybe(fields.altItemAppearanceID, r6)
	fields.altOnTop = r7
	return Reuse.just(reuse)
end

function Wrappers.GetCurrArtifactItemID(): Maybe<number>
	return Maybe.of(C_RemixArtifactUI.GetCurrArtifactItemID())
end

function Wrappers.GetCurrArtifactItemIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_RemixArtifactUI.GetCurrArtifactItemID())
end

function Wrappers.GetCurrItemSpecIndex(): Maybe<number>
	return Maybe.of(C_RemixArtifactUI.GetCurrItemSpecIndex())
end

function Wrappers.GetCurrItemSpecIndexInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_RemixArtifactUI.GetCurrItemSpecIndex())
end

function Wrappers.GetCurrTraitTreeID(): Maybe<number>
	return Maybe.of(C_RemixArtifactUI.GetCurrTraitTreeID())
end

function Wrappers.GetCurrTraitTreeIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_RemixArtifactUI.GetCurrTraitTreeID())
end

return Wrappers
