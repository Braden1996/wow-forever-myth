--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetActiveChannelID(): Maybe<number>
	return Maybe.of(C_VoiceChat.GetActiveChannelID())
end

function Wrappers.GetActiveChannelIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_VoiceChat.GetActiveChannelID())
end

function Wrappers.GetActiveChannelType(): Maybe<Enum_ChatChannelType>
	return Maybe.of(C_VoiceChat.GetActiveChannelType())
end

function Wrappers.GetActiveChannelTypeInto(reuse: Maybe<Enum_ChatChannelType>): Maybe<Enum_ChatChannelType>
	return Reuse.maybe(reuse, C_VoiceChat.GetActiveChannelType())
end

function Wrappers.GetAvailableInputDevices(): Maybe<{ VoiceAudioDevice }>
	return Maybe.of(C_VoiceChat.GetAvailableInputDevices())
end

function Wrappers.GetAvailableInputDevicesInto(reuse: Maybe<{ VoiceAudioDevice }>): Maybe<{ VoiceAudioDevice }>
	return Reuse.maybe(reuse, C_VoiceChat.GetAvailableInputDevices())
end

function Wrappers.GetAvailableOutputDevices(): Maybe<{ VoiceAudioDevice }>
	return Maybe.of(C_VoiceChat.GetAvailableOutputDevices())
end

function Wrappers.GetAvailableOutputDevicesInto(reuse: Maybe<{ VoiceAudioDevice }>): Maybe<{ VoiceAudioDevice }>
	return Reuse.maybe(reuse, C_VoiceChat.GetAvailableOutputDevices())
end

function Wrappers.GetChannel(channelID: number): Maybe<VoiceChatChannel>
	return Maybe.of(C_VoiceChat.GetChannel(channelID))
end

function Wrappers.GetChannelInto(reuse: Maybe<VoiceChatChannel>, channelID: number): Maybe<VoiceChatChannel>
	return Reuse.maybe(reuse, C_VoiceChat.GetChannel(channelID))
end

function Wrappers.GetChannelForChannelType(channelType: Enum_ChatChannelType): Maybe<VoiceChatChannel>
	return Maybe.of(C_VoiceChat.GetChannelForChannelType(channelType))
end

function Wrappers.GetChannelForChannelTypeInto(
	reuse: Maybe<VoiceChatChannel>,
	channelType: Enum_ChatChannelType
): Maybe<VoiceChatChannel>
	return Reuse.maybe(reuse, C_VoiceChat.GetChannelForChannelType(channelType))
end

function Wrappers.GetChannelForCommunityStream(clubId: ClubId, streamId: ClubStreamId): Maybe<VoiceChatChannel>
	return Maybe.of(C_VoiceChat.GetChannelForCommunityStream(clubId, streamId))
end

function Wrappers.GetChannelForCommunityStreamInto(
	reuse: Maybe<VoiceChatChannel>,
	clubId: ClubId,
	streamId: ClubStreamId
): Maybe<VoiceChatChannel>
	return Reuse.maybe(reuse, C_VoiceChat.GetChannelForCommunityStream(clubId, streamId))
end

function Wrappers.GetCommunicationMode(): Maybe<Enum_CommunicationMode>
	return Maybe.of(C_VoiceChat.GetCommunicationMode())
end

function Wrappers.GetCommunicationModeInto(reuse: Maybe<Enum_CommunicationMode>): Maybe<Enum_CommunicationMode>
	return Reuse.maybe(reuse, C_VoiceChat.GetCommunicationMode())
end

function Wrappers.GetCurrentVoiceChatConnectionStatusCode(): Maybe<Enum_VoiceChatStatusCode>
	return Maybe.of(C_VoiceChat.GetCurrentVoiceChatConnectionStatusCode())
end

function Wrappers.GetCurrentVoiceChatConnectionStatusCodeInto(
	reuse: Maybe<Enum_VoiceChatStatusCode>
): Maybe<Enum_VoiceChatStatusCode>
	return Reuse.maybe(reuse, C_VoiceChat.GetCurrentVoiceChatConnectionStatusCode())
end

function Wrappers.GetInputVolume(): Maybe<number>
	return Maybe.of(C_VoiceChat.GetInputVolume())
end

function Wrappers.GetInputVolumeInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_VoiceChat.GetInputVolume())
end

function Wrappers.GetJoinClubVoiceChannelError(clubId: ClubId): Maybe<Enum_VoiceChannelErrorReason>
	return Maybe.of(C_VoiceChat.GetJoinClubVoiceChannelError(clubId))
end

function Wrappers.GetJoinClubVoiceChannelErrorInto(
	reuse: Maybe<Enum_VoiceChannelErrorReason>,
	clubId: ClubId
): Maybe<Enum_VoiceChannelErrorReason>
	return Reuse.maybe(reuse, C_VoiceChat.GetJoinClubVoiceChannelError(clubId))
end

function Wrappers.GetLocalPlayerActiveChannelMemberInfo(): Maybe<VoiceChatMember>
	return Maybe.of(C_VoiceChat.GetLocalPlayerActiveChannelMemberInfo())
end

function Wrappers.GetLocalPlayerActiveChannelMemberInfoInto(reuse: Maybe<VoiceChatMember>): Maybe<VoiceChatMember>
	return Reuse.maybe(reuse, C_VoiceChat.GetLocalPlayerActiveChannelMemberInfo())
end

function Wrappers.GetLocalPlayerMemberID(channelID: number): Maybe<number>
	return Maybe.of(C_VoiceChat.GetLocalPlayerMemberID(channelID))
