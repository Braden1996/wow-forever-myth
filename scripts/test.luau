--!strict
local fs = require("@lune/fs")
local luau = require("@lune/luau")
local process = require("@lune/process")

local Callbacks = require("../overrides/Callbacks")
local Harness = require("../tests/support/Harness")
local Lib = require("../tests/support/Lib")
local Loads = require("../overrides/Loads")
local Results = require("../overrides/Results")
local World = require("../tests/support/World")

local BUNDLE = "dist/ForeverMyth.lua"
local SPECS = "tests/spec"

local function uncheckedLib(value: unknown): Lib.Lib
	return value :: any
end

local function uncheckedRequire(path: string): unknown
	return (require :: any)(path)
end

local function uncheckedSpec(value: unknown): Lib.Spec
	return value :: any
end

local function loadBundle(world: World.World): Lib.Lib
	local chunk = luau.load(fs.readFile(BUNDLE), { debugName = BUNDLE, environment = world.env, injectGlobals = false })
	local namespace: { [string]: unknown } = {}
	local returned = chunk("MyAddon", namespace)
	if namespace.ForeverMyth ~= returned then
		error(BUNDLE .. ": the addon namespace did not receive the library", 0)
	end
	return uncheckedLib(returned)
end

local function specFiles(): { string }
	local out = {}
	for _, entry in fs.readDir(SPECS) do
		if string.match(entry, "%.spec%.luau$") then
			table.insert(out, entry)
		end
	end
	table.sort(out)
	return out
end

local function overrideKeys(): { string }
	local keys = {}
	for _, source in { Results, Loads, Callbacks } :: { { [string]: unknown } } do
		for key in source do
			table.insert(keys, key)
		end
	end
	table.sort(keys)
	return keys
end

local function untestedOverrides(names: { string }): { string }
	local missing = {}
	for _, key in overrideKeys() do
		local prefix = key .. ":"
		local found = false
		for _, name in names do
			if string.sub(name, 1, #prefix) == prefix then
				found = true
				break
			end
		end
		if not found then
			table.insert(missing, key)
		end
	end
	return missing
end

if not fs.isFile(BUNDLE) then
	print("FAIL " .. BUNDLE .. " is missing: run `moon run lib:build`")
	process.exit(1)
end

local report = Harness.newReport()
for _, file in specFiles() do
	local world = World.new()
	local lib = loadBundle(world)
	local spec = uncheckedSpec(uncheckedRequire("../tests/spec/" .. string.gsub(file, "%.luau$", "")))
	local before = report.passed + #report.failed
	spec(lib, Harness.context(report, file), world)
	print(string.format("ran  %-24s %d tests", file, report.passed + #report.failed - before))
end

for _, key in untestedOverrides(report.names) do
	table.insert(report.failed, "no passing test for the override " .. key)
end

print(
	string.format(
		"%s %d passed, %d failed",
		if #report.failed == 0 then "ok  " else "FAIL",
		report.passed,
		#report.failed
	)
)
if #report.failed > 0 then
	for i, failure in report.failed do
		if i > 40 then
			print("... and " .. (#report.failed - 40) .. " more")
			break
		end
		print("FAIL " .. failure)
	end
	process.exit(1)
end
