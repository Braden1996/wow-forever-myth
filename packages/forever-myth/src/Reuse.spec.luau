--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("./Runtime/Reuse")

return {
	{
		name = "Reuse.maybe returns Nothing when value is nil",
		run = function()
			local result = Reuse.maybe(Maybe.nothing(), nil :: number?)
			if Maybe.isJust(result) then
				error("expected Nothing for nil value")
			end
		end,
	},
	{
		name = "Reuse.maybe reuses an owned Just cell without replacing an unowned Just",
		run = function()
			local external = Maybe.just(1)
			local owned = Reuse.maybe(external, 2)
			if rawequal(owned, external) then
				error("must not mutate an unowned Maybe.just cell")
			end
			if Maybe.unwrapOr(owned, 0) ~= 2 then
				error("expected owned cell to hold 2")
			end
			local reused = Reuse.maybe(owned, 3)
			if not rawequal(reused, owned) then
				error("expected owned cell to be reused in place")
			end
			if Maybe.unwrapOr(reused, 0) ~= 3 then
				error("expected reused cell to hold 3")
			end
		end,
	},
	{
		name = "Reuse.just caches a single Just cell per record identity",
		run = function()
			local record = { name = "Thrall" }
			local first = Reuse.just(record)
			local second = Reuse.just(record)
			if not rawequal(first, second) then
				error("expected Reuse.just to return the same Just cell for a record")
			end
			local unwrapped = Maybe.unwrapOr(first, { name = "" })
			if not rawequal(unwrapped, record) then
				error("expected Reuse.just cell to wrap the record")
			end
		end,
	},
	{
		name = "Reuse.fields exposes a record for field mutation",
		run = function()
			local record = { count = 1 }
			local fields = Reuse.fields(record)
			fields.count = 42
			if record.count ~= 42 then
				error("expected Reuse.fields to alias the same table")
			end
		end,
	},
}
