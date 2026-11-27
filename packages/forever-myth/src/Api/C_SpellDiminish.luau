--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAllSpellDiminishCategories(
	ruleset: Enum_SpellDiminishRuleset?
): Maybe<{ SpellDiminishCategoryInfo }>
	return Maybe.of(C_SpellDiminish.GetAllSpellDiminishCategories(ruleset))
end

function Wrappers.GetAllSpellDiminishCategoriesInto(
	reuse: Maybe<{ SpellDiminishCategoryInfo }>,
	ruleset: Enum_SpellDiminishRuleset?
): Maybe<{ SpellDiminishCategoryInfo }>
	return Reuse.maybe(reuse, C_SpellDiminish.GetAllSpellDiminishCategories(ruleset))
end

function Wrappers.GetSpellDiminishCategoryInfo(category: Enum_SpellDiminishCategory): Maybe<SpellDiminishCategoryInfo>
	return Maybe.of(C_SpellDiminish.GetSpellDiminishCategoryInfo(category))
end

function Wrappers.GetSpellDiminishCategoryInfoInto(
	reuse: Maybe<SpellDiminishCategoryInfo>,
	category: Enum_SpellDiminishCategory
): Maybe<SpellDiminishCategoryInfo>
	return Reuse.maybe(reuse, C_SpellDiminish.GetSpellDiminishCategoryInfo(category))
end

function Wrappers.ShouldTrackSpellDiminishCategory(
	category: Enum_SpellDiminishCategory,
	ruleset: Enum_SpellDiminishRuleset
): Maybe<boolean>
	return Maybe.of(C_SpellDiminish.ShouldTrackSpellDiminishCategory(category, ruleset))
end

function Wrappers.ShouldTrackSpellDiminishCategoryInto(
	reuse: Maybe<boolean>,
	category: Enum_SpellDiminishCategory,
	ruleset: Enum_SpellDiminishRuleset
): Maybe<boolean>
	return Reuse.maybe(reuse, C_SpellDiminish.ShouldTrackSpellDiminishCategory(category, ruleset))
end

return Wrappers
