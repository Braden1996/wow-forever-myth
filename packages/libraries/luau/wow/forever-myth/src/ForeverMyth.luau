--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")
local Task = require("@truemyth/Task")

local Api = require("./ApiIndex")
local Combat = require("./Runtime/Combat")
local Events = require("./Runtime/Events")
local Loads = require("./Runtime/Loads")
local Timing = require("./Runtime/Timing")
local Widgets = require("./WidgetIndex")

export type LoadFailed = Loads.LoadFailed
export type Maybe<T> = Maybe.Maybe<T>
export type Result<T, E> = Result.Result<T, E>
export type Task<T, E> = Task.Task<T, E>
export type EventReader<E, T> = Events.Reader<E, T>

return {
	version = "0.6.0",
	Api = Api,
	Widgets = Widgets,
	Combat = Combat,
	Events = Events,
	Timing = Timing,
	Maybe = Maybe,
	Result = Result,
	Task = Task,
}
