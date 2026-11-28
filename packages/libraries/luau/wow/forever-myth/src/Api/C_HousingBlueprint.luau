--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetBlueprintHyperlink(blueprintShareCode: string): Maybe<string>
	return Maybe.of(C_HousingBlueprint.GetBlueprintHyperlink(blueprintShareCode))
end

function Wrappers.GetBlueprintHyperlinkInto(reuse: Maybe<string>, blueprintShareCode: string): Maybe<string>
	return Reuse.maybe(reuse, C_HousingBlueprint.GetBlueprintHyperlink(blueprintShareCode))
end

function Wrappers.UpdateBlueprintStringFromInput(inputShareCode: string): Maybe<string>
	return Maybe.of(C_HousingBlueprint.UpdateBlueprintStringFromInput(inputShareCode))
end

function Wrappers.UpdateBlueprintStringFromInputInto(reuse: Maybe<string>, inputShareCode: string): Maybe<string>
	return Reuse.maybe(reuse, C_HousingBlueprint.UpdateBlueprintStringFromInput(inputShareCode))
end

return Wrappers
