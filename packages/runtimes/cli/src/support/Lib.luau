--!strict
export type Lib = {
	version: string,
	Api: { [string]: any },
	Widgets: { [string]: any },
	Combat: { [string]: any },
	Events: { [string]: any },
	Timing: { [string]: any },
	Maybe: { [string]: any },
	Result: { [string]: any },
	Task: { [string]: any },
}

export type Spec = (lib: Lib, t: any, world: any) -> ()

return nil
