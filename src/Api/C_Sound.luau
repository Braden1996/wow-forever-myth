--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type PlaySoundResults = {
	read success: boolean,
	read soundHandle: SoundHandle,
}

export type PlaySoundWithOptionsResults = {
	read success: boolean,
	read soundHandle: SoundHandle,
}

local Wrappers = {}

function Wrappers.PlaySound(
	soundKitID: number,
	uiSoundSubType: UISoundSubType?,
	forceNoDuplicates: boolean?,
	runFinishCallback: boolean?,
	overridePriority: number?,
	volumeOverride: number?
): Maybe<PlaySoundResults>
	local r1, r2 = C_Sound.PlaySound(
		soundKitID,
		uiSoundSubType,
		forceNoDuplicates,
		runFinishCallback,
		overridePriority,
		volumeOverride
	)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		success = r1,
		soundHandle = r2,
	})
end

function Wrappers.PlaySoundInto(
	reuse: PlaySoundResults,
	soundKitID: number,
	uiSoundSubType: UISoundSubType?,
	forceNoDuplicates: boolean?,
	runFinishCallback: boolean?,
	overridePriority: number?,
	volumeOverride: number?
): Maybe<PlaySoundResults>
	local r1, r2 = C_Sound.PlaySound(
		soundKitID,
		uiSoundSubType,
		forceNoDuplicates,
		runFinishCallback,
		overridePriority,
		volumeOverride
	)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.success = r1
	fields.soundHandle = r2
	return Reuse.just(reuse)
end

function Wrappers.PlaySoundWithOptions(params: PlaySoundParams): Maybe<PlaySoundWithOptionsResults>
	local r1, r2 = C_Sound.PlaySoundWithOptions(params)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		success = r1,
		soundHandle = r2,
	})
end

function Wrappers.PlaySoundWithOptionsInto(
	reuse: PlaySoundWithOptionsResults,
	params: PlaySoundParams
): Maybe<PlaySoundWithOptionsResults>
	local r1, r2 = C_Sound.PlaySoundWithOptions(params)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.success = r1
	fields.soundHandle = r2
	return Reuse.just(reuse)
end

return Wrappers
