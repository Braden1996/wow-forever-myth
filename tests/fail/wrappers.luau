--!strict
local ForeverMyth = require("../../src/ForeverMyth")

local Api = ForeverMyth.Api

local name: string = Api.C_Item.GetItemNameByID(6948) -- expect-error: Just<string>
local info = Api.C_Item.GetItemInfo(true) -- expect-error: boolean
local position = Api.UnitPosition("player")
local typo = position.positionW -- expect-error: positionW
local reused = Api.UnitPositionInto(Api.GetActionInfo(1), "player") -- expect-error: GetActionInfoResults
local loaded: ForeverMyth.Result<true, number> = Api.C_AddOns.LoadAddOn("Speedline") -- expect-error: number
local waited: ForeverMyth.Task<string, never> = Api.C_Timer.AfterAsync(1) -- expect-error: string
Api.C_Timer.AfterAsync("soon") -- expect-error: string

return { name, info, typo, reused, loaded, waited }
