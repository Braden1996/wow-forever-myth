--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetReplicateItemBattlePetInfoResults = {
	read creatureID: number,
	read displayID: number,
}

export type GetReplicateItemInfoResults = {
	read name: Maybe<string>,
	read texture: Maybe<fileID>,
	read count: number,
	read qualityID: number,
	read usable: Maybe<boolean>,
	read level: number,
	read levelType: Maybe<string>,
	read minBid: BigUInteger,
	read minIncrement: BigUInteger,
	read buyoutPrice: BigUInteger,
	read bidAmount: BigUInteger,
	read highBidder: Maybe<string>,
	read bidderFullName: Maybe<string>,
	read owner: Maybe<string>,
	read ownerFullName: Maybe<string>,
	read saleStatus: number,
	read itemID: number,
	read hasAllInfo: Maybe<boolean>,
}

export type GetTimeLeftBandInfoResults = {
	read timeLeftMinSeconds: number,
	read timeLeftMaxSeconds: number,
}

local Wrappers = {}

function Wrappers.CalculateCommodityDeposit(itemID: number, duration: number, quantity: number): Maybe<number>
	return Maybe.of(C_AuctionHouse.CalculateCommodityDeposit(itemID, duration, quantity))
end

function Wrappers.CalculateCommodityDepositInto(
	reuse: Maybe<number>,
	itemID: number,
	duration: number,
	quantity: number
): Maybe<number>
	return Reuse.maybe(reuse, C_AuctionHouse.CalculateCommodityDeposit(itemID, duration, quantity))
end

function Wrappers.CalculateItemDeposit(item: ItemLocationMixin, duration: number, quantity: number): Maybe<number>
	return Maybe.of(C_AuctionHouse.CalculateItemDeposit(item, duration, quantity))
end

function Wrappers.CalculateItemDepositInto(
	reuse: Maybe<number>,
	item: ItemLocationMixin,
	duration: number,
	quantity: number
): Maybe<number>
	return Reuse.maybe(reuse, C_AuctionHouse.CalculateItemDeposit(item, duration, quantity))
end

function Wrappers.GetAuctionInfoByID(auctionID: number): Maybe<AuctionInfo>
	return Maybe.of(C_AuctionHouse.GetAuctionInfoByID(auctionID))
end

function Wrappers.GetAuctionInfoByIDInto(reuse: Maybe<AuctionInfo>, auctionID: number): Maybe<AuctionInfo>
	return Reuse.maybe(reuse, C_AuctionHouse.GetAuctionInfoByID(auctionID))
end

function Wrappers.GetBidInfo(bidIndex: number): Maybe<BidInfo>
	return Maybe.of(C_AuctionHouse.GetBidInfo(bidIndex))
end

function Wrappers.GetBidInfoInto(reuse: Maybe<BidInfo>, bidIndex: number): Maybe<BidInfo>
	return Reuse.maybe(reuse, C_AuctionHouse.GetBidInfo(bidIndex))
end

function Wrappers.GetBidType(bidTypeIndex: number): Maybe<ItemKey>
	return Maybe.of(C_AuctionHouse.GetBidType(bidTypeIndex))
end

function Wrappers.GetBidTypeInto(reuse: Maybe<ItemKey>, bidTypeIndex: number): Maybe<ItemKey>
	return Reuse.maybe(reuse, C_AuctionHouse.GetBidType(bidTypeIndex))
end

function Wrappers.GetCommoditySearchResultInfo(
	itemID: number,
	commoditySearchResultIndex: number
): Maybe<CommoditySearchResultInfo>
	return Maybe.of(C_AuctionHouse.GetCommoditySearchResultInfo(itemID, commoditySearchResultIndex))
end

function Wrappers.GetCommoditySearchResultInfoInto(
	reuse: Maybe<CommoditySearchResultInfo>,
	itemID: number,
	commoditySearchResultIndex: number
): Maybe<CommoditySearchResultInfo>
	return Reuse.maybe(reuse, C_AuctionHouse.GetCommoditySearchResultInfo(itemID, commoditySearchResultIndex))
end

