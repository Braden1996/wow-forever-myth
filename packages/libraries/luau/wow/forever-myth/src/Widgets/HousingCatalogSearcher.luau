--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetEditorModeContext(object: HousingCatalogSearcher): Maybe<Enum_HouseEditorMode>
	return Maybe.of(object:GetEditorModeContext())
end

function Wrappers.GetEditorModeContextInto(
	reuse: Maybe<Enum_HouseEditorMode>,
	object: HousingCatalogSearcher
): Maybe<Enum_HouseEditorMode>
	return Reuse.maybe(reuse, object:GetEditorModeContext())
end

function Wrappers.GetFilteredCategoryID(object: HousingCatalogSearcher): Maybe<number>
	return Maybe.of(object:GetFilteredCategoryID())
end

function Wrappers.GetFilteredCategoryIDInto(reuse: Maybe<number>, object: HousingCatalogSearcher): Maybe<number>
	return Reuse.maybe(reuse, object:GetFilteredCategoryID())
end

function Wrappers.GetFilteredSubcategoryID(object: HousingCatalogSearcher): Maybe<number>
	return Maybe.of(object:GetFilteredSubcategoryID())
end

function Wrappers.GetFilteredSubcategoryIDInto(reuse: Maybe<number>, object: HousingCatalogSearcher): Maybe<number>
	return Reuse.maybe(reuse, object:GetFilteredSubcategoryID())
end

function Wrappers.GetSearchText(object: HousingCatalogSearcher): Maybe<string>
	return Maybe.of(object:GetSearchText())
end

function Wrappers.GetSearchTextInto(reuse: Maybe<string>, object: HousingCatalogSearcher): Maybe<string>
	return Reuse.maybe(reuse, object:GetSearchText())
end

return Wrappers
