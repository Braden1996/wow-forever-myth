--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetMacroName(macroId: number): Maybe<string>
	return Maybe.of(C_Macro.GetMacroName(macroId))
end

function Wrappers.GetMacroNameInto(reuse: Maybe<string>, macroId: number): Maybe<string>
	return Reuse.maybe(reuse, C_Macro.GetMacroName(macroId))
end

return Wrappers
