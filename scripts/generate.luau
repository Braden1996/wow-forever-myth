--!strict
local fs = require("@lune/fs")
local process = require("@lune/process")

local Callbacks = require("../overrides/Callbacks")
local Loads = require("../overrides/Loads")
local Plan = require("../generator/Plan")
local Render = require("../generator/Render")
local Results = require("../overrides/Results")
local ShapeFile = require("../generator/ShapeFile")
local Validate = require("../generator/Validate")

local SHAPES = "luau_packages/wow-types/api-shapes.json"
local TARGET = "packages/forever-myth/src"
local SCRATCH = ".build/generated"
local FOLDERS: { Plan.Folder } = { "Api", "Widgets" }
local INDEX: { [Plan.Folder]: string } = { Api = "ApiIndex.luau", Widgets = "WidgetIndex.luau" }
local check = table.find(process.args, "--check") ~= nil

local function fail(message: string): never
	print("FAIL " .. message)
	process.exit(1)
	error(message, 0)
end

local function run(program: string, args: { string })
	local result = process.exec(program, args, { stdin = "" })
	if not result.ok then
		fail(program .. " " .. table.concat(args, " ") .. ":\n" .. result.stdout .. result.stderr)
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
	for _, entry in fs.readDir(dir) do
		out[entry] = normalised(dir .. "/" .. entry)
	end
	return out
end

local function write(root: string, plan: Plan.Plan)
	local byFolder: { [string]: { Plan.Module } } = { Api = {}, Widgets = {} }
	for _, module in plan.modules do
		table.insert(byFolder[module.folder], module)
	end
	for _, folder in FOLDERS do
		local dir = root .. "/" .. folder
		resetDir(dir)
		for _, module in byFolder[folder] do
			fs.writeFile(dir .. "/" .. module.name .. ".luau", Render.module(module))
		end
		fs.writeFile(root .. "/" .. INDEX[folder], Render.index(folder, byFolder[folder]))
	end
	run("stylua", { root .. "/Api", root .. "/Widgets", root .. "/" .. INDEX.Api, root .. "/" .. INDEX.Widgets })
end

local function compare(): { string }
	local stale: { string } = {}
	for _, folder in FOLDERS do
		local fresh = filesIn(SCRATCH .. "/" .. folder)
		local committed = filesIn(TARGET .. "/" .. folder)
		for name, text in fresh do
			if committed[name] ~= text then
				table.insert(stale, folder .. "/" .. name)
			end
		end
		for name in committed do
			if fresh[name] == nil then
				table.insert(stale, folder .. "/" .. name .. " (no longer generated)")
			end
		end
		local index = INDEX[folder]
		if
			normalised(SCRATCH .. "/" .. index)
			~= (if fs.isFile(TARGET .. "/" .. index) then normalised(TARGET .. "/" .. index) else "")
		then
			table.insert(stale, index)
		end
	end
	table.sort(stale)
	return stale
end

if not fs.isFile(SHAPES) then
	fail(SHAPES .. " is missing: run `moon run generator:fetch`")
end
local shapes = ShapeFile.decode(fs.readFile(SHAPES))
local overrides = { results = Results, loads = Loads, callbacks = Callbacks }
local problems = Validate.overrides(shapes, overrides)
if #problems > 0 then
	fail("overrides/ disagree with api-shapes.json:\n" .. table.concat(problems, "\n"))
end
local plan = Plan.build(shapes, overrides)

if check then
	if not fs.isDir(".build") then
		fs.writeDir(".build")
	end
	resetDir(SCRATCH)
	write(SCRATCH, plan)
	local stale = compare()
	if #stale > 0 then
		fail("generated files are stale; run `moon run generator:generate`:\n" .. table.concat(stale, "\n"))
	end
	print(string.format("ok   %d wrapped APIs in %d modules are up to date", plan.wrapped, #plan.modules))
else
	write(TARGET, plan)
	print(string.format("ok   wrote %d wrapped APIs in %d modules", plan.wrapped, #plan.modules))
end
