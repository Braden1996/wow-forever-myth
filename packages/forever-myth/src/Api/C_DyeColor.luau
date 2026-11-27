--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetDyeColorCategoryInfo(dyeColorCategoryID: number): Maybe<DyeColorCategoryDisplayInfo>
	return Maybe.of(C_DyeColor.GetDyeColorCategoryInfo(dyeColorCategoryID))
end

function Wrappers.GetDyeColorCategoryInfoInto(
	reuse: Maybe<DyeColorCategoryDisplayInfo>,
	dyeColorCategoryID: number
): Maybe<DyeColorCategoryDisplayInfo>
	return Reuse.maybe(reuse, C_DyeColor.GetDyeColorCategoryInfo(dyeColorCategoryID))
end

function Wrappers.GetDyeColorInfo(dyeColorID: number): Maybe<DyeColorDisplayInfo>
	return Maybe.of(C_DyeColor.GetDyeColorInfo(dyeColorID))
end

function Wrappers.GetDyeColorInfoInto(reuse: Maybe<DyeColorDisplayInfo>, dyeColorID: number): Maybe<DyeColorDisplayInfo>
	return Reuse.maybe(reuse, C_DyeColor.GetDyeColorInfo(dyeColorID))
end

return Wrappers
