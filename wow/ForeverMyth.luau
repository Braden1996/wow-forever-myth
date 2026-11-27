--!strict
local ForeverMyth = require("../packages/forever-myth/src/ForeverMyth")

local _, namespace = ...
if type(namespace) == "table" then
	namespace.ForeverMyth = ForeverMyth
end

return ForeverMyth
