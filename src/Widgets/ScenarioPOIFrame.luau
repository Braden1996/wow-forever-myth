--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetScenarioTooltipText(object: ScenarioPOIFrame): Maybe<string>
	return Maybe.of(object:GetScenarioTooltipText())
end

function Wrappers.GetScenarioTooltipTextInto(reuse: Maybe<string>, object: ScenarioPOIFrame): Maybe<string>
	return Reuse.maybe(reuse, object:GetScenarioTooltipText())
end

return Wrappers
