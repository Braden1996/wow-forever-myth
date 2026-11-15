--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetSkillLineInfo(index: number): Maybe<SkillLineAttributes>
	return Maybe.of(C_SkillInfo.GetSkillLineInfo(index))
end

function Wrappers.GetSkillLineInfoInto(reuse: Maybe<SkillLineAttributes>, index: number): Maybe<SkillLineAttributes>
	return Reuse.maybe(reuse, C_SkillInfo.GetSkillLineInfo(index))
end

function Wrappers.GetSkillLineInfoByID(ID: number): Maybe<SkillLineAttributes>
	return Maybe.of(C_SkillInfo.GetSkillLineInfoByID(ID))
end

function Wrappers.GetSkillLineInfoByIDInto(reuse: Maybe<SkillLineAttributes>, ID: number): Maybe<SkillLineAttributes>
	return Reuse.maybe(reuse, C_SkillInfo.GetSkillLineInfoByID(ID))
end

return Wrappers
