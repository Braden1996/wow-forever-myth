--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.CompareStrings(left: string, right: string, strength: Enum_CollationStrength): Maybe<number>
	return Maybe.of(C_Intl.CompareStrings(left, right, strength))
end

function Wrappers.CompareStringsInto(
	reuse: Maybe<number>,
	left: string,
	right: string,
	strength: Enum_CollationStrength
): Maybe<number>
	return Reuse.maybe(reuse, C_Intl.CompareStrings(left, right, strength))
end

function Wrappers.FindBreaks(text: string, breakType: Enum_BreakType): Maybe<{ number }>
	return Maybe.of(C_Intl.FindBreaks(text, breakType))
end

function Wrappers.FindBreaksInto(reuse: Maybe<{ number }>, text: string, breakType: Enum_BreakType): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Intl.FindBreaks(text, breakType))
end

function Wrappers.FindStringMatches(text: string, pattern: string, strength: Enum_CollationStrength): Maybe<{ number }>
	return Maybe.of(C_Intl.FindStringMatches(text, pattern, strength))
end

function Wrappers.FindStringMatchesInto(
	reuse: Maybe<{ number }>,
	text: string,
	pattern: string,
	strength: Enum_CollationStrength
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Intl.FindStringMatches(text, pattern, strength))
end

function Wrappers.FoldCase(text: string): Maybe<string>
	return Maybe.of(C_Intl.FoldCase(text))
end

function Wrappers.FoldCaseInto(reuse: Maybe<string>, text: string): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.FoldCase(text))
end

function Wrappers.FormatCurrency(number: number, currencyCode: string): Maybe<string>
	return Maybe.of(C_Intl.FormatCurrency(number, currencyCode))
end

function Wrappers.FormatCurrencyInto(reuse: Maybe<string>, number: number, currencyCode: string): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.FormatCurrency(number, currencyCode))
end

function Wrappers.FormatDate(unixTimeSeconds: number, style: Enum_DateTimeStyle, timeZone: string): Maybe<string>
	return Maybe.of(C_Intl.FormatDate(unixTimeSeconds, style, timeZone))
end

function Wrappers.FormatDateInto(
	reuse: Maybe<string>,
	unixTimeSeconds: number,
	style: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.FormatDate(unixTimeSeconds, style, timeZone))
end

function Wrappers.FormatDateTime(
	unixTimeSeconds: number,
	dateStyle: Enum_DateTimeStyle,
	timeStyle: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Maybe.of(C_Intl.FormatDateTime(unixTimeSeconds, dateStyle, timeStyle, timeZone))
end

function Wrappers.FormatDateTimeInto(
	reuse: Maybe<string>,
	unixTimeSeconds: number,
	dateStyle: Enum_DateTimeStyle,
	timeStyle: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.FormatDateTime(unixTimeSeconds, dateStyle, timeStyle, timeZone))
end

function Wrappers.FormatNumber(number: number, style: Enum_NumberStyle): Maybe<string>
	return Maybe.of(C_Intl.FormatNumber(number, style))
end

function Wrappers.FormatNumberInto(reuse: Maybe<string>, number: number, style: Enum_NumberStyle): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.FormatNumber(number, style))
end

function Wrappers.FormatTime(unixTimeSeconds: number, style: Enum_DateTimeStyle, timeZone: string): Maybe<string>
	return Maybe.of(C_Intl.FormatTime(unixTimeSeconds, style, timeZone))
end

function Wrappers.FormatTimeInto(
	reuse: Maybe<string>,
	unixTimeSeconds: number,
	style: Enum_DateTimeStyle,
	timeZone: string
): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.FormatTime(unixTimeSeconds, style, timeZone))
end

function Wrappers.GetCharacterProperties(text: string): Maybe<CharacterProperties>
	return Maybe.of(C_Intl.GetCharacterProperties(text))
end

function Wrappers.GetCharacterPropertiesInto(
	reuse: Maybe<CharacterProperties>,
	text: string
): Maybe<CharacterProperties>
	return Reuse.maybe(reuse, C_Intl.GetCharacterProperties(text))
end

function Wrappers.GetCurrencyFractionDigits(currencyCode: string): Maybe<number>
	return Maybe.of(C_Intl.GetCurrencyFractionDigits(currencyCode))
end

