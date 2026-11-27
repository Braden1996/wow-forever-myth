--!strict
export type Handler = (...any) -> ()
export type Unsubscribe = () -> ()

type Subscription = { handler: Handler, active: boolean }

local Listener = {}

local subscriptionsByEvent: { [string]: { Subscription } } = {}
local listener: Frame? = nil

local function dispatch(event: string, ...: any)
	local subscriptions = subscriptionsByEvent[event]
	if subscriptions == nil then
		return
	end
	local count = #subscriptions
	local snapshot: { Subscription } = {}
	for index = 1, count do
		snapshot[index] = subscriptions[index]
	end
	for index = 1, count do
		local subscription = snapshot[index]
		if subscription.active then
			subscription.handler(...)
		end
	end
end

local function ensureListener(): Frame
	local existing = listener
	if existing then
		return existing
	end
	local frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", function(_self: Frame, event: unknown, ...: any)
		if type(event) == "string" then
			dispatch(event, ...)
		end
	end)
	listener = frame
	return frame
end

local function remove(event: FrameEvent, subscription: Subscription)
	subscription.active = false
	local subscriptions = subscriptionsByEvent[event]
	if subscriptions == nil then
		return
	end
	for index, candidate in ipairs(subscriptions) do
		if candidate == subscription then
			table.remove(subscriptions, index)
			break
		end
	end
	if #subscriptions == 0 then
		subscriptionsByEvent[event] = nil
		ensureListener():UnregisterEvent(event)
	end
end

function Listener.subscribe(event: FrameEvent, handler: Handler): Unsubscribe
	local subscriptions = subscriptionsByEvent[event]
	if subscriptions == nil then
		subscriptions = {}
		subscriptionsByEvent[event] = subscriptions
		ensureListener():RegisterEvent(event)
	end
	local subscription: Subscription = { handler = handler, active = true }
	table.insert(subscriptions, subscription)
	return function()
		if subscription.active then
			remove(event, subscription)
		end
	end
end

return Listener
