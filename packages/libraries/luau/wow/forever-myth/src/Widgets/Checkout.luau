--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.OpenCheckout(object: Checkout, checkoutID: number): Maybe<boolean>
	return Maybe.of(object:OpenCheckout(checkoutID))
end

function Wrappers.OpenCheckoutInto(reuse: Maybe<boolean>, object: Checkout, checkoutID: number): Maybe<boolean>
	return Reuse.maybe(reuse, object:OpenCheckout(checkoutID))
end

return Wrappers
