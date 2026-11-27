--!strict
local Derived = require("./Derived")

Derived.writeAll()
print(
	"ok   derived " .. Derived.LIBRARY_SETTINGS .. ", " .. Derived.SELENE_STD_YML .. " and " .. Derived.SELENE_STD_TOML
)
