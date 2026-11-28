--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetGuildLinkStatusResults = {
	read isFullyLinked: boolean,
	read linkedChannelName: string,
	read linkedServerName: string,
}

export type GetNumDiscordChannelsResults = {
	read count: number,
	read valid: boolean,
}

local Wrappers = {}

function Wrappers.GetDiscordChannelName(serverIndex: number, channelIndex: number): Maybe<string>
	return Maybe.of(C_Discord.GetDiscordChannelName(serverIndex, channelIndex))
end

function Wrappers.GetDiscordChannelNameInto(
	reuse: Maybe<string>,
	serverIndex: number,
	channelIndex: number
): Maybe<string>
	return Reuse.maybe(reuse, C_Discord.GetDiscordChannelName(serverIndex, channelIndex))
end

function Wrappers.GetDiscordUserID(): Maybe<unknown>
	return Maybe.of(C_Discord.GetDiscordUserID())
end

function Wrappers.GetDiscordUserIDInto(reuse: Maybe<unknown>): Maybe<unknown>
	return Reuse.maybe(reuse, C_Discord.GetDiscordUserID())
end

function Wrappers.GetDiscordUserName(userID: unknown): Maybe<string>
	return Maybe.of(C_Discord.GetDiscordUserName(userID))
end

function Wrappers.GetDiscordUserNameInto(reuse: Maybe<string>, userID: unknown): Maybe<string>
	return Reuse.maybe(reuse, C_Discord.GetDiscordUserName(userID))
end

function Wrappers.GetDisplayNameType(): Maybe<Enum_DiscordDisplayNameType>
	return Maybe.of(C_Discord.GetDisplayNameType())
end

function Wrappers.GetDisplayNameTypeInto(reuse: Maybe<Enum_DiscordDisplayNameType>): Maybe<Enum_DiscordDisplayNameType>
	return Reuse.maybe(reuse, C_Discord.GetDisplayNameType())
end

function Wrappers.GetGuildLinkStatus(): Maybe<GetGuildLinkStatusResults>
	local r1, r2, r3 = C_Discord.GetGuildLinkStatus()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		isFullyLinked = r1,
		linkedChannelName = r2,
		linkedServerName = r3,
	})
end

function Wrappers.GetGuildLinkStatusInto(reuse: GetGuildLinkStatusResults): Maybe<GetGuildLinkStatusResults>
	local r1, r2, r3 = C_Discord.GetGuildLinkStatus()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.isFullyLinked = r1
	fields.linkedChannelName = r2
	fields.linkedServerName = r3
	return Reuse.just(reuse)
end

function Wrappers.GetNumDiscordChannels(serverIndex: number): Maybe<GetNumDiscordChannelsResults>
	local r1, r2 = C_Discord.GetNumDiscordChannels(serverIndex)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		count = r1,
		valid = r2,
	})
end

function Wrappers.GetNumDiscordChannelsInto(
	reuse: GetNumDiscordChannelsResults,
	serverIndex: number
): Maybe<GetNumDiscordChannelsResults>
	local r1, r2 = C_Discord.GetNumDiscordChannels(serverIndex)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.count = r1
	fields.valid = r2
	return Reuse.just(reuse)
end

function Wrappers.GetNumDiscordServers(): Maybe<number>
	return Maybe.of(C_Discord.GetNumDiscordServers())
end

function Wrappers.GetNumDiscordServersInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Discord.GetNumDiscordServers())
end

function Wrappers.GetServerName(index: number): Maybe<string>
	return Maybe.of(C_Discord.GetServerName(index))
end

function Wrappers.GetServerNameInto(reuse: Maybe<string>, index: number): Maybe<string>
	return Reuse.maybe(reuse, C_Discord.GetServerName(index))
end

function Wrappers.IsGuildChannelLinked(): Maybe<boolean>
	return Maybe.of(C_Discord.IsGuildChannelLinked())
end

function Wrappers.IsGuildChannelLinkedInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_Discord.IsGuildChannelLinked())
end

function Wrappers.IsGuildSettingSet(setting: Enum_DiscordGuildSettings): Maybe<boolean>
	return Maybe.of(C_Discord.IsGuildSettingSet(setting))
end

function Wrappers.IsGuildSettingSetInto(reuse: Maybe<boolean>, setting: Enum_DiscordGuildSettings): Maybe<boolean>
	return Reuse.maybe(reuse, C_Discord.IsGuildSettingSet(setting))
end

function Wrappers.IsUserOAuthed(): Maybe<boolean>
	return Maybe.of(C_Discord.IsUserOAuthed())
end

function Wrappers.IsUserOAuthedInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_Discord.IsUserOAuthed())
end

return Wrappers
