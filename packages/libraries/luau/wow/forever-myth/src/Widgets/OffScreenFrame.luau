--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.TakeSnapshot(object: OffScreenFrame): Maybe<number>
	return Maybe.of(object:TakeSnapshot())
end

function Wrappers.TakeSnapshotInto(reuse: Maybe<number>, object: OffScreenFrame): Maybe<number>
	return Reuse.maybe(reuse, object:TakeSnapshot())
end

function Wrappers.UsesNPOT(object: OffScreenFrame): Maybe<boolean>
	return Maybe.of(object:UsesNPOT())
end

function Wrappers.UsesNPOTInto(reuse: Maybe<boolean>, object: OffScreenFrame): Maybe<boolean>
	return Reuse.maybe(reuse, object:UsesNPOT())
end

return Wrappers
