--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Result<T, E> = Result.Result<T, E>

export type GetAddOnInfoResults = {
	read name: string,
	read title: string,
	read notes: string,
	read loadable: boolean,
	read reason: string,
	read security: string,
}

export type IsAddOnLoadedResults = {
	read loadedOrLoading: boolean,
	read loaded: boolean,
}

local Wrappers = {}

function Wrappers.GetAddOnInfo(name: uiAddon): GetAddOnInfoResults
	local r1, r2, r3, r4, r5, r6 = C_AddOns.GetAddOnInfo(name)
	return {
		name = r1,
		title = r2,
		notes = r3,
		loadable = r4,
		reason = r5,
		security = r6,
	}
end

function Wrappers.GetAddOnInfoInto(reuse: GetAddOnInfoResults, name: uiAddon): GetAddOnInfoResults
	local r1, r2, r3, r4, r5, r6 = C_AddOns.GetAddOnInfo(name)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.title = r2
	fields.notes = r3
	fields.loadable = r4
	fields.reason = r5
	fields.security = r6
	return reuse
end

function Wrappers.IsAddOnLoadable(name: uiAddon, character: string?, demandLoaded: boolean?): Result<true, string>
	local r1, r2 = C_AddOns.IsAddOnLoadable(name, character, demandLoaded)
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.IsAddOnLoaded(name: uiAddon): IsAddOnLoadedResults
	local r1, r2 = C_AddOns.IsAddOnLoaded(name)
	return {
		loadedOrLoading = r1,
		loaded = r2,
	}
end

function Wrappers.IsAddOnLoadedInto(reuse: IsAddOnLoadedResults, name: uiAddon): IsAddOnLoadedResults
	local r1, r2 = C_AddOns.IsAddOnLoaded(name)
	local fields = Reuse.fields(reuse)
	fields.loadedOrLoading = r1
	fields.loaded = r2
	return reuse
end

function Wrappers.LoadAddOn(name: uiAddon): Result<true, string>
	local r1, r2 = C_AddOns.LoadAddOn(name)
	if r1 then
		return Result.ok(true)
	end
	return Result.err(if r2 == nil then "UNKNOWN" else r2)
end

return Wrappers