function Wrappers.GetExtraBrowseInfo(itemKey: ItemKey): Maybe<number>
	return Maybe.of(C_AuctionHouse.GetExtraBrowseInfo(itemKey))
end

function Wrappers.GetExtraBrowseInfoInto(reuse: Maybe<number>, itemKey: ItemKey): Maybe<number>
	return Reuse.maybe(reuse, C_AuctionHouse.GetExtraBrowseInfo(itemKey))
end

function Wrappers.GetItemKeyInfo(itemKey: ItemKey, restrictQualityToFilter: boolean?): Maybe<ItemKeyInfo>
	return Maybe.of(C_AuctionHouse.GetItemKeyInfo(itemKey, restrictQualityToFilter))
end

function Wrappers.GetItemKeyInfoInto(
	reuse: Maybe<ItemKeyInfo>,
	itemKey: ItemKey,
	restrictQualityToFilter: boolean?
): Maybe<ItemKeyInfo>
	return Reuse.maybe(reuse, C_AuctionHouse.GetItemKeyInfo(itemKey, restrictQualityToFilter))
end

function Wrappers.GetItemKeyRequiredLevel(itemKey: ItemKey): Maybe<number>
	return Maybe.of(C_AuctionHouse.GetItemKeyRequiredLevel(itemKey))
end

function Wrappers.GetItemKeyRequiredLevelInto(reuse: Maybe<number>, itemKey: ItemKey): Maybe<number>
	return Reuse.maybe(reuse, C_AuctionHouse.GetItemKeyRequiredLevel(itemKey))
end

function Wrappers.GetItemKeySampleLink(itemKey: ItemKey): Maybe<string>
	return Maybe.of(C_AuctionHouse.GetItemKeySampleLink(itemKey))
end

function Wrappers.GetItemKeySampleLinkInto(reuse: Maybe<string>, itemKey: ItemKey): Maybe<string>
	return Reuse.maybe(reuse, C_AuctionHouse.GetItemKeySampleLink(itemKey))
end

function Wrappers.GetItemSearchResultInfo(itemKey: ItemKey, itemSearchResultIndex: number): Maybe<ItemSearchResultInfo>
	return Maybe.of(C_AuctionHouse.GetItemSearchResultInfo(itemKey, itemSearchResultIndex))
end

function Wrappers.GetItemSearchResultInfoInto(
	reuse: Maybe<ItemSearchResultInfo>,
	itemKey: ItemKey,
	itemSearchResultIndex: number
): Maybe<ItemSearchResultInfo>
	return Reuse.maybe(reuse, C_AuctionHouse.GetItemSearchResultInfo(itemKey, itemSearchResultIndex))
end

function Wrappers.GetMaxBidItemBid(): Maybe<BigUInteger>
	return Maybe.of(C_AuctionHouse.GetMaxBidItemBid())
end

function Wrappers.GetMaxBidItemBidInto(reuse: Maybe<BigUInteger>): Maybe<BigUInteger>
	return Reuse.maybe(reuse, C_AuctionHouse.GetMaxBidItemBid())
end

function Wrappers.GetMaxBidItemBuyout(): Maybe<BigUInteger>
	return Maybe.of(C_AuctionHouse.GetMaxBidItemBuyout())
end

function Wrappers.GetMaxBidItemBuyoutInto(reuse: Maybe<BigUInteger>): Maybe<BigUInteger>
	return Reuse.maybe(reuse, C_AuctionHouse.GetMaxBidItemBuyout())
end

function Wrappers.GetMaxCommoditySearchResultPrice(itemID: number): Maybe<BigUInteger>
	return Maybe.of(C_AuctionHouse.GetMaxCommoditySearchResultPrice(itemID))
end

function Wrappers.GetMaxCommoditySearchResultPriceInto(reuse: Maybe<BigUInteger>, itemID: number): Maybe<BigUInteger>
	return Reuse.maybe(reuse, C_AuctionHouse.GetMaxCommoditySearchResultPrice(itemID))
end

