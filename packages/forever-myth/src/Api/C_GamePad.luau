--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.AddSDLMapping(platform: Enum_ClientPlatformType, mapping: string): Maybe<boolean>
	return Maybe.of(C_GamePad.AddSDLMapping(platform, mapping))
end

function Wrappers.AddSDLMappingInto(
	reuse: Maybe<boolean>,
	platform: Enum_ClientPlatformType,
	mapping: string
): Maybe<boolean>
	return Reuse.maybe(reuse, C_GamePad.AddSDLMapping(platform, mapping))
end

function Wrappers.AxisIndexToConfigName(axisIndex: number): Maybe<string>
	return Maybe.of(C_GamePad.AxisIndexToConfigName(axisIndex))
end

function Wrappers.AxisIndexToConfigNameInto(reuse: Maybe<string>, axisIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_GamePad.AxisIndexToConfigName(axisIndex))
end

function Wrappers.ButtonBindingToIndex(bindingName: string): Maybe<number>
	return Maybe.of(C_GamePad.ButtonBindingToIndex(bindingName))
end

function Wrappers.ButtonBindingToIndexInto(reuse: Maybe<number>, bindingName: string): Maybe<number>
	return Reuse.maybe(reuse, C_GamePad.ButtonBindingToIndex(bindingName))
end

function Wrappers.ButtonIndexToBinding(buttonIndex: number): Maybe<string>
	return Maybe.of(C_GamePad.ButtonIndexToBinding(buttonIndex))
end

function Wrappers.ButtonIndexToBindingInto(reuse: Maybe<string>, buttonIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_GamePad.ButtonIndexToBinding(buttonIndex))
end

function Wrappers.ButtonIndexToConfigName(buttonIndex: number): Maybe<string>
	return Maybe.of(C_GamePad.ButtonIndexToConfigName(buttonIndex))
end

function Wrappers.ButtonIndexToConfigNameInto(reuse: Maybe<string>, buttonIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_GamePad.ButtonIndexToConfigName(buttonIndex))
end

function Wrappers.GetConfig(configID: GamePadConfigID): Maybe<GamePadConfig>
	return Maybe.of(C_GamePad.GetConfig(configID))
end

function Wrappers.GetConfigInto(reuse: Maybe<GamePadConfig>, configID: GamePadConfigID): Maybe<GamePadConfig>
	return Reuse.maybe(reuse, C_GamePad.GetConfig(configID))
end

function Wrappers.GetDeviceMappedState(deviceID: number?): Maybe<GamePadMappedState>
	return Maybe.of(C_GamePad.GetDeviceMappedState(deviceID))
end

function Wrappers.GetDeviceMappedStateInto(
	reuse: Maybe<GamePadMappedState>,
	deviceID: number?
): Maybe<GamePadMappedState>
	return Reuse.maybe(reuse, C_GamePad.GetDeviceMappedState(deviceID))
end

function Wrappers.GetDeviceRawState(deviceID: number): Maybe<GamePadRawState>
	return Maybe.of(C_GamePad.GetDeviceRawState(deviceID))
end

function Wrappers.GetDeviceRawStateInto(reuse: Maybe<GamePadRawState>, deviceID: number): Maybe<GamePadRawState>
	return Reuse.maybe(reuse, C_GamePad.GetDeviceRawState(deviceID))
end

function Wrappers.StickIndexToConfigName(stickIndex: number): Maybe<string>
	return Maybe.of(C_GamePad.StickIndexToConfigName(stickIndex))
end

function Wrappers.StickIndexToConfigNameInto(reuse: Maybe<string>, stickIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_GamePad.StickIndexToConfigName(stickIndex))
end

return Wrappers
