--!strict
local fs = require("@lune/fs")
local process = require("@lune/process")

local Plan = require("../../../../packages/libraries/luau/pure/generator/src/Plan")
local Render = require("../../../../packages/libraries/luau/pure/generator/src/Render")
local ShapeFile = require("../../../../packages/libraries/luau/pure/generator/src/ShapeFile")
local Validate = require("../../../../packages/libraries/luau/pure/generator/src/Validate")
local Callbacks = require("../../../../packages/libraries/luau/pure/generator/src/overrides/Callbacks")
local Loads = require("../../../../packages/libraries/luau/pure/generator/src/overrides/Loads")
local Results = require("../../../../packages/libraries/luau/pure/generator/src/overrides/Results")

local SHAPES = "luau_packages/wow-types/api-shapes.json"
local TARGET = "packages/libraries/luau/wow/forever-myth/src"
local SCRATCH = ".build/generation"
local GENERATED = "packages/wrappers/src"
local FOLDERS: { Plan.Folder } = { "Api", "Widgets" }
local INDEX: { [Plan.Folder]: string } = { Api = "ApiIndex.luau", Widgets = "WidgetIndex.luau" }
local check = process.args[1] == "--check"

local function fail(message: string): never
	print("FAIL " .. message)
	process.exit(1)
	error(message, 0)
end

local function formatGenerated()
	local result = process.exec("sgt", { "--no-daemon", "fmt", GENERATED }, { cwd = SCRATCH, stdin = "" })
	if not result.ok then
		fail("formatting generated wrappers:\n" .. result.stdout .. result.stderr)
	end
end

local function resetDir(path: string)
	if fs.isDir(path) then
		fs.removeDir(path)
	end
	fs.writeDir(path)
end

local function normalised(path: string): string
	return (string.gsub(fs.readFile(path), "\r\n", "\n"))
end

local function filesIn(dir: string): { [string]: string }
	local out: { [string]: string } = {}
	if not fs.isDir(dir) then
		return out
	end
	local entries: { string } = fs.readDir(dir)
	for _, entry in ipairs(entries) do
		out[entry] = normalised(dir .. "/" .. entry)
	end
	return out
end

local function write(root: string, plan: Plan.Plan)
	local byFolder: { [string]: { Plan.Module } } = { Api = {}, Widgets = {} }
	for _, module in ipairs(plan.modules) do
		table.insert(byFolder[module.folder], module)
	end
	for _, folder in ipairs(FOLDERS) do
		local dir = root .. "/" .. folder
		resetDir(dir)
		for _, module in ipairs(byFolder[folder]) do
			fs.writeFile(dir .. "/" .. module.name .. ".luau", Render.module(module))
		end
		fs.writeFile(root .. "/" .. INDEX[folder], Render.index(folder, byFolder[folder]))
	end
end

local function compare(): { string }
	local stale: { string } = {}
	for _, folder in ipairs(FOLDERS) do
		local fresh = filesIn(SCRATCH .. "/" .. GENERATED .. "/" .. folder)
		local committed = filesIn(TARGET .. "/" .. folder)
		for name, text in pairs(fresh) do
			if committed[name] ~= text then
				table.insert(stale, folder .. "/" .. name)
			end
		end
		for name in pairs(committed) do
			if fresh[name] == nil then
				table.insert(stale, folder .. "/" .. name .. " (no longer generated)")
			end
		end
		local index = INDEX[folder]
		if
			normalised(SCRATCH .. "/" .. GENERATED .. "/" .. index)
			~= (if fs.isFile(TARGET .. "/" .. index) then normalised(TARGET .. "/" .. index) else "")
		then
			table.insert(stale, index)
		end
	end
	table.sort(stale)
	return stale
end

if not fs.isFile(SHAPES) then
	fail(SHAPES .. " is missing: run `sgt install`")
end
local shapes = ShapeFile.decode(fs.readFile(SHAPES))
local overrides = { results = Results, loads = Loads, callbacks = Callbacks }
local problems = Validate.overrides(shapes, overrides)
if #problems > 0 then
	fail("overrides/ disagree with api-shapes.json:\n" .. table.concat(problems, "\n"))
end
local plan = Plan.build(shapes, overrides)

if not fs.isDir(".build") then
	fs.writeDir(".build")
end
resetDir(SCRATCH)
fs.writeFile(SCRATCH .. "/sergeant.jsonc", [[{"plugins":["luau"],"packages":["packages/*"]}]])
fs.writeFile(SCRATCH .. "/.editorconfig", fs.readFile(".editorconfig"))
local generated = SCRATCH .. "/" .. GENERATED
fs.writeDir(generated)
write(generated, plan)
formatGenerated()

if check then
	local stale = compare()
	if #stale > 0 then
		fail("generated files are stale; run 'sgt run generate':\n" .. table.concat(stale, "\n"))
	end
	print(string.format("ok   %d wrapped APIs in %d modules are up to date", plan.wrapped, #plan.modules))
else
	for _, folder in ipairs(FOLDERS) do
		resetDir(TARGET .. "/" .. folder)
		for name, contents in pairs(filesIn(generated .. "/" .. folder)) do
			fs.writeFile(TARGET .. "/" .. folder .. "/" .. name, contents)
		end
		local index = INDEX[folder]
		fs.writeFile(TARGET .. "/" .. index, normalised(generated .. "/" .. index))
	end
	print(string.format("ok   wrote %d wrapped APIs in %d modules", plan.wrapped, #plan.modules))
end
