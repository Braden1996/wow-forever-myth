--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type IsCooldownViewerAvailableResults = {
	read isAvailable: boolean,
	read failureReason: string,
}

local Wrappers = {}

function Wrappers.GetCooldownViewerCooldownInfo(cooldownID: number): Maybe<CooldownViewerCooldown>
	return Maybe.of(C_CooldownViewer.GetCooldownViewerCooldownInfo(cooldownID))
end

function Wrappers.GetCooldownViewerCooldownInfoInto(
	reuse: Maybe<CooldownViewerCooldown>,
	cooldownID: number
): Maybe<CooldownViewerCooldown>
	return Reuse.maybe(reuse, C_CooldownViewer.GetCooldownViewerCooldownInfo(cooldownID))
end

function Wrappers.IsCooldownViewerAvailable(): IsCooldownViewerAvailableResults
	local r1, r2 = C_CooldownViewer.IsCooldownViewerAvailable()
	return {
		isAvailable = r1,
		failureReason = r2,
	}
end

function Wrappers.IsCooldownViewerAvailableInto(
	reuse: IsCooldownViewerAvailableResults
): IsCooldownViewerAvailableResults
	local r1, r2 = C_CooldownViewer.IsCooldownViewerAvailable()
	local fields = Reuse.fields(reuse)
	fields.isAvailable = r1
	fields.failureReason = r2
	return reuse
end

return Wrappers
