--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetChannelRosterInfoResults = {
	read name: string,
	read owner: boolean,
	read moderator: boolean,
	read guid: WOWGUID,
}

export type IsLoggingCombatResults = {
	read enabled: boolean,
	read advanced: boolean,
}

local Wrappers = {}

function Wrappers.GetChannelInfoFromIdentifier(channelIdentifier: string): Maybe<ChatChannelInfo>
	return Maybe.of(C_ChatInfo.GetChannelInfoFromIdentifier(channelIdentifier))
end

function Wrappers.GetChannelInfoFromIdentifierInto(
	reuse: Maybe<ChatChannelInfo>,
	channelIdentifier: string
): Maybe<ChatChannelInfo>
	return Reuse.maybe(reuse, C_ChatInfo.GetChannelInfoFromIdentifier(channelIdentifier))
end

function Wrappers.GetChannelRosterInfo(channelIndex: number, rosterIndex: number): Maybe<GetChannelRosterInfoResults>
	local r1, r2, r3, r4 = C_ChatInfo.GetChannelRosterInfo(channelIndex, rosterIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		owner = r2,
		moderator = r3,
		guid = r4,
	})
end

function Wrappers.GetChannelRosterInfoInto(
	reuse: GetChannelRosterInfoResults,
	channelIndex: number,
	rosterIndex: number
): Maybe<GetChannelRosterInfoResults>
	local r1, r2, r3, r4 = C_ChatInfo.GetChannelRosterInfo(channelIndex, rosterIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.owner = r2
	fields.moderator = r3
	fields.guid = r4
	return Reuse.just(reuse)
end

function Wrappers.GetChatTypeName(typeID: number): Maybe<string>
	return Maybe.of(C_ChatInfo.GetChatTypeName(typeID))
end

function Wrappers.GetChatTypeNameInto(reuse: Maybe<string>, typeID: number): Maybe<string>
	return Reuse.maybe(reuse, C_ChatInfo.GetChatTypeName(typeID))
end

function Wrappers.GetColorForChatType(chatType: string): Maybe<ColorMixin>
	return Maybe.of(C_ChatInfo.GetColorForChatType(chatType))
end

function Wrappers.GetColorForChatTypeInto(reuse: Maybe<ColorMixin>, chatType: string): Maybe<ColorMixin>
	return Reuse.maybe(reuse, C_ChatInfo.GetColorForChatType(chatType))
end

function Wrappers.GetGeneralChannelLocalID(): Maybe<number>
	return Maybe.of(C_ChatInfo.GetGeneralChannelLocalID())
end

function Wrappers.GetGeneralChannelLocalIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_ChatInfo.GetGeneralChannelLocalID())
end

function Wrappers.IsLoggingCombat(): IsLoggingCombatResults
	local r1, r2 = C_ChatInfo.IsLoggingCombat()
	return {
		enabled = r1,
		advanced = r2,
	}
end

function Wrappers.IsLoggingCombatInto(reuse: IsLoggingCombatResults): IsLoggingCombatResults
	local r1, r2 = C_ChatInfo.IsLoggingCombat()
	local fields = Reuse.fields(reuse)
	fields.enabled = r1
	fields.advanced = r2
	return reuse
end

function Wrappers.PerformEmote(emoteName: string, targetName: string?, suppressMoveError: boolean?): Maybe<boolean>
	return Maybe.of(C_ChatInfo.PerformEmote(emoteName, targetName, suppressMoveError))
end

function Wrappers.PerformEmoteInto(
	reuse: Maybe<boolean>,
	emoteName: string,
	targetName: string?,
	suppressMoveError: boolean?
): Maybe<boolean>
	return Reuse.maybe(reuse, C_ChatInfo.PerformEmote(emoteName, targetName, suppressMoveError))
end

function Wrappers.SendAddonMessageLogged(
	prefix: string,
	message: string,
	chatType: string?,
	target: string?
): Maybe<Enum_SendAddonMessageResult>
	return Maybe.of(C_ChatInfo.SendAddonMessageLogged(prefix, message, chatType, target))
end

function Wrappers.SendAddonMessageLoggedInto(
	reuse: Maybe<Enum_SendAddonMessageResult>,
	prefix: string,
	message: string,
	chatType: string?,
	target: string?
): Maybe<Enum_SendAddonMessageResult>
	return Reuse.maybe(reuse, C_ChatInfo.SendAddonMessageLogged(prefix, message, chatType, target))
end

return Wrappers
