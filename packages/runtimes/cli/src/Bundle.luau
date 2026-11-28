--!strict
local fs = require("@lune/fs")

local Bundle = {}

local ENTRY = "packages/libraries/luau/wow/forever-myth/src/ForeverMyth.luau"

local NOTICES = { "LICENSE", "luau_packages/truemyth/LICENSE" }

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
		"-- https://github.com/Braden1996/wow-forever-myth - generated from the Luau sources by Sergeant; do not edit.",
		"-- Listed in a .toc it stores the library as `ns.ForeverMyth`; loaded any other way it returns it.",
		"-- It bundles luau-true-myth (https://github.com/Braden1996/luau-true-myth).",
	}
	for _, path in ipairs(NOTICES) do
		table.insert(lines, "--")
		for _, line in pairs(commented(path)) do
			table.insert(lines, line)
		end
	end
	return table.concat(lines, "\n") .. "\n\n"
end

Bundle.output = "dist/ForeverMyth.lua"

function Bundle.read(buildDir: string): string
	return header() .. string.gsub(fs.readFile(buildDir .. "/main.lua"), "\r\n", "\n")
end

return Bundle
