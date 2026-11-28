--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCurrentHouseExteriorTypeResults = {
	read houseExteriorTypeID: Maybe<number>,
	read houseExteriorTypeName: Maybe<string>,
}

local Wrappers = {}

function Wrappers.GetCoreFixtureOptionsInfo(coreFixtureType: Enum_HousingFixtureType): Maybe<HousingCoreFixtureInfo>
	return Maybe.of(C_HouseExterior.GetCoreFixtureOptionsInfo(coreFixtureType))
end

function Wrappers.GetCoreFixtureOptionsInfoInto(
	reuse: Maybe<HousingCoreFixtureInfo>,
	coreFixtureType: Enum_HousingFixtureType
): Maybe<HousingCoreFixtureInfo>
	return Reuse.maybe(reuse, C_HouseExterior.GetCoreFixtureOptionsInfo(coreFixtureType))
end

function Wrappers.GetCurrentHouseExteriorSize(): Maybe<Enum_HousingFixtureSize>
	return Maybe.of(C_HouseExterior.GetCurrentHouseExteriorSize())
end

function Wrappers.GetCurrentHouseExteriorSizeInto(reuse: Maybe<Enum_HousingFixtureSize>): Maybe<Enum_HousingFixtureSize>
	return Reuse.maybe(reuse, C_HouseExterior.GetCurrentHouseExteriorSize())
end

function Wrappers.GetCurrentHouseExteriorType(): GetCurrentHouseExteriorTypeResults
	local r1, r2 = C_HouseExterior.GetCurrentHouseExteriorType()
	return {
		houseExteriorTypeID = Maybe.of(r1),
		houseExteriorTypeName = Maybe.of(r2),
	}
end

function Wrappers.GetCurrentHouseExteriorTypeInto(
	reuse: GetCurrentHouseExteriorTypeResults
): GetCurrentHouseExteriorTypeResults
	local r1, r2 = C_HouseExterior.GetCurrentHouseExteriorType()
	local fields = Reuse.fields(reuse)
	fields.houseExteriorTypeID = Reuse.maybe(fields.houseExteriorTypeID, r1)
	fields.houseExteriorTypeName = Reuse.maybe(fields.houseExteriorTypeName, r2)
	return reuse
end

function Wrappers.GetHouseExteriorSizeOptions(): Maybe<HouseExteriorSizeOptionsInfo>
	return Maybe.of(C_HouseExterior.GetHouseExteriorSizeOptions())
end

function Wrappers.GetHouseExteriorSizeOptionsInto(
	reuse: Maybe<HouseExteriorSizeOptionsInfo>
): Maybe<HouseExteriorSizeOptionsInfo>
	return Reuse.maybe(reuse, C_HouseExterior.GetHouseExteriorSizeOptions())
end

function Wrappers.GetHouseExteriorTypeOptions(): Maybe<HouseExteriorTypeOptionsInfo>
	return Maybe.of(C_HouseExterior.GetHouseExteriorTypeOptions())
end

function Wrappers.GetHouseExteriorTypeOptionsInto(
	reuse: Maybe<HouseExteriorTypeOptionsInfo>
): Maybe<HouseExteriorTypeOptionsInfo>
	return Reuse.maybe(reuse, C_HouseExterior.GetHouseExteriorTypeOptions())
end

function Wrappers.GetSelectedFixturePointInfo(): Maybe<HousingFixturePointInfo>
	return Maybe.of(C_HouseExterior.GetSelectedFixturePointInfo())
end

function Wrappers.GetSelectedFixturePointInfoInto(reuse: Maybe<HousingFixturePointInfo>): Maybe<HousingFixturePointInfo>
	return Reuse.maybe(reuse, C_HouseExterior.GetSelectedFixturePointInfo())
end

return Wrappers
