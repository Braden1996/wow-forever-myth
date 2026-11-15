--!strict
local fs = require("@lune/fs")
local net = require("@lune/net")
local process = require("@lune/process")
local serde = require("@lune/serde")

local Derived = require("./Derived")

type Dependency = { repository: string, tag: string, unzip: string?, assets: { [string]: string } }

local ROOT = ".deps"

local function uncheckedDependencies(decoded: unknown): { [string]: Dependency }
	return decoded :: any
end

local function sortedKeys<V>(t: { [string]: V }): { string }
	local keys = {}
	for key in t do
		table.insert(keys, key)
	end
	table.sort(keys)
	return keys
end

local function ensureDir(path: string)
	if not fs.isDir(path) then
		fs.writeDir(path)
	end
end

local function sha256(contents: string): string
	return serde.hash("sha256", contents)
end

local function isCurrent(path: string, expected: string): boolean
	return fs.isFile(path) and sha256(fs.readFile(path)) == expected
end

local function download(dependency: Dependency, asset: string): string
	local url = "https://github.com/"
		.. dependency.repository
		.. "/releases/download/"
		.. dependency.tag
		.. "/"
		.. asset
	local response = net.request({ url = url, method = "GET" })
	if not response.ok then
		error(url .. ": HTTP " .. response.statusCode, 0)
	end
	return response.body
end

local function run(program: string, args: { string })
	local result = process.exec(program, args, { stdin = "" })
	if not result.ok then
		error(program .. " " .. table.concat(args, " ") .. " failed:\n" .. result.stdout .. result.stderr, 0)
	end
end

local function extract(archive: string, into: string)
	local scratch = into .. ".unzip"
	if fs.isDir(scratch) then
		fs.removeDir(scratch)
	end
	fs.writeDir(scratch)
	if process.os == "windows" then
		run("tar", { "-xf", archive, "-C", scratch })
	else
		run("unzip", { "-q", archive, "-d", scratch })
	end
	local top = fs.readDir(scratch)
	if #top ~= 1 then
		error(archive .. ": expected one top-level folder", 0)
	end
	for _, entry in fs.readDir(scratch .. "/" .. top[1]) do
		local target = into .. "/" .. entry
		if fs.isDir(target) then
			fs.removeDir(target)
		elseif fs.isFile(target) then
			fs.removeFile(target)
		end
		fs.move(scratch .. "/" .. top[1] .. "/" .. entry, target)
	end
	fs.removeDir(scratch)
end

local function fetchAsset(name: string, dependency: Dependency, asset: string): boolean
	local path = ROOT .. "/" .. name .. "/" .. asset
	local expected = dependency.assets[asset]
	if isCurrent(path, expected) then
		return false
	end
	local body = download(dependency, asset)
	local actual = sha256(body)
	if actual ~= expected then
		error(
			name .. " " .. dependency.tag .. " " .. asset .. ": SHA-256 " .. actual .. ", deps.toml pins " .. expected,
			0
		)
	end
	fs.writeFile(path, body)
	print("fetched " .. name .. " " .. dependency.tag .. " " .. asset)
	return true
end

local function fetch(name: string, dependency: Dependency)
	local folder = ROOT .. "/" .. name
	ensureDir(folder)
	for _, asset in sortedKeys(dependency.assets) do
		local changed = fetchAsset(name, dependency, asset)
		local archive = dependency.unzip
		if asset == archive and (changed or not fs.isDir(folder .. "/src")) then
			extract(folder .. "/" .. asset, folder)
		end
	end
end

ensureDir(ROOT)
local dependencies = uncheckedDependencies(serde.decode("toml", fs.readFile("deps.toml")))
for _, name in sortedKeys(dependencies) do
	fetch(name, dependencies[name])
end
Derived.writeAll()
print("ok   .deps/ matches deps.toml; derived " .. Derived.LIBRARY_SETTINGS .. " and " .. Derived.SELENE_STD)
