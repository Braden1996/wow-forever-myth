--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAvailableCustomizations(): Maybe<{ CharCustomizationCategory }>
	return Maybe.of(C_BarberShop.GetAvailableCustomizations())
end

function Wrappers.GetAvailableCustomizationsInto(
	reuse: Maybe<{ CharCustomizationCategory }>
): Maybe<{ CharCustomizationCategory }>
	return Reuse.maybe(reuse, C_BarberShop.GetAvailableCustomizations())
end

function Wrappers.GetCurrentCharacterData(): Maybe<PlayerInfoCharacterData>
	return Maybe.of(C_BarberShop.GetCurrentCharacterData())
end

function Wrappers.GetCurrentCharacterDataInto(reuse: Maybe<PlayerInfoCharacterData>): Maybe<PlayerInfoCharacterData>
	return Reuse.maybe(reuse, C_BarberShop.GetCurrentCharacterData())
end

function Wrappers.GetViewingChrModel(): Maybe<number>
	return Maybe.of(C_BarberShop.GetViewingChrModel())
end

function Wrappers.GetViewingChrModelInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_BarberShop.GetViewingChrModel())
end

return Wrappers
