--!strict
local Lib = require("../support/Lib")
local Lua51 = require("../../scripts/Lua51")

local spec: Lib.Spec = function(_lib, t, _world)
	t.test("lua51: generalised iteration over a table is found", function()
		t.equal(Lua51.generalisedIterations("local x = 1\nfor _, v in values do\nend\n"), { 2 })
		t.equal(Lua51.generalisedIterations("\tfor key, value in self.byKey do"), { 1 })
	end)
	t.test("lua51: iterator calls and explicit iterator triples are allowed", function()
		local source = table.concat({
			"for _, v in ipairs(values) do",
			"for k, v in pairs(t) do",
			"for k, v in next, t do",
			"for word in string.gmatch(s, '%a+') do",
			"for i = 1, 10 do",
		}, "\n")
		t.equal(Lua51.generalisedIterations(source), {})
	end)
end

return spec
