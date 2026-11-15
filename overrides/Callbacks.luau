--!strict
local OverrideTypes = require("../generator/OverrideTypes")

local callbacks: { [string]: OverrideTypes.CallbackOverride } = {
	["C_Timer.After"] = {
		callback = "callback",
		resolves = "nil",
		why = "calls its callback once, after the given seconds, with no arguments",
	},
}

return callbacks
