--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.CompareStrings(
	object: LuaLocaleContext,
	left: string,
	right: string,
	strength: Enum_CollationStrength
): Maybe<number>
	return Maybe.of(object:CompareStrings(left, right, strength))
end

function Wrappers.CompareStringsInto(
	reuse: Maybe<number>,
	object: LuaLocaleContext,
	left: string,
	right: string,
	strength: Enum_CollationStrength
): Maybe<number>
	return Reuse.maybe(reuse, object:CompareStrings(left, right, strength))
end

function Wrappers.FindBreaks(object: LuaLocaleContext, text: string, breakType: Enum_BreakType): Maybe<{ number }>
	return Maybe.of(object:FindBreaks(text, breakType))
end

function Wrappers.FindBreaksInto(
	reuse: Maybe<{ number }>,
	object: LuaLocaleContext,
	text: string,
	breakType: Enum_BreakType
): Maybe<{ number }>
	return Reuse.maybe(reuse, object:FindBreaks(text, breakType))
end

function Wrappers.FindStringMatches(
	object: LuaLocaleContext,
	text: string,
	pattern: string,
	strength: Enum_CollationStrength
): Maybe<{ number }>
	return Maybe.of(object:FindStringMatches(text, pattern, strength))
end

function Wrappers.FindStringMatchesInto(
	reuse: Maybe<{ number }>,
	object: LuaLocaleContext,
	text: string,
	pattern: string,
	strength: Enum_CollationStrength
): Maybe<{ number }>
	return Reuse.maybe(reuse, object:FindStringMatches(text, pattern, strength))
end

function Wrappers.FoldCase(object: LuaLocaleContext, text: string): Maybe<string>
	return Maybe.of(object:FoldCase(text))
end

function Wrappers.FoldCaseInto(reuse: Maybe<string>, object: LuaLocaleContext, text: string): Maybe<string>
	return Reuse.maybe(reuse, object:FoldCase(text))
end

function Wrappers.FormatCurrency(object: LuaLocaleContext, number: number, currencyCode: string): Maybe<string>
	return Maybe.of(object:FormatCurrency(number, currencyCode))
end

function Wrappers.FormatCurrencyInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	number: number,
	currencyCode: string
): Maybe<string>
	return Reuse.maybe(reuse, object:FormatCurrency(number, currencyCode))
end

function Wrappers.FormatDate(
	object: LuaLocaleContext,
	unixTimeSeconds: number,
	style: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Maybe.of(object:FormatDate(unixTimeSeconds, style, timeZone))
end

function Wrappers.FormatDateInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	unixTimeSeconds: number,
	style: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Reuse.maybe(reuse, object:FormatDate(unixTimeSeconds, style, timeZone))
end

function Wrappers.FormatDateTime(
	object: LuaLocaleContext,
	unixTimeSeconds: number,
	dateStyle: Enum_DateTimeStyle,
	timeStyle: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Maybe.of(object:FormatDateTime(unixTimeSeconds, dateStyle, timeStyle, timeZone))
end

function Wrappers.FormatDateTimeInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	unixTimeSeconds: number,
	dateStyle: Enum_DateTimeStyle,
	timeStyle: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Reuse.maybe(reuse, object:FormatDateTime(unixTimeSeconds, dateStyle, timeStyle, timeZone))
end

function Wrappers.FormatNumber(object: LuaLocaleContext, number: number, style: Enum_NumberStyle): Maybe<string>
	return Maybe.of(object:FormatNumber(number, style))
end

function Wrappers.FormatNumberInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	number: number,
	style: Enum_NumberStyle
): Maybe<string>
	return Reuse.maybe(reuse, object:FormatNumber(number, style))
end

function Wrappers.FormatTime(
	object: LuaLocaleContext,
	unixTimeSeconds: number,
	style: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Maybe.of(object:FormatTime(unixTimeSeconds, style, timeZone))
end

function Wrappers.FormatTimeInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	unixTimeSeconds: number,
	style: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Reuse.maybe(reuse, object:FormatTime(unixTimeSeconds, style, timeZone))
end

function Wrappers.GetCurrencyName(
	object: LuaLocaleContext,
	currencyCode: string,
	style: Enum_CurrencyNameStyle
): Maybe<string>
	return Maybe.of(object:GetCurrencyName(currencyCode, style))
end

function Wrappers.GetCurrencyNameInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	currencyCode: string,
	style: Enum_CurrencyNameStyle
): Maybe<string>
	return Reuse.maybe(reuse, object:GetCurrencyName(currencyCode, style))
end

function Wrappers.GetDisplayName(object: LuaLocaleContext, displayLocale: string): Maybe<string>
	return Maybe.of(object:GetDisplayName(displayLocale))
end

function Wrappers.GetDisplayNameInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	displayLocale: string
): Maybe<string>
	return Reuse.maybe(reuse, object:GetDisplayName(displayLocale))
