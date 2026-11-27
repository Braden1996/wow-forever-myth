--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetFailureInfoResults = {
	read errorResultEnum: Maybe<StoreError>,
	read errorResultRaw: Maybe<number>,
}

export type GetRefundableDecorsResults = {
	read refundableDecorInfos: { RefundableDecorInfo },
	read minTimeRemainingSeconds: time_t,
}

local Wrappers = {}

function Wrappers.BulkPurchaseProducts(productIDs: { number }): Maybe<boolean>
	return Maybe.of(C_CatalogShop.BulkPurchaseProducts(productIDs))
end

function Wrappers.BulkPurchaseProductsInto(reuse: Maybe<boolean>, productIDs: { number }): Maybe<boolean>
	return Reuse.maybe(reuse, C_CatalogShop.BulkPurchaseProducts(productIDs))
end

function Wrappers.FindBestCurrencyProductForNeededAmount(vcCurrencyCode: string, amountNeeded: number): Maybe<number>
	return Maybe.of(C_CatalogShop.FindBestCurrencyProductForNeededAmount(vcCurrencyCode, amountNeeded))
end

function Wrappers.FindBestCurrencyProductForNeededAmountInto(
	reuse: Maybe<number>,
	vcCurrencyCode: string,
	amountNeeded: number
): Maybe<number>
	return Reuse.maybe(reuse, C_CatalogShop.FindBestCurrencyProductForNeededAmount(vcCurrencyCode, amountNeeded))
end

function Wrappers.GetFailureInfo(): GetFailureInfoResults
	local r1, r2 = C_CatalogShop.GetFailureInfo()
	return {
		errorResultEnum = Maybe.of(r1),
		errorResultRaw = Maybe.of(r2),
	}
end

function Wrappers.GetFailureInfoInto(reuse: GetFailureInfoResults): GetFailureInfoResults
	local r1, r2 = C_CatalogShop.GetFailureInfo()
	local fields = Reuse.fields(reuse)
	fields.errorResultEnum = Reuse.maybe(fields.errorResultEnum, r1)
	fields.errorResultRaw = Reuse.maybe(fields.errorResultRaw, r2)
	return reuse
end

function Wrappers.GetFirstCategoryByProductID(productID: number): Maybe<CatalogShopCategoryInfo>
	return Maybe.of(C_CatalogShop.GetFirstCategoryByProductID(productID))
end

function Wrappers.GetFirstCategoryByProductIDInto(
	reuse: Maybe<CatalogShopCategoryInfo>,
	productID: number
): Maybe<CatalogShopCategoryInfo>
	return Reuse.maybe(reuse, C_CatalogShop.GetFirstCategoryByProductID(productID))
end

function Wrappers.GetProductAvailabilityTimeRemainingSecs(catalogShopProductID: number): Maybe<number>
	return Maybe.of(C_CatalogShop.GetProductAvailabilityTimeRemainingSecs(catalogShopProductID))
end

function Wrappers.GetProductAvailabilityTimeRemainingSecsInto(
	reuse: Maybe<number>,
	catalogShopProductID: number
): Maybe<number>
	return Reuse.maybe(reuse, C_CatalogShop.GetProductAvailabilityTimeRemainingSecs(catalogShopProductID))
end

function Wrappers.GetProductInfo(productID: number): Maybe<CatalogShopProductInfo>
	return Maybe.of(C_CatalogShop.GetProductInfo(productID))
end

function Wrappers.GetProductInfoInto(
	reuse: Maybe<CatalogShopProductInfo>,
	productID: number
): Maybe<CatalogShopProductInfo>
	return Reuse.maybe(reuse, C_CatalogShop.GetProductInfo(productID))
end

function Wrappers.GetProductSortOrder(categoryID: number, sectionID: number, productID: number): Maybe<number>
	return Maybe.of(C_CatalogShop.GetProductSortOrder(categoryID, sectionID, productID))
end

function Wrappers.GetProductSortOrderInto(
	reuse: Maybe<number>,
	categoryID: number,
	sectionID: number,
	productID: number
): Maybe<number>
	return Reuse.maybe(reuse, C_CatalogShop.GetProductSortOrder(categoryID, sectionID, productID))
end

function Wrappers.GetRefundableDecors(productIdFilterOpt: number?): GetRefundableDecorsResults
	local r1, r2 = C_CatalogShop.GetRefundableDecors(productIdFilterOpt)
	return {
		refundableDecorInfos = r1,
		minTimeRemainingSeconds = r2,
	}
end

function Wrappers.GetRefundableDecorsInto(
	reuse: GetRefundableDecorsResults,
	productIdFilterOpt: number?
): GetRefundableDecorsResults
	local r1, r2 = C_CatalogShop.GetRefundableDecors(productIdFilterOpt)
	local fields = Reuse.fields(reuse)
	fields.refundableDecorInfos = r1
	fields.minTimeRemainingSeconds = r2
	return reuse
end

function Wrappers.GetVirtualCurrencyBalance(currencyCode: string): Maybe<string>
	return Maybe.of(C_CatalogShop.GetVirtualCurrencyBalance(currencyCode))
end

function Wrappers.GetVirtualCurrencyBalanceInto(reuse: Maybe<string>, currencyCode: string): Maybe<string>
	return Reuse.maybe(reuse, C_CatalogShop.GetVirtualCurrencyBalance(currencyCode))
end

function Wrappers.IsShop2Enabled(): Maybe<boolean>
	return Maybe.of(C_CatalogShop.IsShop2Enabled())
end

function Wrappers.IsShop2EnabledInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_CatalogShop.IsShop2Enabled())
end

function Wrappers.PurchaseProduct(productID: number): Maybe<boolean>
	return Maybe.of(C_CatalogShop.PurchaseProduct(productID))
end

function Wrappers.PurchaseProductInto(reuse: Maybe<boolean>, productID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_CatalogShop.PurchaseProduct(productID))
end

return Wrappers
