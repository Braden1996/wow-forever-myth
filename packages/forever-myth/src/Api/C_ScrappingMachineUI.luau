--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCurrentPendingScrapItemLocationByIndex(index: number): Maybe<ItemLocationMixin>
	return Maybe.of(C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex(index))
end

function Wrappers.GetCurrentPendingScrapItemLocationByIndexInto(
	reuse: Maybe<ItemLocationMixin>,
	index: number
): Maybe<ItemLocationMixin>
	return Reuse.maybe(reuse, C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex(index))
end

function Wrappers.GetScrappingMachineName(): Maybe<string>
	return Maybe.of(C_ScrappingMachineUI.GetScrappingMachineName())
end

function Wrappers.GetScrappingMachineNameInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_ScrappingMachineUI.GetScrappingMachineName())
end

return Wrappers
