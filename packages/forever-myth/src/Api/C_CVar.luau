--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCVarInfoResults = {
	read value: string,
	read defaultValue: string,
	read isStoredServerAccount: boolean,
	read isStoredServerCharacter: boolean,
	read isLockedFromUser: boolean,
	read isSecure: boolean,
	read isReadOnly: boolean,
}

local Wrappers = {}

function Wrappers.GetCVar(name: string): Maybe<string>
	return Maybe.of(C_CVar.GetCVar(name))
end

function Wrappers.GetCVarInto(reuse: Maybe<string>, name: string): Maybe<string>
	return Reuse.maybe(reuse, C_CVar.GetCVar(name))
end

function Wrappers.GetCVarBitfield(name: string, index: number): Maybe<boolean>
	return Maybe.of(C_CVar.GetCVarBitfield(name, index))
end

function Wrappers.GetCVarBitfieldInto(reuse: Maybe<boolean>, name: string, index: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_CVar.GetCVarBitfield(name, index))
end

function Wrappers.GetCVarBool(name: string): Maybe<boolean>
	return Maybe.of(C_CVar.GetCVarBool(name))
end

function Wrappers.GetCVarBoolInto(reuse: Maybe<boolean>, name: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_CVar.GetCVarBool(name))
end

function Wrappers.GetCVarDefault(name: string): Maybe<string>
	return Maybe.of(C_CVar.GetCVarDefault(name))
end

function Wrappers.GetCVarDefaultInto(reuse: Maybe<string>, name: string): Maybe<string>
	return Reuse.maybe(reuse, C_CVar.GetCVarDefault(name))
end

function Wrappers.GetCVarInfo(name: string): GetCVarInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = C_CVar.GetCVarInfo(name)
	return {
		value = r1,
		defaultValue = r2,
		isStoredServerAccount = r3,
		isStoredServerCharacter = r4,
		isLockedFromUser = r5,
		isSecure = r6,
		isReadOnly = r7,
	}
end

function Wrappers.GetCVarInfoInto(reuse: GetCVarInfoResults, name: string): GetCVarInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = C_CVar.GetCVarInfo(name)
	local fields = Reuse.fields(reuse)
	fields.value = r1
	fields.defaultValue = r2
	fields.isStoredServerAccount = r3
	fields.isStoredServerCharacter = r4
	fields.isLockedFromUser = r5
	fields.isSecure = r6
	fields.isReadOnly = r7
	return reuse
end

function Wrappers.SetCVar(name: string, value: string?): Maybe<boolean>
	return Maybe.of(C_CVar.SetCVar(name, value))
end

function Wrappers.SetCVarInto(reuse: Maybe<boolean>, name: string, value: string?): Maybe<boolean>
	return Reuse.maybe(reuse, C_CVar.SetCVar(name, value))
end

function Wrappers.SetCVarBitfield(name: string, index: number, value: boolean): Maybe<boolean>
	return Maybe.of(C_CVar.SetCVarBitfield(name, index, value))
end

function Wrappers.SetCVarBitfieldInto(
	reuse: Maybe<boolean>,
	name: string,
	index: number,
	value: boolean
): Maybe<boolean>
	return Reuse.maybe(reuse, C_CVar.SetCVarBitfield(name, index, value))
end

return Wrappers