function Wrappers.GetMaxItemSearchResultBid(itemKey: ItemKey): Maybe<BigUInteger>
	return Maybe.of(C_AuctionHouse.GetMaxItemSearchResultBid(itemKey))
end

function Wrappers.GetMaxItemSearchResultBidInto(reuse: Maybe<BigUInteger>, itemKey: ItemKey): Maybe<BigUInteger>
	return Reuse.maybe(reuse, C_AuctionHouse.GetMaxItemSearchResultBid(itemKey))
end

function Wrappers.GetMaxItemSearchResultBuyout(itemKey: ItemKey): Maybe<BigUInteger>
	return Maybe.of(C_AuctionHouse.GetMaxItemSearchResultBuyout(itemKey))
end

function Wrappers.GetMaxItemSearchResultBuyoutInto(reuse: Maybe<BigUInteger>, itemKey: ItemKey): Maybe<BigUInteger>
	return Reuse.maybe(reuse, C_AuctionHouse.GetMaxItemSearchResultBuyout(itemKey))
end

function Wrappers.GetMaxOwnedAuctionBid(): Maybe<BigUInteger>
	return Maybe.of(C_AuctionHouse.GetMaxOwnedAuctionBid())
end

function Wrappers.GetMaxOwnedAuctionBidInto(reuse: Maybe<BigUInteger>): Maybe<BigUInteger>
	return Reuse.maybe(reuse, C_AuctionHouse.GetMaxOwnedAuctionBid())
end

function Wrappers.GetMaxOwnedAuctionBuyout(): Maybe<BigUInteger>
	return Maybe.of(C_AuctionHouse.GetMaxOwnedAuctionBuyout())
end

function Wrappers.GetMaxOwnedAuctionBuyoutInto(reuse: Maybe<BigUInteger>): Maybe<BigUInteger>
	return Reuse.maybe(reuse, C_AuctionHouse.GetMaxOwnedAuctionBuyout())
end

function Wrappers.GetOwnedAuctionInfo(ownedAuctionIndex: number): Maybe<OwnedAuctionInfo>
	return Maybe.of(C_AuctionHouse.GetOwnedAuctionInfo(ownedAuctionIndex))
end

function Wrappers.GetOwnedAuctionInfoInto(
	reuse: Maybe<OwnedAuctionInfo>,
	ownedAuctionIndex: number
): Maybe<OwnedAuctionInfo>
	return Reuse.maybe(reuse, C_AuctionHouse.GetOwnedAuctionInfo(ownedAuctionIndex))
end

function Wrappers.GetOwnedAuctionType(ownedAuctionTypeIndex: number): Maybe<ItemKey>
	return Maybe.of(C_AuctionHouse.GetOwnedAuctionType(ownedAuctionTypeIndex))
end

function Wrappers.GetOwnedAuctionTypeInto(reuse: Maybe<ItemKey>, ownedAuctionTypeIndex: number): Maybe<ItemKey>
	return Reuse.maybe(reuse, C_AuctionHouse.GetOwnedAuctionType(ownedAuctionTypeIndex))
end

function Wrappers.GetReplicateItemBattlePetInfo(index: number): Maybe<GetReplicateItemBattlePetInfoResults>
	local r1, r2 = C_AuctionHouse.GetReplicateItemBattlePetInfo(index)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		creatureID = r1,
		displayID = r2,
	})
end

function Wrappers.GetReplicateItemBattlePetInfoInto(
	reuse: GetReplicateItemBattlePetInfoResults,
	index: number
): Maybe<GetReplicateItemBattlePetInfoResults>
	local r1, r2 = C_AuctionHouse.GetReplicateItemBattlePetInfo(index)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.creatureID = r1
	fields.displayID = r2
	return Reuse.just(reuse)
end

function Wrappers.GetReplicateItemInfo(index: number): GetReplicateItemInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 =
		C_AuctionHouse.GetReplicateItemInfo(index)
	return {
		name = Maybe.of(r1),
		texture = Maybe.of(r2),
		count = r3,
		qualityID = r4,
		usable = Maybe.of(r5),
		level = r6,
		levelType = Maybe.of(r7),
		minBid = r8,
		minIncrement = r9,
		buyoutPrice = r10,
		bidAmount = r11,
		highBidder = Maybe.of(r12),
		bidderFullName = Maybe.of(r13),
		owner = Maybe.of(r14),
		ownerFullName = Maybe.of(r15),
		saleStatus = r16,
		itemID = r17,
		hasAllInfo = Maybe.of(r18),
	}
