--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetSelectedDecorPetInfoResults = {
	read petID: Maybe<WOWGUID>,
	read petBehavior: Enum_HousingPetBehaviorType,
}

local Wrappers = {}

function Wrappers.GetHoveredDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingCustomizeMode.GetHoveredDecorInfo())
end

function Wrappers.GetHoveredDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingCustomizeMode.GetHoveredDecorInfo())
end

function Wrappers.GetHoveredRoomComponentInfo(): Maybe<HousingRoomComponentInstanceInfo>
	return Maybe.of(C_HousingCustomizeMode.GetHoveredRoomComponentInfo())
end

function Wrappers.GetHoveredRoomComponentInfoInto(
	reuse: Maybe<HousingRoomComponentInstanceInfo>
): Maybe<HousingRoomComponentInstanceInfo>
	return Reuse.maybe(reuse, C_HousingCustomizeMode.GetHoveredRoomComponentInfo())
end

function Wrappers.GetSelectedDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingCustomizeMode.GetSelectedDecorInfo())
end

function Wrappers.GetSelectedDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingCustomizeMode.GetSelectedDecorInfo())
end

function Wrappers.GetSelectedDecorPetInfo(): GetSelectedDecorPetInfoResults
	local r1, r2 = C_HousingCustomizeMode.GetSelectedDecorPetInfo()
	return {
		petID = Maybe.of(r1),
		petBehavior = r2,
	}
end

function Wrappers.GetSelectedDecorPetInfoInto(reuse: GetSelectedDecorPetInfoResults): GetSelectedDecorPetInfoResults
	local r1, r2 = C_HousingCustomizeMode.GetSelectedDecorPetInfo()
	local fields = Reuse.fields(reuse)
	fields.petID = Reuse.maybe(fields.petID, r1)
	fields.petBehavior = r2
	return reuse
end

function Wrappers.GetSelectedRoomComponentInfo(): Maybe<HousingRoomComponentInstanceInfo>
	return Maybe.of(C_HousingCustomizeMode.GetSelectedRoomComponentInfo())
end

function Wrappers.GetSelectedRoomComponentInfoInto(
	reuse: Maybe<HousingRoomComponentInstanceInfo>
): Maybe<HousingRoomComponentInstanceInfo>
	return Reuse.maybe(reuse, C_HousingCustomizeMode.GetSelectedRoomComponentInfo())
end

function Wrappers.GetThemeSetInfo(themeSetID: number): Maybe<string>
	return Maybe.of(C_HousingCustomizeMode.GetThemeSetInfo(themeSetID))
end

function Wrappers.GetThemeSetInfoInto(reuse: Maybe<string>, themeSetID: number): Maybe<string>
	return Reuse.maybe(reuse, C_HousingCustomizeMode.GetThemeSetInfo(themeSetID))
end

return Wrappers
