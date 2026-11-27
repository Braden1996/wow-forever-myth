--!strict
local Listener = require("./Listener")
local Task = require("@truemyth/Task")

type Task<T, E> = Task.Task<T, E>

local Combat = {}

local function uncheckedDeferred(deferred: unknown): Task.Deferred<nil, never>
	return deferred :: any
end

function Combat.outOfCombat(): Task<nil, never>
	if not InCombatLockdown() then
		return Task.resolve(nil)
	end
	local deferred = uncheckedDeferred(Task.withResolvers())
	local unsubscribe: Listener.Unsubscribe
	unsubscribe = Listener.subscribe("PLAYER_REGEN_ENABLED", function()
		unsubscribe()
		deferred.resolve(nil)
	end)
	return deferred.task
end

function Combat.run<T>(work: () -> T): Task<T, never>
	return Task.map(Combat.outOfCombat(), function(_: nil): T
		return work()
	end)
end

return Combat
