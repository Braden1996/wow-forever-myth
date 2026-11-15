--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetPingPositionResults = {
	read positionX: number,
	read positionY: number,
}

local Wrappers = {}

function Wrappers.GetPingPosition(object: Minimap): GetPingPositionResults
	local r1, r2 = object:GetPingPosition()
	return {
		positionX = r1,
		positionY = r2,
	}
end

function Wrappers.GetPingPositionInto(reuse: GetPingPositionResults, object: Minimap): GetPingPositionResults
	local r1, r2 = object:GetPingPosition()
	local fields = Reuse.fields(reuse)
	fields.positionX = r1
	fields.positionY = r2
	return reuse
end

return Wrappers
