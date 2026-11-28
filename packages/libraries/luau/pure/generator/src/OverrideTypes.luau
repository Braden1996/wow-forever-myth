--!strict
export type ResultOverride = { error: string, fallback: string?, why: string }
export type LoadOverride = { event: string, request: string, key: string?, why: string }
export type CallbackOverride = { callback: string, resolves: string, why: string }

export type Overrides = {
	results: { [string]: ResultOverride },
	loads: { [string]: LoadOverride },
	callbacks: { [string]: CallbackOverride },
}

return nil
