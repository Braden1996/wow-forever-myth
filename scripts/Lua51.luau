--!strict
local Lua51 = {}

local FOR_IN = "^%s*for%s+[%w_,%s]+%s+in%s+(.-)%s+do%s*$"

local function iteratesWithACall(expressions: string): boolean
	return string.match(expressions, "^[%w_.:]+%s*%b()$") ~= nil or string.find(expressions, ",", 1, true) ~= nil
end

function Lua51.generalisedIterations(source: string): { number }
	local found: { number } = {}
	local lineNo = 0
	for line in string.gmatch(string.gsub(source, "\r", "") .. "\n", "([^\n]*)\n") do
		lineNo += 1
		local expressions = string.match(line, FOR_IN)
		if expressions and not iteratesWithACall(expressions) then
			table.insert(found, lineNo)
		end
	end
	return found
end

return Lua51
