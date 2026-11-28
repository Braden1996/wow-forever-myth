--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetTemplateInfo(name: string): Maybe<XMLTemplateInfo>
	return Maybe.of(C_XMLUtil.GetTemplateInfo(name))
end

function Wrappers.GetTemplateInfoInto(reuse: Maybe<XMLTemplateInfo>, name: string): Maybe<XMLTemplateInfo>
	return Reuse.maybe(reuse, C_XMLUtil.GetTemplateInfo(name))
end

return Wrappers