function Wrappers.GetCurrencyFractionDigitsInto(reuse: Maybe<number>, currencyCode: string): Maybe<number>
	return Reuse.maybe(reuse, C_Intl.GetCurrencyFractionDigits(currencyCode))
end

function Wrappers.GetCurrencyName(currencyCode: string, nameStyle: Enum_CurrencyNameStyle): Maybe<string>
	return Maybe.of(C_Intl.GetCurrencyName(currencyCode, nameStyle))
end

function Wrappers.GetCurrencyNameInto(
	reuse: Maybe<string>,
	currencyCode: string,
	nameStyle: Enum_CurrencyNameStyle
): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.GetCurrencyName(currencyCode, nameStyle))
end

function Wrappers.GetDisplayName(displayLocale: string): Maybe<string>
	return Maybe.of(C_Intl.GetDisplayName(displayLocale))
end

function Wrappers.GetDisplayNameInto(reuse: Maybe<string>, displayLocale: string): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.GetDisplayName(displayLocale))
end

function Wrappers.GetSortKey(text: string, strength: Enum_CollationStrength): Maybe<string>
	return Maybe.of(C_Intl.GetSortKey(text, strength))
end

function Wrappers.GetSortKeyInto(reuse: Maybe<string>, text: string, strength: Enum_CollationStrength): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.GetSortKey(text, strength))
end

function Wrappers.Length(text: string): Maybe<number>
	return Maybe.of(C_Intl.Length(text))
end

function Wrappers.LengthInto(reuse: Maybe<number>, text: string): Maybe<number>
	return Reuse.maybe(reuse, C_Intl.Length(text))
end

function Wrappers.Normalize(text: string, form: Enum_NormalizationForm): Maybe<string>
	return Maybe.of(C_Intl.Normalize(text, form))
end

function Wrappers.NormalizeInto(reuse: Maybe<string>, text: string, form: Enum_NormalizationForm): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.Normalize(text, form))
end

function Wrappers.ParseCurrency(text: string): Maybe<CurrencyParseResult>
	return Maybe.of(C_Intl.ParseCurrency(text))
end

function Wrappers.ParseCurrencyInto(reuse: Maybe<CurrencyParseResult>, text: string): Maybe<CurrencyParseResult>
	return Reuse.maybe(reuse, C_Intl.ParseCurrency(text))
end

function Wrappers.ParseNumber(text: string, style: Enum_NumberStyle): Maybe<number>
	return Maybe.of(C_Intl.ParseNumber(text, style))
end

function Wrappers.ParseNumberInto(reuse: Maybe<number>, text: string, style: Enum_NumberStyle): Maybe<number>
	return Reuse.maybe(reuse, C_Intl.ParseNumber(text, style))
end

function Wrappers.SelectPlural(number: number, pluralType: Enum_PluralType): Maybe<string>
	return Maybe.of(C_Intl.SelectPlural(number, pluralType))
end

function Wrappers.SelectPluralInto(reuse: Maybe<string>, number: number, pluralType: Enum_PluralType): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.SelectPlural(number, pluralType))
end

function Wrappers.ToLower(text: string): Maybe<string>
	return Maybe.of(C_Intl.ToLower(text))
end

function Wrappers.ToLowerInto(reuse: Maybe<string>, text: string): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.ToLower(text))
end

function Wrappers.ToTitle(text: string): Maybe<string>
	return Maybe.of(C_Intl.ToTitle(text))
end

function Wrappers.ToTitleInto(reuse: Maybe<string>, text: string): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.ToTitle(text))
end

function Wrappers.ToUpper(text: string): Maybe<string>
	return Maybe.of(C_Intl.ToUpper(text))
end

function Wrappers.ToUpperInto(reuse: Maybe<string>, text: string): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.ToUpper(text))
end

function Wrappers.TransformLocale(transform: Enum_LocaleTransform): Maybe<string>
	return Maybe.of(C_Intl.TransformLocale(transform))
end

function Wrappers.TransformLocaleInto(reuse: Maybe<string>, transform: Enum_LocaleTransform): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.TransformLocale(transform))
end

function Wrappers.Transliterate(text: string, transliteratorID: string): Maybe<string>
	return Maybe.of(C_Intl.Transliterate(text, transliteratorID))
end

function Wrappers.TransliterateInto(reuse: Maybe<string>, text: string, transliteratorID: string): Maybe<string>
	return Reuse.maybe(reuse, C_Intl.Transliterate(text, transliteratorID))
end

return Wrappers
