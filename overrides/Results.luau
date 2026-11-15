--!strict
local OverrideTypes = require("../generator/OverrideTypes")

local CAN_USE = "true when the player can use the feature; otherwise failureReason is the localised reason"

local results: { [string]: OverrideTypes.ResultOverride } = {
	["C_AddOns.LoadAddOn"] = {
		error = "value",
		fallback = '"UNKNOWN"',
		why = "loaded is true on success; otherwise the second result is the ADDON_* reason key, sometimes nil",
	},
	["C_AddOns.IsAddOnLoadable"] = {
		error = "reason",
		why = "loadable is true when the addon can load; otherwise reason is the ADDON_* reason key",
	},
	["C_ClassTalents.ImportLoadout"] = {
		error = "importError",
		why = "success is true when the loadout was imported; otherwise importError is the localised error",
	},
	["C_ClassTalents.CanEditTalents"] = {
		error = "changeError",
		why = "canEdit is true when talents can be edited; otherwise changeError is the localised error",
	},
	["C_Traits.CanEditConfig"] = {
		error = "errorMessage",
		why = "canEdit is true when the config can be edited; otherwise errorMessage is the localised error",
	},
	["C_MountJournal.GetMountUsabilityByID"] = {
		error = "useError",
		fallback = '""',
		why = "isUsable is true when the mount can be summoned; otherwise useError is the localised error, if any",
	},
	["C_LFGInfo.CanPlayerUseGroupFinder"] = { error = "failureReason", why = CAN_USE },
	["C_LFGInfo.CanPlayerUseLFD"] = { error = "failureReason", why = CAN_USE },
	["C_LFGInfo.CanPlayerUseLFR"] = { error = "failureReason", why = CAN_USE },
	["C_LFGInfo.CanPlayerUsePVP"] = { error = "failureReason", why = CAN_USE },
	["C_LFGInfo.CanPlayerUsePremadeGroup"] = { error = "failureReason", why = CAN_USE },
	["C_LFGInfo.CanPlayerUseScenarioFinder"] = { error = "failureReason", why = CAN_USE },
	["C_PvP.CanPlayerUseRatedPVPUI"] = { error = "failureReason", why = CAN_USE },
	["C_PlayerInfo.CanPlayerUseMountEquipment"] = { error = "failureReason", why = CAN_USE },
	["C_SpecializationInfo.CanPlayerUseTalentUI"] = { error = "failureReason", why = CAN_USE },
	["C_SpecializationInfo.CanPlayerUseTalentSpecUI"] = { error = "failureReason", why = CAN_USE },
	["C_SpecializationInfo.CanPlayerUsePVPTalentUI"] = { error = "failureReason", why = CAN_USE },
}

return results