end

function Wrappers.GetLocalPlayerMemberIDInto(reuse: Maybe<number>, channelID: number): Maybe<number>
	return Reuse.maybe(reuse, C_VoiceChat.GetLocalPlayerMemberID(channelID))
end

function Wrappers.GetMemberID(channelID: number, memberGUID: WOWGUID): Maybe<number>
	return Maybe.of(C_VoiceChat.GetMemberID(channelID, memberGUID))
end

function Wrappers.GetMemberIDInto(reuse: Maybe<number>, channelID: number, memberGUID: WOWGUID): Maybe<number>
	return Reuse.maybe(reuse, C_VoiceChat.GetMemberID(channelID, memberGUID))
end

function Wrappers.GetMemberInfo(memberID: number, channelID: number): Maybe<VoiceChatMember>
	return Maybe.of(C_VoiceChat.GetMemberInfo(memberID, channelID))
end

function Wrappers.GetMemberInfoInto(
	reuse: Maybe<VoiceChatMember>,
	memberID: number,
	channelID: number
): Maybe<VoiceChatMember>
	return Reuse.maybe(reuse, C_VoiceChat.GetMemberInfo(memberID, channelID))
end

function Wrappers.GetMemberName(memberID: number, channelID: number): Maybe<string>
	return Maybe.of(C_VoiceChat.GetMemberName(memberID, channelID))
end

function Wrappers.GetMemberNameInto(reuse: Maybe<string>, memberID: number, channelID: number): Maybe<string>
	return Reuse.maybe(reuse, C_VoiceChat.GetMemberName(memberID, channelID))
end

function Wrappers.GetMemberVolume(playerLocation: PlayerLocationMixin): Maybe<number>
	return Maybe.of(C_VoiceChat.GetMemberVolume(playerLocation))
end

function Wrappers.GetMemberVolumeInto(reuse: Maybe<number>, playerLocation: PlayerLocationMixin): Maybe<number>
	return Reuse.maybe(reuse, C_VoiceChat.GetMemberVolume(playerLocation))
end

function Wrappers.GetOutputVolume(): Maybe<number>
	return Maybe.of(C_VoiceChat.GetOutputVolume())
end

function Wrappers.GetOutputVolumeInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_VoiceChat.GetOutputVolume())
end

function Wrappers.GetPTTButtonPressedState(): Maybe<boolean>
	return Maybe.of(C_VoiceChat.GetPTTButtonPressedState())
end

function Wrappers.GetPTTButtonPressedStateInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_VoiceChat.GetPTTButtonPressedState())
end

function Wrappers.GetProcesses(): Maybe<{ VoiceChatProcess }>
	return Maybe.of(C_VoiceChat.GetProcesses())
end

function Wrappers.GetProcessesInto(reuse: Maybe<{ VoiceChatProcess }>): Maybe<{ VoiceChatProcess }>
	return Reuse.maybe(reuse, C_VoiceChat.GetProcesses())
end

function Wrappers.GetPushToTalkBinding(): Maybe<{ string }>
	return Maybe.of(C_VoiceChat.GetPushToTalkBinding())
end

function Wrappers.GetPushToTalkBindingInto(reuse: Maybe<{ string }>): Maybe<{ string }>
	return Reuse.maybe(reuse, C_VoiceChat.GetPushToTalkBinding())
end

function Wrappers.GetVADSensitivity(): Maybe<number>
	return Maybe.of(C_VoiceChat.GetVADSensitivity())
end

function Wrappers.GetVADSensitivityInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_VoiceChat.GetVADSensitivity())
end

function Wrappers.IsDeafened(): Maybe<boolean>
	return Maybe.of(C_VoiceChat.IsDeafened())
end

function Wrappers.IsDeafenedInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_VoiceChat.IsDeafened())
end

function Wrappers.IsMemberMuted(playerLocation: PlayerLocationMixin): Maybe<boolean>
	return Maybe.of(C_VoiceChat.IsMemberMuted(playerLocation))
end

function Wrappers.IsMemberMutedInto(reuse: Maybe<boolean>, playerLocation: PlayerLocationMixin): Maybe<boolean>
	return Reuse.maybe(reuse, C_VoiceChat.IsMemberMuted(playerLocation))
end

function Wrappers.IsMemberMutedForAll(memberID: number, channelID: number): Maybe<boolean>
	return Maybe.of(C_VoiceChat.IsMemberMutedForAll(memberID, channelID))
end

function Wrappers.IsMemberMutedForAllInto(reuse: Maybe<boolean>, memberID: number, channelID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_VoiceChat.IsMemberMutedForAll(memberID, channelID))
end

function Wrappers.IsMemberSilenced(memberID: number, channelID: number): Maybe<boolean>
	return Maybe.of(C_VoiceChat.IsMemberSilenced(memberID, channelID))
end

function Wrappers.IsMemberSilencedInto(reuse: Maybe<boolean>, memberID: number, channelID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_VoiceChat.IsMemberSilenced(memberID, channelID))
end

function Wrappers.IsMuted(): Maybe<boolean>
	return Maybe.of(C_VoiceChat.IsMuted())
end

function Wrappers.IsMutedInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_VoiceChat.IsMuted())
end

function Wrappers.IsSilenced(): Maybe<boolean>
	return Maybe.of(C_VoiceChat.IsSilenced())
end

function Wrappers.IsSilencedInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_VoiceChat.IsSilenced())
end

return Wrappers
