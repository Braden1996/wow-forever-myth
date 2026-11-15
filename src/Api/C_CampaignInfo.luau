--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCampaignChapterInfo(campaignChapterID: number): Maybe<CampaignChapterInfo>
	return Maybe.of(C_CampaignInfo.GetCampaignChapterInfo(campaignChapterID))
end

function Wrappers.GetCampaignChapterInfoInto(
	reuse: Maybe<CampaignChapterInfo>,
	campaignChapterID: number
): Maybe<CampaignChapterInfo>
	return Reuse.maybe(reuse, C_CampaignInfo.GetCampaignChapterInfo(campaignChapterID))
end

function Wrappers.GetCampaignInfo(campaignID: number): Maybe<CampaignInfo>
	return Maybe.of(C_CampaignInfo.GetCampaignInfo(campaignID))
end

function Wrappers.GetCampaignInfoInto(reuse: Maybe<CampaignInfo>, campaignID: number): Maybe<CampaignInfo>
	return Reuse.maybe(reuse, C_CampaignInfo.GetCampaignInfo(campaignID))
end

function Wrappers.GetChapterIDs(campaignID: number): Maybe<{ number }>
	return Maybe.of(C_CampaignInfo.GetChapterIDs(campaignID))
end

function Wrappers.GetChapterIDsInto(reuse: Maybe<{ number }>, campaignID: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_CampaignInfo.GetChapterIDs(campaignID))
end

function Wrappers.GetCurrentChapterID(campaignID: number): Maybe<number>
	return Maybe.of(C_CampaignInfo.GetCurrentChapterID(campaignID))
end

function Wrappers.GetCurrentChapterIDInto(reuse: Maybe<number>, campaignID: number): Maybe<number>
	return Reuse.maybe(reuse, C_CampaignInfo.GetCurrentChapterID(campaignID))
end

function Wrappers.GetFailureReason(campaignID: number): Maybe<CampaignFailureReason>
	return Maybe.of(C_CampaignInfo.GetFailureReason(campaignID))
end

function Wrappers.GetFailureReasonInto(
	reuse: Maybe<CampaignFailureReason>,
	campaignID: number
): Maybe<CampaignFailureReason>
	return Reuse.maybe(reuse, C_CampaignInfo.GetFailureReason(campaignID))
end

return Wrappers
