--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetProvingGroundsInfoResults = {
	read difficulty: number,
	read curWave: number,
	read maxWave: number,
	read duration: number,
}

local Wrappers = {}

function Wrappers.GetProvingGroundsInfo(): GetProvingGroundsInfoResults
	local r1, r2, r3, r4 = C_Scenario.GetProvingGroundsInfo()
	return {
		difficulty = r1,
		curWave = r2,
		maxWave = r3,
		duration = r4,
	}
end

function Wrappers.GetProvingGroundsInfoInto(reuse: GetProvingGroundsInfoResults): GetProvingGroundsInfoResults
	local r1, r2, r3, r4 = C_Scenario.GetProvingGroundsInfo()
	local fields = Reuse.fields(reuse)
	fields.difficulty = r1
	fields.curWave = r2
	fields.maxWave = r3
	fields.duration = r4
	return reuse
end

return Wrappers
