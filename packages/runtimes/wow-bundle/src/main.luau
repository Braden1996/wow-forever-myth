--!strict
local ForeverMyth = require("../../../libraries/luau/wow/forever-myth/src/ForeverMyth")

local _, namespace = ...
if type(namespace) == "table" then
	namespace.ForeverMyth = ForeverMyth
end

return ForeverMyth
