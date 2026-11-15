--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetFrozenPerksVendorItemInfo(): Maybe<PerksVendorItemInfo>
	return Maybe.of(C_PerksProgram.GetFrozenPerksVendorItemInfo())
end

function Wrappers.GetFrozenPerksVendorItemInfoInto(reuse: Maybe<PerksVendorItemInfo>): Maybe<PerksVendorItemInfo>
	return Reuse.maybe(reuse, C_PerksProgram.GetFrozenPerksVendorItemInfo())
end

return Wrappers
