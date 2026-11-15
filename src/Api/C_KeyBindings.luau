--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetBindingContextForAction(action: string): Maybe<Enum_BindingContext>
	return Maybe.of(C_KeyBindings.GetBindingContextForAction(action))
end

function Wrappers.GetBindingContextForActionInto(
	reuse: Maybe<Enum_BindingContext>,
	action: string
): Maybe<Enum_BindingContext>
	return Reuse.maybe(reuse, C_KeyBindings.GetBindingContextForAction(action))
end

function Wrappers.GetBindingIndex(action: string): Maybe<number>
	return Maybe.of(C_KeyBindings.GetBindingIndex(action))
end

function Wrappers.GetBindingIndexInto(reuse: Maybe<number>, action: string): Maybe<number>
	return Reuse.maybe(reuse, C_KeyBindings.GetBindingIndex(action))
end

function Wrappers.GetCustomBindingType(bindingIndex: number): Maybe<Enum_CustomBindingType>
	return Maybe.of(C_KeyBindings.GetCustomBindingType(bindingIndex))
end

function Wrappers.GetCustomBindingTypeInto(
	reuse: Maybe<Enum_CustomBindingType>,
	bindingIndex: number
): Maybe<Enum_CustomBindingType>
	return Reuse.maybe(reuse, C_KeyBindings.GetCustomBindingType(bindingIndex))
end

function Wrappers.GetSearchTagsForAction(action: string): Maybe<{ string }>
	return Maybe.of(C_KeyBindings.GetSearchTagsForAction(action))
end

function Wrappers.GetSearchTagsForActionInto(reuse: Maybe<{ string }>, action: string): Maybe<{ string }>
	return Reuse.maybe(reuse, C_KeyBindings.GetSearchTagsForAction(action))
end

return Wrappers
