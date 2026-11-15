--!strict
local ForeverMyth = require("../src/ForeverMyth")

local _, namespace = ...
if type(namespace) == "table" then
	namespace.ForeverMyth = ForeverMyth
end

return ForeverMyth
