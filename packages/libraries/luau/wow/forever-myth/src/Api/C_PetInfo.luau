--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetPetHappinessResults = {
	read happiness: number,
	read damagePercentage: number,
	read loyaltyRate: number,
}

export type GetPetTrainingPointsResults = {
	read totalPoints: number,
	read usedPoints: number,
}

local Wrappers = {}

function Wrappers.GetPetHappiness(): Maybe<GetPetHappinessResults>
	local r1, r2, r3 = C_PetInfo.GetPetHappiness()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		happiness = r1,
		damagePercentage = r2,
		loyaltyRate = r3,
	})
end

function Wrappers.GetPetHappinessInto(reuse: GetPetHappinessResults): Maybe<GetPetHappinessResults>
	local r1, r2, r3 = C_PetInfo.GetPetHappiness()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.happiness = r1
	fields.damagePercentage = r2
	fields.loyaltyRate = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPetLoyalty(): Maybe<string>
	return Maybe.of(C_PetInfo.GetPetLoyalty())
end

function Wrappers.GetPetLoyaltyInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_PetInfo.GetPetLoyalty())
end

function Wrappers.GetPetTalentTree(): Maybe<stringView>
	return Maybe.of(C_PetInfo.GetPetTalentTree())
end

function Wrappers.GetPetTalentTreeInto(reuse: Maybe<stringView>): Maybe<stringView>
	return Reuse.maybe(reuse, C_PetInfo.GetPetTalentTree())
end

function Wrappers.GetPetTrainingPoints(): GetPetTrainingPointsResults
	local r1, r2 = C_PetInfo.GetPetTrainingPoints()
	return {
		totalPoints = r1,
		usedPoints = r2,
	}
end

function Wrappers.GetPetTrainingPointsInto(reuse: GetPetTrainingPointsResults): GetPetTrainingPointsResults
	local r1, r2 = C_PetInfo.GetPetTrainingPoints()
	local fields = Reuse.fields(reuse)
	fields.totalPoints = r1
	fields.usedPoints = r2
	return reuse
end

function Wrappers.GetSpellForPetAction(actionID: number): Maybe<number>
	return Maybe.of(C_PetInfo.GetSpellForPetAction(actionID))
end

function Wrappers.GetSpellForPetActionInto(reuse: Maybe<number>, actionID: number): Maybe<number>
	return Reuse.maybe(reuse, C_PetInfo.GetSpellForPetAction(actionID))
end

return Wrappers
