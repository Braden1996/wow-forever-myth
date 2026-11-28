--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.IsAgeVerificationRestrictedMinor(): Maybe<boolean>
	return Maybe.of(C_SocialRestrictions.IsAgeVerificationRestrictedMinor())
end

function Wrappers.IsAgeVerificationRestrictedMinorInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_SocialRestrictions.IsAgeVerificationRestrictedMinor())
end

return Wrappers
