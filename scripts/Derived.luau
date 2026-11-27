--!strict
local fs = require("@lune/fs")
local serde = require("@lune/serde")

local TYPES = "luau_packages/wow-types"
local DISABLED = "luau-lsp.types.disabledGlobals"
local BUNDLED_AWAY = { require = true }

local Derived = {}

Derived.LIBRARY_SETTINGS = ".build/library.settings.json"
Derived.SELENE_STD_YML = "wow-forever.yml"
Derived.SELENE_STD_TOML = "wow-forever-sgt.toml"

local function uncheckedSettings(decoded: unknown): { [string]: { string } }
	return decoded :: any
end

function Derived.librarySettings(): string
	local settings = uncheckedSettings(serde.decode("json", fs.readFile(TYPES .. "/luau-lsp.settings.json")))
	local kept: { string } = {}
	for _, name in settings[DISABLED] or {} do
		if not BUNDLED_AWAY[name] then
			table.insert(kept, name)
		end
	end
	return serde.encode("json", { [DISABLED] = kept }, true)
end

function Derived.declaredGlobals(): { string }
	local names: { [string]: boolean } = {}
	for line in string.gmatch(fs.readFile(TYPES .. "/wow-forever.d.luau"), "[^\n]+") do
		local name = string.match(line, "^declare function ([%a_][%w_]*)")
			or string.match(line, "^declare ([%a_][%w_]*):")
		if name then
			names[name] = true
		end
	end
	local sorted = {}
	for name in names do
		table.insert(sorted, name)
	end
	table.sort(sorted)
	return sorted
end

function Derived.seleneStdYaml(): string
	local lines = { "globals:" }
	for _, name in Derived.declaredGlobals() do
		table.insert(lines, "  " .. name .. ":")
		table.insert(lines, "    any: true")
	end
	return table.concat(lines, "\n") .. "\n"
end

function Derived.seleneStdToml(): string
	local lines = { "[globals]" }
	for _, name in Derived.declaredGlobals() do
		table.insert(lines, name .. " = { any = true }")
	end
	return table.concat(lines, "\n") .. "\n"
end

function Derived.writeAll()
	if not fs.isDir(".build") then
		fs.writeDir(".build")
	end
	fs.writeFile(Derived.LIBRARY_SETTINGS, Derived.librarySettings())
	fs.writeFile(Derived.SELENE_STD_YML, Derived.seleneStdYaml())
	fs.writeFile(Derived.SELENE_STD_TOML, Derived.seleneStdToml())
end

return Derived
