--!strict

local fs = require("@lune/fs")
local process = require("@lune/process")

local update = table.find(process.args, "--update") ~= nil

type Diagnostic = { file: string, line: number, column: number, text: string }

local function listFiles(dir: string, suffix: string): { string }
	local out = {}
	for _, entry in fs.readDir(dir) do
		if string.sub(entry, -#suffix) == suffix then
			table.insert(out, dir .. "/" .. entry)
		end
	end
	table.sort(out)
	return out
end

local function analyze(file: string): { Diagnostic }
	local result = process.exec("luau-lsp", {
		"analyze",
		"--platform=standard",
		"--flag:LuauSolverV2=true",
		"--base-luaurc=.luaurc",
		"--definitions=@wow=luau_packages/wow-types/wow-forever.d.luau",
		"--settings=.build/library.settings.json",
		"--ignore=luau_packages/**",
		file,
	})
	local output = string.gsub(result.stdout .. "\n" .. result.stderr, "\r", "")
	if not result.ok and result.code ~= 1 then
		print(output)
		error(file .. ": luau-lsp exited with code " .. result.code, 0)
	end
	local diagnostics: { Diagnostic } = {}
	local current: Diagnostic? = nil
	for line in string.gmatch(output, "[^\n]+") do
		local path, lineNo, column, text = string.match(line, "^(.-)%((%d+),(%d+)%): (.*)$")
		if path and lineNo and column and text then
			local entry: Diagnostic = {
				file = (string.gsub(path, "\\", "/")),
				line = tonumber(lineNo) :: number,
				column = tonumber(column) :: number,
				text = text,
			}
			current = entry
			table.insert(diagnostics, entry)
		elseif current and not string.match(line, "^%[") then
			current.text ..= "\n" .. line
		end
	end
	table.sort(diagnostics, function(a: Diagnostic, b: Diagnostic): boolean
		if a.file ~= b.file then
			return a.file < b.file
		elseif a.line ~= b.line then
			return a.line < b.line
		elseif a.column ~= b.column then
			return a.column < b.column
		end
		return a.text < b.text
	end)
	return diagnostics
end

local failures = 0
local function fail(message: string)
	failures += 1
	print("FAIL " .. message)
end

for _, file in listFiles("tests/pass", ".luau") do
	local diagnostics = analyze(file)
	for _, d in diagnostics do
		fail(string.format("%s:%d:%d: unexpected diagnostic: %s", d.file, d.line, d.column, d.text))
	end
	print(string.format("%s %s", if #diagnostics == 0 then "ok  " else "FAIL", file))
end

for _, file in listFiles("tests/fail", ".luau") do
	local diagnostics = analyze(file)
	local lines = {}
	for _, d in diagnostics do
		if d.file ~= file then
			fail(string.format("%s: a diagnostic in the library: %s:%d: %s", file, d.file, d.line, d.text))
		end
		table.insert(lines, string.format("%d:%d: %s", d.line, d.column, d.text))
	end
	local actual = table.concat(lines, "\n") .. "\n"
	local expectedPath = string.gsub(file, "%.luau$", ".expected")
	local ok = true
	if update then
		fs.writeFile(expectedPath, actual)
	else
		local expected = if fs.isFile(expectedPath) then string.gsub(fs.readFile(expectedPath), "\r\n", "\n") else nil
		if expected ~= actual then
			ok = false
			fail(file .. ": diagnostics differ from " .. expectedPath .. ". Actual:\n" .. actual)
		end
	end
	local sourceLines = string.split(string.gsub(fs.readFile(file), "\r", ""), "\n")
	local byLine: { [number]: { string } } = {}
	for _, d in diagnostics do
		byLine[d.line] = byLine[d.line] or {}
		table.insert(byLine[d.line], d.text)
	end
	local marked = 0
	for lineNo, line in sourceLines do
		local phrase = string.match(line, "%-%- expect%-error: (.-)%s*$")
		if phrase then
			marked += 1
			local found = false
			for _, text in byLine[lineNo] or {} do
				if string.find(text, phrase, 1, true) then
					found = true
				end
			end
			if not found then
				ok = false
				fail(string.format("%s:%d: expected an error containing %q", file, lineNo, phrase))
			end
		end
	end
	for lineNo in byLine do
		if not string.find(sourceLines[lineNo] or "", "expect-error:", 1, true) then
			ok = false
			fail(string.format("%s:%d: a diagnostic on a line not marked expect-error", file, lineNo))
		end
	end
	print(
		string.format(
			"%s %s (%d diagnostics, %d marked lines)",
			if ok then "ok  " else "FAIL",
			file,
			#diagnostics,
			marked
		)
	)
end

if failures > 0 then
	print(failures .. " failure(s)")
	process.exit(1)
end
