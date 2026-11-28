--!strict
local fs = require("@lune/fs")
local process = require("@lune/process")

local Bundle = require("./Bundle")

local buildDir = assert(process.args[1], "expected the Sergeant WoW bundle output directory")
fs.writeFile(Bundle.output, Bundle.read(buildDir))
print("ok   wrote " .. Bundle.output)
