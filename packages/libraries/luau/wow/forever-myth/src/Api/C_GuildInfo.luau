--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetPreferredPlaySettingsResults = {
	read loaded: boolean,
	read preferredLocaleID: number,
	read preferredDatacenterLocalityID: number,
	read lastPreferredLocaleChangeDate: time_t,
	read lastPreferredDatacenterLocalityChangeDate: time_t,
	read changeCooldownDays: number,
}

export type GetPreferredPlaySettingsFeaturesResults = {
	read canChangeLocale: boolean,
	read canChangeDatacenterLocality: boolean,
}

local Wrappers = {}

function Wrappers.GetGuildNewsInfo(index: number): Maybe<GuildNewsInfo>
	return Maybe.of(C_GuildInfo.GetGuildNewsInfo(index))
end

function Wrappers.GetGuildNewsInfoInto(reuse: Maybe<GuildNewsInfo>, index: number): Maybe<GuildNewsInfo>
	return Reuse.maybe(reuse, C_GuildInfo.GetGuildNewsInfo(index))
end

function Wrappers.GetGuildTabardInfo(unit: UnitToken?): Maybe<GuildTabardInfo>
	return Maybe.of(C_GuildInfo.GetGuildTabardInfo(unit))
end

function Wrappers.GetGuildTabardInfoInto(reuse: Maybe<GuildTabardInfo>, unit: UnitToken?): Maybe<GuildTabardInfo>
	return Reuse.maybe(reuse, C_GuildInfo.GetGuildTabardInfo(unit))
end

function Wrappers.GetInfoText(): Maybe<string>
	return Maybe.of(C_GuildInfo.GetInfoText())
end

function Wrappers.GetInfoTextInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_GuildInfo.GetInfoText())
end

function Wrappers.GetMOTD(): Maybe<string>
	return Maybe.of(C_GuildInfo.GetMOTD())
end

function Wrappers.GetMOTDInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_GuildInfo.GetMOTD())
end

function Wrappers.GetPreferredPlaySettings(): GetPreferredPlaySettingsResults
	local r1, r2, r3, r4, r5, r6 = C_GuildInfo.GetPreferredPlaySettings()
	return {
		loaded = r1,
		preferredLocaleID = r2,
		preferredDatacenterLocalityID = r3,
		lastPreferredLocaleChangeDate = r4,
		lastPreferredDatacenterLocalityChangeDate = r5,
		changeCooldownDays = r6,
	}
end

function Wrappers.GetPreferredPlaySettingsInto(reuse: GetPreferredPlaySettingsResults): GetPreferredPlaySettingsResults
	local r1, r2, r3, r4, r5, r6 = C_GuildInfo.GetPreferredPlaySettings()
	local fields = Reuse.fields(reuse)
	fields.loaded = r1
	fields.preferredLocaleID = r2
	fields.preferredDatacenterLocalityID = r3
	fields.lastPreferredLocaleChangeDate = r4
	fields.lastPreferredDatacenterLocalityChangeDate = r5
	fields.changeCooldownDays = r6
	return reuse
end

function Wrappers.GetPreferredPlaySettingsFeatures(): GetPreferredPlaySettingsFeaturesResults
	local r1, r2 = C_GuildInfo.GetPreferredPlaySettingsFeatures()
	return {
		canChangeLocale = r1,
		canChangeDatacenterLocality = r2,
	}
end

function Wrappers.GetPreferredPlaySettingsFeaturesInto(
	reuse: GetPreferredPlaySettingsFeaturesResults
): GetPreferredPlaySettingsFeaturesResults
	local r1, r2 = C_GuildInfo.GetPreferredPlaySettingsFeatures()
	local fields = Reuse.fields(reuse)
	fields.canChangeLocale = r1
	fields.canChangeDatacenterLocality = r2
	return reuse
end

function Wrappers.QueryGuildMembersForRecipe(
	skillLineID: number,
	recipeSpellID: number,
	recipeLevel: number?
): Maybe<number>
	return Maybe.of(C_GuildInfo.QueryGuildMembersForRecipe(skillLineID, recipeSpellID, recipeLevel))
end

function Wrappers.QueryGuildMembersForRecipeInto(
	reuse: Maybe<number>,
	skillLineID: number,
	recipeSpellID: number,
	recipeLevel: number?
): Maybe<number>
	return Reuse.maybe(reuse, C_GuildInfo.QueryGuildMembersForRecipe(skillLineID, recipeSpellID, recipeLevel))
end

return Wrappers
