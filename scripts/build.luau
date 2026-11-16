--!strict
local fs = require("@lune/fs")
local process = require("@lune/process")

local Lua51 = require("./Lua51")

local ENTRY = "src/ForeverMyth.luau"

local OUTPUT = "dist/ForeverMyth.lua"
local SCRATCH = ".build"
local NOTICES = { "LICENSE", ".deps/luau-true-myth/LICENSE" }
local check = table.find(process.args, "--check") ~= nil

local function run(program: string, args: { string }, stdin: string?): string
	local result = process.exec(program, args, { stdin = stdin })
	if not result.ok then
		print(result.stdout .. result.stderr)
		error(program .. " " .. table.concat(args, " ") .. " failed", 0)
	end
	return result.stdout
end

local function commented(path: string): { string }
	local lines = {}
	for line in string.gmatch(string.gsub(fs.readFile(path), "\r\n", "\n"), "([^\n]*)\n") do
		table.insert(lines, if line == "" then "--" else "-- " .. line)
	end
	return lines
end

local function version(): string
	local found = string.match(fs.readFile(ENTRY), 'version = "([^"]+)"')
	if found == nil then
		error(ENTRY .. " has no version", 0)
	end
	return found
end

local function header(): string
	local lines = {
		"-- wow-forever-myth " .. version() .. ": the WoW: Forever API in Maybe, Result and Task idioms (Lua 5.1).",
		"-- https://github.com/Braden1996/wow-forever-myth - generated from the Luau sources by darklua; do not edit.",
		"-- Listed in a .toc it stores the library as `ns.ForeverMyth`; loaded any other way it returns it.",
		"-- It bundles luau-true-myth (https://github.com/Braden1996/luau-true-myth).",
	}
	for _, path in NOTICES do
		table.insert(lines, "--")
		for _, line in commented(path) do
			table.insert(lines, line)
		end
	end
	return table.concat(lines, "\n") .. "\n\n"
end

local function ensureDir(path: string)
	if not fs.isDir(path) then
		fs.writeDir(path)
	end
end

local function writeSeleneConfig(): string
	fs.writeFile(SCRATCH .. "/selene.toml", 'std = "lua51+wow-forever"\n\n[lints]\nunused_variable = "allow"\n')
	return SCRATCH .. "/selene.toml"
end

ensureDir(SCRATCH)
local raw = SCRATCH .. "/ForeverMyth.raw.lua"
run("darklua", { "process", "--config", ".darklua.json", "wow/ForeverMyth.luau", raw })
local bundle = header() .. string.gsub(fs.readFile(raw), "\r\n", "\n")
local built = SCRATCH .. "/ForeverMyth.lua"
fs.writeFile(built, bundle)

run("stylua", { "--syntax", "Lua51", "--check", "-" }, bundle)
local iterations = Lua51.generalisedIterations(bundle)
if #iterations > 0 then
	error(
		"the bundle uses generalised iteration, which Lua 5.1 lacks, on line(s) " .. table.concat(iterations, ", "),
		0
	)
end
run("selene", { "--config", writeSeleneConfig(), "--display-style", "quiet", built })

if check then
	local committed = if fs.isFile(OUTPUT) then string.gsub(fs.readFile(OUTPUT), "\r\n", "\n") else ""
	if committed ~= bundle then
		print("FAIL " .. OUTPUT .. " is stale: run `moon run lib:build` and commit the result")
		process.exit(1)
	end
	print("ok   " .. OUTPUT .. " is up to date, valid Lua 5.1, with only Lua 5.1 iteration and globals")
else
	ensureDir("dist")
	fs.writeFile(OUTPUT, bundle)
	print(string.format("ok   wrote %s (%d KiB, valid Lua 5.1, only Lua 5.1 globals)", OUTPUT, #bundle // 1024))
end
