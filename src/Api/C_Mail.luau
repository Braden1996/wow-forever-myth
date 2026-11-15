--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type CanCheckInboxResults = {
	read canCheckInbox: boolean,
	read secondsUntilAllowed: number,
}

local Wrappers = {}

function Wrappers.CanCheckInbox(): CanCheckInboxResults
	local r1, r2 = C_Mail.CanCheckInbox()
	return {
		canCheckInbox = r1,
		secondsUntilAllowed = r2,
	}
end

function Wrappers.CanCheckInboxInto(reuse: CanCheckInboxResults): CanCheckInboxResults
	local r1, r2 = C_Mail.CanCheckInbox()
	local fields = Reuse.fields(reuse)
	fields.canCheckInbox = r1
	fields.secondsUntilAllowed = r2
	return reuse
end

function Wrappers.GetCraftingOrderMailInfo(inboxIndex: number): Maybe<CraftingOrderMailInfo>
	return Maybe.of(C_Mail.GetCraftingOrderMailInfo(inboxIndex))
end

function Wrappers.GetCraftingOrderMailInfoInto(
	reuse: Maybe<CraftingOrderMailInfo>,
	inboxIndex: number
): Maybe<CraftingOrderMailInfo>
	return Reuse.maybe(reuse, C_Mail.GetCraftingOrderMailInfo(inboxIndex))
end

return Wrappers
