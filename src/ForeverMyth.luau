--!strict
local Api = require("./ApiIndex")
local Loads = require("./Runtime/Loads")
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")
local Task = require("@truemyth/Task")
local Widgets = require("./WidgetIndex")

export type LoadFailed = Loads.LoadFailed
export type Maybe<T> = Maybe.Maybe<T>
export type Result<T, E> = Result.Result<T, E>
export type Task<T, E> = Task.Task<T, E>

return {
	version = "0.1.0",
	Api = Api,
	Widgets = Widgets,
	Maybe = Maybe,
	Result = Result,
	Task = Task,
}