end

function Wrappers.GetSortKey(object: LuaLocaleContext, text: string, strength: Enum_CollationStrength): Maybe<string>
	return Maybe.of(object:GetSortKey(text, strength))
end

function Wrappers.GetSortKeyInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	text: string,
	strength: Enum_CollationStrength
): Maybe<string>
	return Reuse.maybe(reuse, object:GetSortKey(text, strength))
end

function Wrappers.Length(object: LuaLocaleContext, text: string): Maybe<number>
	return Maybe.of(object:Length(text))
end

function Wrappers.LengthInto(reuse: Maybe<number>, object: LuaLocaleContext, text: string): Maybe<number>
	return Reuse.maybe(reuse, object:Length(text))
end

function Wrappers.ParseCurrency(object: LuaLocaleContext, text: string): Maybe<CurrencyParseResult>
	return Maybe.of(object:ParseCurrency(text))
end

function Wrappers.ParseCurrencyInto(
	reuse: Maybe<CurrencyParseResult>,
	object: LuaLocaleContext,
	text: string
): Maybe<CurrencyParseResult>
	return Reuse.maybe(reuse, object:ParseCurrency(text))
end

function Wrappers.ParseNumber(object: LuaLocaleContext, text: string, style: Enum_NumberStyle): Maybe<number>
	return Maybe.of(object:ParseNumber(text, style))
end

function Wrappers.ParseNumberInto(
	reuse: Maybe<number>,
	object: LuaLocaleContext,
	text: string,
	style: Enum_NumberStyle
): Maybe<number>
	return Reuse.maybe(reuse, object:ParseNumber(text, style))
end

function Wrappers.SelectPlural(object: LuaLocaleContext, number: number, pluralType: Enum_PluralType): Maybe<string>
	return Maybe.of(object:SelectPlural(number, pluralType))
end

function Wrappers.SelectPluralInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	number: number,
	pluralType: Enum_PluralType
): Maybe<string>
	return Reuse.maybe(reuse, object:SelectPlural(number, pluralType))
end

function Wrappers.ToLower(object: LuaLocaleContext, text: string): Maybe<string>
	return Maybe.of(object:ToLower(text))
end

function Wrappers.ToLowerInto(reuse: Maybe<string>, object: LuaLocaleContext, text: string): Maybe<string>
	return Reuse.maybe(reuse, object:ToLower(text))
end

function Wrappers.ToTitle(object: LuaLocaleContext, text: string): Maybe<string>
	return Maybe.of(object:ToTitle(text))
end

function Wrappers.ToTitleInto(reuse: Maybe<string>, object: LuaLocaleContext, text: string): Maybe<string>
	return Reuse.maybe(reuse, object:ToTitle(text))
end

function Wrappers.ToUpper(object: LuaLocaleContext, text: string): Maybe<string>
	return Maybe.of(object:ToUpper(text))
end

function Wrappers.ToUpperInto(reuse: Maybe<string>, object: LuaLocaleContext, text: string): Maybe<string>
	return Reuse.maybe(reuse, object:ToUpper(text))
end

function Wrappers.TransformLocale(object: LuaLocaleContext, transform: Enum_LocaleTransform): Maybe<string>
	return Maybe.of(object:TransformLocale(transform))
end

function Wrappers.TransformLocaleInto(
	reuse: Maybe<string>,
	object: LuaLocaleContext,
	transform: Enum_LocaleTransform
): Maybe<string>
	return Reuse.maybe(reuse, object:TransformLocale(transform))
end

return Wrappers
