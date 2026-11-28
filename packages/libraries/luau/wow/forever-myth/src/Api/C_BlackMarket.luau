--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetHotItemResults = {
	read name: string,
	read texture: string,
	read quantity: number,
	read itemType: string,
	read usable: boolean,
	read level: number,
	read levelType: string,
	read sellerName: string,
	read minBid: number,
	read minIncrement: number,
	read currBid: number,
	read youHaveHighBid: boolean,
	read numBids: number,
	read timeLeft: number,
	read link: string,
	read marketID: number,
	read quality: Enum_ItemQuality,
}

export type GetItemInfoByIDResults = {
	read name: string,
	read texture: string,
	read quantity: number,
	read itemType: string,
	read usable: boolean,
	read level: number,
	read levelType: string,
	read sellerName: string,
	read minBid: number,
	read minIncrement: number,
	read currBid: number,
	read youHaveHighBid: boolean,
	read numBids: number,
	read timeLeft: number,
	read link: string,
	read marketID: number,
	read quality: Enum_ItemQuality,
}

export type GetItemInfoByIndexResults = {
	read name: string,
	read texture: string,
	read quantity: number,
	read itemType: string,
	read usable: boolean,
	read level: number,
	read levelType: string,
	read sellerName: string,
	read minBid: number,
	read minIncrement: number,
	read currBid: number,
	read youHaveHighBid: boolean,
	read numBids: number,
	read timeLeft: number,
	read link: string,
	read marketID: number,
	read quality: Enum_ItemQuality,
}

local Wrappers = {}

function Wrappers.GetHotItem(): GetHotItemResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 = C_BlackMarket.GetHotItem()
	return {
		name = r1,
		texture = r2,
		quantity = r3,
		itemType = r4,
		usable = r5,
		level = r6,
		levelType = r7,
		sellerName = r8,
		minBid = r9,
		minIncrement = r10,
		currBid = r11,
		youHaveHighBid = r12,
		numBids = r13,
		timeLeft = r14,
		link = r15,
		marketID = r16,
		quality = r17,
	}
end

function Wrappers.GetHotItemInto(reuse: GetHotItemResults): GetHotItemResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 = C_BlackMarket.GetHotItem()
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.quantity = r3
	fields.itemType = r4
	fields.usable = r5
	fields.level = r6
	fields.levelType = r7
	fields.sellerName = r8
	fields.minBid = r9
	fields.minIncrement = r10
	fields.currBid = r11
	fields.youHaveHighBid = r12
	fields.numBids = r13
	fields.timeLeft = r14
	fields.link = r15
	fields.marketID = r16
	fields.quality = r17
	return reuse
end

function Wrappers.GetItemInfoByID(marketID: number): GetItemInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 =
		C_BlackMarket.GetItemInfoByID(marketID)
	return {
		name = r1,
		texture = r2,
		quantity = r3,
		itemType = r4,
		usable = r5,
		level = r6,
		levelType = r7,
		sellerName = r8,
		minBid = r9,
		minIncrement = r10,
		currBid = r11,
		youHaveHighBid = r12,
		numBids = r13,
		timeLeft = r14,
		link = r15,
		marketID = r16,
		quality = r17,
	}
end

function Wrappers.GetItemInfoByIDInto(reuse: GetItemInfoByIDResults, marketID: number): GetItemInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 =
		C_BlackMarket.GetItemInfoByID(marketID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.quantity = r3
	fields.itemType = r4
	fields.usable = r5
	fields.level = r6
	fields.levelType = r7
	fields.sellerName = r8
	fields.minBid = r9
	fields.minIncrement = r10
	fields.currBid = r11
	fields.youHaveHighBid = r12
	fields.numBids = r13
	fields.timeLeft = r14
	fields.link = r15
	fields.marketID = r16
	fields.quality = r17
	return reuse
end

function Wrappers.GetItemInfoByIndex(index: number): GetItemInfoByIndexResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 =
		C_BlackMarket.GetItemInfoByIndex(index)
	return {
		name = r1,
		texture = r2,
		quantity = r3,
		itemType = r4,
		usable = r5,
		level = r6,
		levelType = r7,
		sellerName = r8,
		minBid = r9,
		minIncrement = r10,
		currBid = r11,
		youHaveHighBid = r12,
		numBids = r13,
		timeLeft = r14,
		link = r15,
		marketID = r16,
		quality = r17,
	}
end

function Wrappers.GetItemInfoByIndexInto(reuse: GetItemInfoByIndexResults, index: number): GetItemInfoByIndexResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 =
		C_BlackMarket.GetItemInfoByIndex(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.quantity = r3
	fields.itemType = r4
	fields.usable = r5
	fields.level = r6
	fields.levelType = r7
	fields.sellerName = r8
	fields.minBid = r9
	fields.minIncrement = r10
	fields.currBid = r11
	fields.youHaveHighBid = r12
	fields.numBids = r13
	fields.timeLeft = r14
	fields.link = r15
	fields.marketID = r16
	fields.quality = r17
	return reuse
end

return Wrappers