end

function Wrappers.GetReplicateItemInfoInto(
	reuse: GetReplicateItemInfoResults,
	index: number
): GetReplicateItemInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 =
		C_AuctionHouse.GetReplicateItemInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = Reuse.maybe(fields.name, r1)
	fields.texture = Reuse.maybe(fields.texture, r2)
	fields.count = r3
	fields.qualityID = r4
	fields.usable = Reuse.maybe(fields.usable, r5)
	fields.level = r6
	fields.levelType = Reuse.maybe(fields.levelType, r7)
	fields.minBid = r8
	fields.minIncrement = r9
	fields.buyoutPrice = r10
	fields.bidAmount = r11
	fields.highBidder = Reuse.maybe(fields.highBidder, r12)
	fields.bidderFullName = Reuse.maybe(fields.bidderFullName, r13)
	fields.owner = Reuse.maybe(fields.owner, r14)
	fields.ownerFullName = Reuse.maybe(fields.ownerFullName, r15)
	fields.saleStatus = r16
	fields.itemID = r17
	fields.hasAllInfo = Reuse.maybe(fields.hasAllInfo, r18)
	return reuse
end

function Wrappers.GetReplicateItemLink(index: number): Maybe<string>
	return Maybe.of(C_AuctionHouse.GetReplicateItemLink(index))
end

function Wrappers.GetReplicateItemLinkInto(reuse: Maybe<string>, index: number): Maybe<string>
	return Reuse.maybe(reuse, C_AuctionHouse.GetReplicateItemLink(index))
end

function Wrappers.GetTimeLeftBandInfo(timeLeftBand: Enum_AuctionHouseTimeLeftBand): GetTimeLeftBandInfoResults
	local r1, r2 = C_AuctionHouse.GetTimeLeftBandInfo(timeLeftBand)
	return {
		timeLeftMinSeconds = r1,
		timeLeftMaxSeconds = r2,
	}
end

function Wrappers.GetTimeLeftBandInfoInto(
	reuse: GetTimeLeftBandInfoResults,
	timeLeftBand: Enum_AuctionHouseTimeLeftBand
): GetTimeLeftBandInfoResults
	local r1, r2 = C_AuctionHouse.GetTimeLeftBandInfo(timeLeftBand)
	local fields = Reuse.fields(reuse)
	fields.timeLeftMinSeconds = r1
	fields.timeLeftMaxSeconds = r2
	return reuse
end

function Wrappers.PostCommodity(
	item: ItemLocationMixin,
	duration: number,
	quantity: number,
	unitPrice: BigUInteger
): Maybe<boolean>
	return Maybe.of(C_AuctionHouse.PostCommodity(item, duration, quantity, unitPrice))
end

function Wrappers.PostCommodityInto(
	reuse: Maybe<boolean>,
	item: ItemLocationMixin,
	duration: number,
	quantity: number,
	unitPrice: BigUInteger
): Maybe<boolean>
	return Reuse.maybe(reuse, C_AuctionHouse.PostCommodity(item, duration, quantity, unitPrice))
end

function Wrappers.PostItem(
	item: ItemLocationMixin,
	duration: number,
	quantity: number,
	bid: BigUInteger?,
	buyout: BigUInteger?
): Maybe<boolean>
	return Maybe.of(C_AuctionHouse.PostItem(item, duration, quantity, bid, buyout))
end

function Wrappers.PostItemInto(
	reuse: Maybe<boolean>,
	item: ItemLocationMixin,
	duration: number,
	quantity: number,
	bid: BigUInteger?,
	buyout: BigUInteger?
): Maybe<boolean>
	return Reuse.maybe(reuse, C_AuctionHouse.PostItem(item, duration, quantity, bid, buyout))
end

return Wrappers
