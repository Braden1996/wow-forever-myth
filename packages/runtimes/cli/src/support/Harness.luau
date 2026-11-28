--!strict
local Harness = {}

export type T = {
	test: (name: string, body: () -> ()) -> (),
	equal: (actual: unknown, expected: unknown, label: string?) -> (),
	same: (actual: unknown, expected: unknown, label: string?) -> (),
	truthy: (value: unknown, label: string?) -> (),
}

export type Report = { passed: number, failed: { string }, names: { string } }

local function uncheckedTable(value: unknown): { [any]: any }
	return value :: any
end

local function render(value: unknown, depth: number?): string
	local level = depth or 0
	if type(value) == "string" then
		return string.format("%q", value)
	elseif type(value) ~= "table" or level > 3 then
		return tostring(value)
	end
	local t = uncheckedTable(value)
	local keys = {}
	for key in pairs(t) do
		table.insert(keys, key)
	end
	table.sort(keys, function(a: unknown, b: unknown): boolean
		return tostring(a) < tostring(b)
	end)
	local parts = {}
	for _, key in ipairs(keys) do
		table.insert(parts, tostring(key) .. " = " .. render(t[key], level + 1))
	end
	return "{ " .. table.concat(parts, ", ") .. " }"
end

local function deepEqual(a: unknown, b: unknown): boolean
	if a == b then
		return true
	end
	if type(a) ~= "table" or type(b) ~= "table" then
		return false
	end
	local ta, tb = uncheckedTable(a), uncheckedTable(b)
	for key, value in pairs(ta) do
		if not deepEqual(value, tb[key]) then
			return false
		end
	end
	for key in pairs(tb) do
		if ta[key] == nil then
			return false
		end
	end
	return true
end

local function fail(label: string?, message: string): never
	error((if label then label .. ": " else "") .. message, 0)
end

function Harness.newReport(): Report
	return { passed = 0, failed = {}, names = {} }
end

function Harness.context(report: Report, prefix: string): T
	return {
		test = function(name: string, body: () -> ())
			local ok, raised = pcall(body)
			if ok then
				report.passed += 1
				table.insert(report.names, name)
			else
				table.insert(report.failed, prefix .. " > " .. name .. ": " .. tostring(raised))
			end
		end,
		equal = function(actual: unknown, expected: unknown, label: string?)
			if not deepEqual(actual, expected) then
				fail(label, "expected " .. render(expected) .. ", got " .. render(actual))
			end
		end,
		same = function(actual: unknown, expected: unknown, label: string?)
			if not rawequal(actual, expected) then
				fail(label, "expected the same value as " .. render(expected) .. ", got " .. render(actual))
			end
		end,
		truthy = function(value: unknown, label: string?)
			if not value then
				fail(label, "expected a truthy value, got " .. render(value))
			end
		end,
	}
end

return Harness
