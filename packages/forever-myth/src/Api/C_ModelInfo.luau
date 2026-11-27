--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetModelSceneInfoByIDResults = {
	read modelSceneType: Enum_ModelSceneType,
	read modelCameraIDs: { number },
	read modelActorsIDs: { number },
	read flags: number,
}

local Wrappers = {}

function Wrappers.GetModelSceneActorDisplayInfoByID(modelActorDisplayID: number): Maybe<UIModelSceneActorDisplayInfo>
	return Maybe.of(C_ModelInfo.GetModelSceneActorDisplayInfoByID(modelActorDisplayID))
end

function Wrappers.GetModelSceneActorDisplayInfoByIDInto(
	reuse: Maybe<UIModelSceneActorDisplayInfo>,
	modelActorDisplayID: number
): Maybe<UIModelSceneActorDisplayInfo>
	return Reuse.maybe(reuse, C_ModelInfo.GetModelSceneActorDisplayInfoByID(modelActorDisplayID))
end

function Wrappers.GetModelSceneActorInfoByID(modelActorID: number): Maybe<UIModelSceneActorInfo>
	return Maybe.of(C_ModelInfo.GetModelSceneActorInfoByID(modelActorID))
end

function Wrappers.GetModelSceneActorInfoByIDInto(
	reuse: Maybe<UIModelSceneActorInfo>,
	modelActorID: number
): Maybe<UIModelSceneActorInfo>
	return Reuse.maybe(reuse, C_ModelInfo.GetModelSceneActorInfoByID(modelActorID))
end

function Wrappers.GetModelSceneCameraInfoByID(modelSceneCameraID: number): Maybe<UIModelSceneCameraInfo>
	return Maybe.of(C_ModelInfo.GetModelSceneCameraInfoByID(modelSceneCameraID))
end

function Wrappers.GetModelSceneCameraInfoByIDInto(
	reuse: Maybe<UIModelSceneCameraInfo>,
	modelSceneCameraID: number
): Maybe<UIModelSceneCameraInfo>
	return Reuse.maybe(reuse, C_ModelInfo.GetModelSceneCameraInfoByID(modelSceneCameraID))
end

function Wrappers.GetModelSceneInfoByID(modelSceneID: number): Maybe<GetModelSceneInfoByIDResults>
	local r1, r2, r3, r4 = C_ModelInfo.GetModelSceneInfoByID(modelSceneID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		modelSceneType = r1,
		modelCameraIDs = r2,
		modelActorsIDs = r3,
		flags = r4,
	})
end

function Wrappers.GetModelSceneInfoByIDInto(
	reuse: GetModelSceneInfoByIDResults,
	modelSceneID: number
): Maybe<GetModelSceneInfoByIDResults>
	local r1, r2, r3, r4 = C_ModelInfo.GetModelSceneInfoByID(modelSceneID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.modelSceneType = r1
	fields.modelCameraIDs = r2
	fields.modelActorsIDs = r3
	fields.flags = r4
	return Reuse.just(reuse)
end

return Wrappers
