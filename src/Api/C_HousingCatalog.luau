--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCatalogCategoryAndSubcategoryNamesResults = {
	read categoryName: string,
	read subcategoryName: string,
}

export type GetDecorTotalOwnedCountResults = {
	read totalOwnedCount: number,
	read exemptDecorCount: number,
}

local Wrappers = {}

function Wrappers.GetBundleInfo(bundleCatalogShopProductID: number): Maybe<HousingBundleInfo>
	return Maybe.of(C_HousingCatalog.GetBundleInfo(bundleCatalogShopProductID))
end

function Wrappers.GetBundleInfoInto(
	reuse: Maybe<HousingBundleInfo>,
	bundleCatalogShopProductID: number
): Maybe<HousingBundleInfo>
	return Reuse.maybe(reuse, C_HousingCatalog.GetBundleInfo(bundleCatalogShopProductID))
end

function Wrappers.GetCatalogCategoryAndSubcategoryNames(
	subcategoryID: number
): Maybe<GetCatalogCategoryAndSubcategoryNamesResults>
	local r1, r2 = C_HousingCatalog.GetCatalogCategoryAndSubcategoryNames(subcategoryID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		categoryName = r1,
		subcategoryName = r2,
	})
end

function Wrappers.GetCatalogCategoryAndSubcategoryNamesInto(
	reuse: GetCatalogCategoryAndSubcategoryNamesResults,
	subcategoryID: number
): Maybe<GetCatalogCategoryAndSubcategoryNamesResults>
	local r1, r2 = C_HousingCatalog.GetCatalogCategoryAndSubcategoryNames(subcategoryID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.categoryName = r1
	fields.subcategoryName = r2
	return Reuse.just(reuse)
end

function Wrappers.GetCatalogCategoryInfo(categoryID: number): Maybe<HousingCatalogCategoryInfo>
	return Maybe.of(C_HousingCatalog.GetCatalogCategoryInfo(categoryID))
end

function Wrappers.GetCatalogCategoryInfoInto(
	reuse: Maybe<HousingCatalogCategoryInfo>,
	categoryID: number
): Maybe<HousingCatalogCategoryInfo>
	return Reuse.maybe(reuse, C_HousingCatalog.GetCatalogCategoryInfo(categoryID))
end

function Wrappers.GetCatalogEntryInfo(entryID: HousingCatalogEntryID): Maybe<HousingCatalogEntryInfo>
	return Maybe.of(C_HousingCatalog.GetCatalogEntryInfo(entryID))
end

function Wrappers.GetCatalogEntryInfoInto(
	reuse: Maybe<HousingCatalogEntryInfo>,
	entryID: HousingCatalogEntryID
): Maybe<HousingCatalogEntryInfo>
	return Reuse.maybe(reuse, C_HousingCatalog.GetCatalogEntryInfo(entryID))
end

function Wrappers.GetCatalogEntryInfoByItem(itemInfo: ItemInfo): Maybe<HousingCatalogEntryInfo>
	return Maybe.of(C_HousingCatalog.GetCatalogEntryInfoByItem(itemInfo))
end

function Wrappers.GetCatalogEntryInfoByItemInto(
	reuse: Maybe<HousingCatalogEntryInfo>,
	itemInfo: ItemInfo
): Maybe<HousingCatalogEntryInfo>
	return Reuse.maybe(reuse, C_HousingCatalog.GetCatalogEntryInfoByItem(itemInfo))
end

function Wrappers.GetCatalogEntryInfoByRecordID(
	entryType: Enum_HousingCatalogEntryType,
	recordID: number
): Maybe<HousingCatalogEntryInfo>
	return Maybe.of(C_HousingCatalog.GetCatalogEntryInfoByRecordID(entryType, recordID))
end

function Wrappers.GetCatalogEntryInfoByRecordIDInto(
	reuse: Maybe<HousingCatalogEntryInfo>,
	entryType: Enum_HousingCatalogEntryType,
	recordID: number
): Maybe<HousingCatalogEntryInfo>
	return Reuse.maybe(reuse, C_HousingCatalog.GetCatalogEntryInfoByRecordID(entryType, recordID))
end

function Wrappers.GetCatalogEntryRefundTimeStampByRecordID(
	entryType: Enum_HousingCatalogEntryType,
	recordID: number
): Maybe<time_t>
	return Maybe.of(C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID(entryType, recordID))
end

function Wrappers.GetCatalogEntryRefundTimeStampByRecordIDInto(
	reuse: Maybe<time_t>,
	entryType: Enum_HousingCatalogEntryType,
	recordID: number
): Maybe<time_t>
	return Reuse.maybe(reuse, C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID(entryType, recordID))
end

function Wrappers.GetCatalogEntryVariantInfo(
	entryVariantID: HousingCatalogEntryVariantID
): Maybe<HousingCatalogEntryVariantInfo>
	return Maybe.of(C_HousingCatalog.GetCatalogEntryVariantInfo(entryVariantID))
end

function Wrappers.GetCatalogEntryVariantInfoInto(
	reuse: Maybe<HousingCatalogEntryVariantInfo>,
	entryVariantID: HousingCatalogEntryVariantID
): Maybe<HousingCatalogEntryVariantInfo>
	return Reuse.maybe(reuse, C_HousingCatalog.GetCatalogEntryVariantInfo(entryVariantID))
end

function Wrappers.GetCatalogSubcategoryInfo(subcategoryID: number): Maybe<HousingCatalogSubcategoryInfo>
	return Maybe.of(C_HousingCatalog.GetCatalogSubcategoryInfo(subcategoryID))
end

function Wrappers.GetCatalogSubcategoryInfoInto(
	reuse: Maybe<HousingCatalogSubcategoryInfo>,
	subcategoryID: number
): Maybe<HousingCatalogSubcategoryInfo>
	return Reuse.maybe(reuse, C_HousingCatalog.GetCatalogSubcategoryInfo(subcategoryID))
end

function Wrappers.GetDecorTotalOwnedCount(): GetDecorTotalOwnedCountResults
	local r1, r2 = C_HousingCatalog.GetDecorTotalOwnedCount()
	return {
		totalOwnedCount = r1,
		exemptDecorCount = r2,
	}
end

function Wrappers.GetDecorTotalOwnedCountInto(reuse: GetDecorTotalOwnedCountResults): GetDecorTotalOwnedCountResults
	local r1, r2 = C_HousingCatalog.GetDecorTotalOwnedCount()
	local fields = Reuse.fields(reuse)
	fields.totalOwnedCount = r1
	fields.exemptDecorCount = r2
	return reuse
end

function Wrappers.GetMarketInfoForDecor(decorID: number): Maybe<HousingMarketInfo>
	return Maybe.of(C_HousingCatalog.GetMarketInfoForDecor(decorID))
end

function Wrappers.GetMarketInfoForDecorInto(reuse: Maybe<HousingMarketInfo>, decorID: number): Maybe<HousingMarketInfo>
	return Reuse.maybe(reuse, C_HousingCatalog.GetMarketInfoForDecor(decorID))
end

return Wrappers
