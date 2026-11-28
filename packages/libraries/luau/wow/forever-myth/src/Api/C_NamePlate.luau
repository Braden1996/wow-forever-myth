--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetNamePlateSizeResults = {
	read width: uiUnit,
	read height: uiUnit,
}

local Wrappers = {}

function Wrappers.GetNamePlateSize(): GetNamePlateSizeResults
	local r1, r2 = C_NamePlate.GetNamePlateSize()
	return {
		width = r1,
		height = r2,
	}
end

function Wrappers.GetNamePlateSizeInto(reuse: GetNamePlateSizeResults): GetNamePlateSizeResults
	local r1, r2 = C_NamePlate.GetNamePlateSize()
	local fields = Reuse.fields(reuse)
	fields.width = r1
	fields.height = r2
	return reuse
end

return Wrappers
