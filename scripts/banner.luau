--!strict
local fs = require("@lune/fs")
local process = require("@lune/process")

local Callbacks = require("../overrides/Callbacks")
local Loads = require("../overrides/Loads")
local Plan = require("../generator/Plan")
local Results = require("../overrides/Results")
local ShapeFile = require("../generator/ShapeFile")

local OUTPUT = ".github/banner.svg"
local SHAPES = "luau_packages/wow-types/api-shapes.json"
local MONO = "'JetBrains Mono','Cascadia Code',Consolas,monospace"
local SANS = "'Segoe UI','Inter','Helvetica Neue',Arial,sans-serif"

type Attributes = { [string]: string | number }
type Stat = { value: string, label: string, colour: string }

local function attrs(t: Attributes): string
	local keys = {}
	for key in t do
		table.insert(keys, key)
	end
	table.sort(keys)
	local parts = {}
	for _, key in keys do
		table.insert(parts, string.format('%s="%s"', key, tostring(t[key])))
	end
	return table.concat(parts, " ")
end

local function el(name: string, a: Attributes, body: string?): string
	if body then
		return "<" .. name .. " " .. attrs(a) .. ">" .. body .. "</" .. name .. ">"
	end
	return "<" .. name .. " " .. attrs(a) .. "/>"
end

local function escape(text: string): string
	return (string.gsub(string.gsub(string.gsub(text, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"))
end

local function count<V>(t: { [string]: V }): number
	local n = 0
	for _ in t do
		n += 1
	end
	return n
end

local function grouped(n: number): string
	local text = tostring(n)
	while true do
		local next, replaced = string.gsub(text, "^(%d+)(%d%d%d)", "%1,%2")
		text = next
		if replaced == 0 then
			return text
		end
	end
end

local function protectedCount(file: ShapeFile.ShapeFile): number
	local n = 0
	for _, entries in { file.functions, file.widgetMethods } do
		for _, shape in entries do
			if shape.kind == "protected" then
				n += 1
			end
		end
	end
	return n
end

local function stats(): { Stat }
	local file = ShapeFile.decode(fs.readFile(SHAPES))
	local overrides = { results = Results, loads = Loads, callbacks = Callbacks }
	local plan = Plan.build(file, overrides)
	local reviewed = count(Results) + count(Loads) + count(Callbacks)
	return {
		{ value = grouped(plan.wrapped), label = "APIs wrapped", colour = "#7ee2a8" },
		{ value = grouped(#plan.modules), label = "modules", colour = "#8ab4ff" },
		{ value = grouped(reviewed), label = "reviewed overrides", colour = "#f5c26b" },
		{ value = grouped(protectedCount(file)), label = "protected, never wrapped", colour = "#ff9a8b" },
	}
end

local function svg(): string
	local lines = {
		'<svg xmlns="http://www.w3.org/2000/svg" width="1280" height="360" viewBox="0 0 1280 360" role="img" aria-labelledby="title desc">',
		'  <title id="title">wow-forever-myth</title>',
		'  <desc id="desc">The WoW: Forever API in Maybe, Result and Task idioms, generated for strict Luau</desc>',
		"  <defs>",
		'    <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#0d1117"/><stop offset="1" stop-color="#1f1530"/></linearGradient>',
		"  </defs>",
		"  " .. el("rect", { width = 1280, height = 360, fill = "url(#bg)" }),
		"  " .. el("text", {
			x = 80,
			y = 120,
			fill = "#ffffff",
			["font-family"] = SANS,
			["font-size"] = 64,
			["font-weight"] = 700,
		}, "wow-forever-myth"),
		"  " .. el(
			"text",
			{ x = 80, y = 165, fill = "#a8b3cf", ["font-family"] = SANS, ["font-size"] = 24 },
			"The WoW: Forever API as Maybe, Result and Task, generated from its documentation"
		),
		"  " .. el(
			"text",
			{ x = 80, y = 220, fill = "#d2dcf5", ["font-family"] = MONO, ["font-size"] = 22 },
			escape("Api.C_Item.GetItemInfoAsync(itemID) : Task<GetItemInfoResults, LoadFailed>")
		),
	}
	for i, stat in stats() do
		local x = 80 + (i - 1) * 290
		table.insert(lines, "  " .. el("text", {
			x = x,
			y = 300,
			fill = stat.colour,
			["font-family"] = SANS,
			["font-size"] = 40,
			["font-weight"] = 700,
		}, stat.value))
		table.insert(
			lines,
			"  "
				.. el(
					"text",
					{ x = x, y = 330, fill = "#a8b3cf", ["font-family"] = SANS, ["font-size"] = 18 },
					stat.label
				)
		)
	end
	table.insert(lines, "</svg>")
	return table.concat(lines, "\n") .. "\n"
end

local text = svg()
if table.find(process.args, "--check") then
	local committed = if fs.isFile(OUTPUT) then string.gsub(fs.readFile(OUTPUT), "\r\n", "\n") else ""
	if committed ~= text then
		print("FAIL " .. OUTPUT .. " is stale: run `lune run scripts/banner` and commit it")
		process.exit(1)
	end
	print("ok   " .. OUTPUT .. " matches the generated wrappers")
else
	fs.writeFile(OUTPUT, text)
	print("ok   wrote " .. OUTPUT)
end
