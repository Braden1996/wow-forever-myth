--!strict
local fs = require("@lune/fs")
local process = require("@lune/process")

local ROOTS = { "src", "wow", "generator", "overrides", "scripts", "tests" }
local EXPECT_ERROR = "^%-%- expect%-error: "
local CAST_TO_ANY = ":: " .. "any"

type Problem = { file: string, line: number, message: string }

local function luauFiles(dir: string, out: { string })
	for _, entry in fs.readDir(dir) do
		local path = dir .. "/" .. entry
		if fs.isDir(path) then
			luauFiles(path, out)
		elseif string.match(entry, "%.luau$") then
			table.insert(out, path)
		end
	end
end

local function commentStart(line: string): number?
	local quote: string? = nil
	local i = 1
	while i <= #line do
		local c = string.sub(line, i, i)
		if quote then
			if c == "\\" then
				i += 1
			elseif c == quote then
				quote = nil
			end
		elseif c == '"' or c == "'" or c == "`" then
			quote = c
		elseif string.sub(line, i, i + 1) == "--" then
			return i
		end
		i += 1
	end
	return nil
end

local function allowedComment(file: string, lineNo: number, comment: string): boolean
	if lineNo == 1 and comment == "--!strict" then
		return true
	end
	return string.match(file, "^tests/fail/") ~= nil and string.match(comment, EXPECT_ERROR) ~= nil
end

local function enclosingFunction(lines: { string }, lineNo: number): string?
	local indent = #(string.match(lines[lineNo], "^%s*") or "")
	for i = lineNo - 1, 1, -1 do
		local line = lines[i]
		local own = #(string.match(line, "^%s*") or "")
		local name = string.match(line, "function%s+([%w_.:]+)%s*[<(]")
		if own < indent and name then
			return name
		end
		if own < indent and string.find(line, "function", 1, true) then
			indent = own
		end
	end
	return nil
end

local function isUncheckedName(name: string?): boolean
	if name == nil then
		return false
	end
	local short = string.match(name, "([%w_]+)$") or ""
	return string.sub(short, 1, 9) == "unchecked"
end

local function lintFile(file: string, problems: { Problem })
	local text = string.gsub(fs.readFile(file), "\r", "")
	local lines = string.split(text, "\n")
	if lines[1] ~= "--!strict" then
		table.insert(problems, { file = file, line = 1, message = "the first line must be --!strict" })
	end
	for lineNo, line in lines do
		local at = commentStart(line)
		if at then
			local comment = string.sub(line, at)
			if not allowedComment(file, lineNo, comment) then
				table.insert(problems, { file = file, line = lineNo, message = "a comment; use a descriptive name" })
			end
		end
		if string.find(line, CAST_TO_ANY, 1, true) then
			local name = enclosingFunction(lines, lineNo)
			if not isUncheckedName(name) then
				table.insert(problems, {
					file = file,
					line = lineNo,
					message = "a cast to any outside a function named unchecked...",
				})
			end
		end
	end
end

local files: { string } = {}
for _, root in ROOTS do
	luauFiles(root, files)
end
table.sort(files)
local problems: { Problem } = {}
for _, file in files do
	lintFile(file, problems)
end
for _, p in problems do
	print(string.format("FAIL %s:%d: %s", p.file, p.line, p.message))
end
if #problems > 0 then
	process.exit(1)
end
print(string.format("ok   %d Luau files: --!strict, no comments, casts to any only in unchecked functions", #files))
