--!strict
local fs = require("@lune/fs")
local luau = require("@lune/luau")
local process = require("@lune/process")

local Callbacks = require("../../../../packages/libraries/luau/pure/generator/src/overrides/Callbacks")
local Loads = require("../../../../packages/libraries/luau/pure/generator/src/overrides/Loads")
local Results = require("../../../../packages/libraries/luau/pure/generator/src/overrides/Results")
local Bundle = require("./Bundle")
local Harness = require("./support/Harness")
local Lib = require("./support/Lib")
local World = require("./support/World")

local BUNDLE = Bundle.output
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
	local entries: { string } = fs.readDir(SPECS)
	for _, entry in ipairs(entries) do
		if string.match(entry, "%.spec%.luau$") then
			table.insert(out, entry)
		end
	end
	table.sort(out)
	return out
end

local function overrideKeys(): { string }
	local keys = {}
	for _, source in ipairs({ Results, Loads, Callbacks } :: { { [string]: unknown } }) do
		for key in pairs(source) do
			table.insert(keys, key)
		end
	end
	table.sort(keys)
	return keys
end

local function untestedOverrides(names: { string }): { string }
	local missing = {}
	for _, key in pairs(overrideKeys()) do
		local prefix = key .. ":"
		local found = false
		for _, name in ipairs(names) do
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
	print("FAIL " .. BUNDLE .. " is missing: run `sgt run bundle`")
	process.exit(1)
end

local buildDir = assert(process.args[1], "expected the Sergeant WoW bundle output directory")
local committed = string.gsub(fs.readFile(BUNDLE), "\r\n", "\n")
if committed ~= Bundle.read(buildDir) then
	error(BUNDLE .. " is stale: run sgt run bundle and commit the result", 0)
end

local report = Harness.newReport()
for _, file in pairs(specFiles()) do
	local world = World.new()
	local lib = loadBundle(world)
	local spec = uncheckedSpec(uncheckedRequire("../../../../tests/spec/" .. string.gsub(file, "%.luau$", "")))
	local before = report.passed + #report.failed
	spec(lib, Harness.context(report, file), world)
	print(string.format("ran  %-24s %d tests", file, report.passed + #report.failed - before))
end

for _, key in pairs(untestedOverrides(report.names)) do
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
	for i, failure in ipairs(report.failed) do
		if i > 40 then
			print("... and " .. (#report.failed - 40) .. " more")
			break
		end
		print("FAIL " .. failure)
	end
	process.exit(1)
end
