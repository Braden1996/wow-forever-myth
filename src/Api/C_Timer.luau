--!strict
local Task = require("@truemyth/Task")

type Task<T, E> = Task.Task<T, E>

local Wrappers = {}

function Wrappers.AfterAsync(seconds: number): Task<nil, never>
	local deferred = Task.withResolvers() :: Task.Deferred<nil, never>
	C_Timer.After(seconds, function()
		deferred.resolve(nil)
	end)
	return deferred.task
end

return Wrappers
