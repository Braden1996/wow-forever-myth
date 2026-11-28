--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetClaimedOrder(): Maybe<CraftingOrderInfo>
	return Maybe.of(C_CraftingOrders.GetClaimedOrder())
end

function Wrappers.GetClaimedOrderInto(reuse: Maybe<CraftingOrderInfo>): Maybe<CraftingOrderInfo>
	return Reuse.maybe(reuse, C_CraftingOrders.GetClaimedOrder())
end

function Wrappers.GetDefaultOrdersSkillLine(): Maybe<number>
	return Maybe.of(C_CraftingOrders.GetDefaultOrdersSkillLine())
end

function Wrappers.GetDefaultOrdersSkillLineInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_CraftingOrders.GetDefaultOrdersSkillLine())
end

return Wrappers
