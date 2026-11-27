--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetTextColorCurveResults = {
	read curve: LuaColorCurveObject,
	read property: Enum_DurationTextBindingProperty,
}

local Wrappers = {}

function Wrappers.GetDuration(object: DurationTextBindingObject): Maybe<LuaDurationObject>
	return Maybe.of(object:GetDuration())
end

function Wrappers.GetDurationInto(
	reuse: Maybe<LuaDurationObject>,
	object: DurationTextBindingObject
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, object:GetDuration())
end

function Wrappers.GetExpiredText(object: DurationTextBindingObject): Maybe<string>
	return Maybe.of(object:GetExpiredText())
end

function Wrappers.GetExpiredTextInto(reuse: Maybe<string>, object: DurationTextBindingObject): Maybe<string>
	return Reuse.maybe(reuse, object:GetExpiredText())
end

function Wrappers.GetFontString(object: DurationTextBindingObject): Maybe<FontString>
	return Maybe.of(object:GetFontString())
end

function Wrappers.GetFontStringInto(reuse: Maybe<FontString>, object: DurationTextBindingObject): Maybe<FontString>
	return Reuse.maybe(reuse, object:GetFontString())
end

function Wrappers.GetFormattedTextColor(object: DurationTextBindingObject): Maybe<ColorMixin>
	return Maybe.of(object:GetFormattedTextColor())
end

function Wrappers.GetFormattedTextColorInto(
	reuse: Maybe<ColorMixin>,
	object: DurationTextBindingObject
): Maybe<ColorMixin>
	return Reuse.maybe(reuse, object:GetFormattedTextColor())
end

function Wrappers.GetTextColorCurve(object: DurationTextBindingObject): Maybe<GetTextColorCurveResults>
	local r1, r2 = object:GetTextColorCurve()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		curve = r1,
		property = r2,
	})
end

function Wrappers.GetTextColorCurveInto(
	reuse: GetTextColorCurveResults,
	object: DurationTextBindingObject
): Maybe<GetTextColorCurveResults>
	local r1, r2 = object:GetTextColorCurve()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.curve = r1
	fields.property = r2
	return Reuse.just(reuse)
end

function Wrappers.GetZeroDurationText(object: DurationTextBindingObject): Maybe<string>
	return Maybe.of(object:GetZeroDurationText())
end

function Wrappers.GetZeroDurationTextInto(reuse: Maybe<string>, object: DurationTextBindingObject): Maybe<string>
	return Reuse.maybe(reuse, object:GetZeroDurationText())
end

return Wrappers
