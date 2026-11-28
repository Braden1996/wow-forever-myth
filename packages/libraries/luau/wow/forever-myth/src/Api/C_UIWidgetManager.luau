--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetBulletTextListWidgetVisualizationInfo(
	widgetID: number
): Maybe<BulletTextListWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetBulletTextListWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetBulletTextListWidgetVisualizationInfoInto(
	reuse: Maybe<BulletTextListWidgetVisualizationInfo>,
	widgetID: number
): Maybe<BulletTextListWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetBulletTextListWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetButtonHeaderWidgetVisualizationInfo(widgetID: number): Maybe<ButtonHeaderWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetButtonHeaderWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetButtonHeaderWidgetVisualizationInfoInto(
	reuse: Maybe<ButtonHeaderWidgetVisualizationInfo>,
	widgetID: number
): Maybe<ButtonHeaderWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetButtonHeaderWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetCaptureBarWidgetVisualizationInfo(widgetID: number): Maybe<CaptureBarWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetCaptureBarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetCaptureBarWidgetVisualizationInfoInto(
	reuse: Maybe<CaptureBarWidgetVisualizationInfo>,
	widgetID: number
): Maybe<CaptureBarWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetCaptureBarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetCaptureZoneVisualizationInfo(widgetID: number): Maybe<CaptureZoneVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetCaptureZoneVisualizationInfo(widgetID))
end

function Wrappers.GetCaptureZoneVisualizationInfoInto(
	reuse: Maybe<CaptureZoneVisualizationInfo>,
	widgetID: number
): Maybe<CaptureZoneVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetCaptureZoneVisualizationInfo(widgetID))
end

function Wrappers.GetDiscreteProgressStepsVisualizationInfo(
	widgetID: number
): Maybe<DiscreteProgressStepsVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetDiscreteProgressStepsVisualizationInfo(widgetID))
end

function Wrappers.GetDiscreteProgressStepsVisualizationInfoInto(
	reuse: Maybe<DiscreteProgressStepsVisualizationInfo>,
	widgetID: number
): Maybe<DiscreteProgressStepsVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetDiscreteProgressStepsVisualizationInfo(widgetID))
end

function Wrappers.GetDoubleIconAndTextWidgetVisualizationInfo(
	widgetID: number
): Maybe<DoubleIconAndTextWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetDoubleIconAndTextWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetDoubleIconAndTextWidgetVisualizationInfoInto(
	reuse: Maybe<DoubleIconAndTextWidgetVisualizationInfo>,
	widgetID: number
): Maybe<DoubleIconAndTextWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetDoubleIconAndTextWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetDoubleStateIconRowVisualizationInfo(widgetID: number): Maybe<DoubleStateIconRowVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetDoubleStateIconRowVisualizationInfo(widgetID))
end

function Wrappers.GetDoubleStateIconRowVisualizationInfoInto(
	reuse: Maybe<DoubleStateIconRowVisualizationInfo>,
	widgetID: number
): Maybe<DoubleStateIconRowVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetDoubleStateIconRowVisualizationInfo(widgetID))
end

function Wrappers.GetDoubleStatusBarWidgetVisualizationInfo(
	widgetID: number
): Maybe<DoubleStatusBarWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetDoubleStatusBarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetDoubleStatusBarWidgetVisualizationInfoInto(
	reuse: Maybe<DoubleStatusBarWidgetVisualizationInfo>,
	widgetID: number
): Maybe<DoubleStatusBarWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetDoubleStatusBarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetFillUpFramesWidgetVisualizationInfo(widgetID: number): Maybe<FillUpFramesWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetFillUpFramesWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetFillUpFramesWidgetVisualizationInfoInto(
	reuse: Maybe<FillUpFramesWidgetVisualizationInfo>,
	widgetID: number
): Maybe<FillUpFramesWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetFillUpFramesWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetHorizontalCurrenciesWidgetVisualizationInfo(
	widgetID: number
): Maybe<HorizontalCurrenciesWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetHorizontalCurrenciesWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetHorizontalCurrenciesWidgetVisualizationInfoInto(
	reuse: Maybe<
		HorizontalCurrenciesWidgetVisualizationInfo
	>,
	widgetID: number
): Maybe<HorizontalCurrenciesWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetHorizontalCurrenciesWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetIconAndTextWidgetVisualizationInfo(widgetID: number): Maybe<IconAndTextWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetIconAndTextWidgetVisualizationInfoInto(
	reuse: Maybe<IconAndTextWidgetVisualizationInfo>,
	widgetID: number
): Maybe<IconAndTextWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetIconTextAndBackgroundWidgetVisualizationInfo(
	widgetID: number
): Maybe<IconTextAndBackgroundWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetIconTextAndBackgroundWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetIconTextAndBackgroundWidgetVisualizationInfoInto(
	reuse: Maybe<
		IconTextAndBackgroundWidgetVisualizationInfo
	>,
	widgetID: number
): Maybe<
	IconTextAndBackgroundWidgetVisualizationInfo
>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetIconTextAndBackgroundWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetIconTextAndCurrenciesWidgetVisualizationInfo(
	widgetID: number
): Maybe<IconTextAndCurrenciesWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetIconTextAndCurrenciesWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetIconTextAndCurrenciesWidgetVisualizationInfoInto(
	reuse: Maybe<
		IconTextAndCurrenciesWidgetVisualizationInfo
	>,
	widgetID: number
): Maybe<
	IconTextAndCurrenciesWidgetVisualizationInfo
>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetIconTextAndCurrenciesWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetItemDisplayVisualizationInfo(widgetID: number): Maybe<ItemDisplayVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetItemDisplayVisualizationInfo(widgetID))
end

function Wrappers.GetItemDisplayVisualizationInfoInto(
	reuse: Maybe<ItemDisplayVisualizationInfo>,
	widgetID: number
): Maybe<ItemDisplayVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetItemDisplayVisualizationInfo(widgetID))
end

function Wrappers.GetMapPinAnimationWidgetVisualizationInfo(
	widgetID: number
): Maybe<MapPinAnimationWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetMapPinAnimationWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetMapPinAnimationWidgetVisualizationInfoInto(
	reuse: Maybe<MapPinAnimationWidgetVisualizationInfo>,
	widgetID: number
): Maybe<MapPinAnimationWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetMapPinAnimationWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetPreyHuntProgressWidgetVisualizationInfo(
	widgetID: number
): Maybe<PreyHuntProgressWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetPreyHuntProgressWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetPreyHuntProgressWidgetVisualizationInfoInto(
	reuse: Maybe<PreyHuntProgressWidgetVisualizationInfo>,
	widgetID: number
): Maybe<PreyHuntProgressWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetPreyHuntProgressWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo(widgetID: number): Maybe<
	ScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo
>
	return Maybe.of(C_UIWidgetManager.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfoInto(
	reuse: Maybe<
		ScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo
	>,
	widgetID: number
): Maybe<
	ScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo
>
	return Reuse.maybe(
		reuse,
		C_UIWidgetManager.GetScenarioHeaderCurrenciesAndBackgroundWidgetVisualizationInfo(widgetID)
	)
end

function Wrappers.GetScenarioHeaderDelvesWidgetVisualizationInfo(
	widgetID: number
): Maybe<ScenarioHeaderDelvesWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetScenarioHeaderDelvesWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetScenarioHeaderDelvesWidgetVisualizationInfoInto(
	reuse: Maybe<
		ScenarioHeaderDelvesWidgetVisualizationInfo
	>,
	widgetID: number
): Maybe<ScenarioHeaderDelvesWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetScenarioHeaderDelvesWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetScenarioHeaderTimerWidgetVisualizationInfo(
	widgetID: number
): Maybe<ScenarioHeaderTimerWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetScenarioHeaderTimerWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetScenarioHeaderTimerWidgetVisualizationInfoInto(
	reuse: Maybe<
		ScenarioHeaderTimerWidgetVisualizationInfo
	>,
	widgetID: number
): Maybe<ScenarioHeaderTimerWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetScenarioHeaderTimerWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetSpacerVisualizationInfo(widgetID: number): Maybe<SpacerVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetSpacerVisualizationInfo(widgetID))
end

function Wrappers.GetSpacerVisualizationInfoInto(
	reuse: Maybe<SpacerVisualizationInfo>,
	widgetID: number
): Maybe<SpacerVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetSpacerVisualizationInfo(widgetID))
end

function Wrappers.GetSpellDisplayVisualizationInfo(widgetID: number): Maybe<SpellDisplayVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetSpellDisplayVisualizationInfo(widgetID))
end

function Wrappers.GetSpellDisplayVisualizationInfoInto(
	reuse: Maybe<SpellDisplayVisualizationInfo>,
	widgetID: number
): Maybe<SpellDisplayVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetSpellDisplayVisualizationInfo(widgetID))
end

function Wrappers.GetStackedResourceTrackerWidgetVisualizationInfo(
	widgetID: number
): Maybe<StackedResourceTrackerWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetStackedResourceTrackerWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetStackedResourceTrackerWidgetVisualizationInfoInto(
	reuse: Maybe<
		StackedResourceTrackerWidgetVisualizationInfo
	>,
	widgetID: number
): Maybe<
	StackedResourceTrackerWidgetVisualizationInfo
>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetStackedResourceTrackerWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetStatusBarWidgetVisualizationInfo(widgetID: number): Maybe<StatusBarWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetStatusBarWidgetVisualizationInfoInto(
	reuse: Maybe<StatusBarWidgetVisualizationInfo>,
	widgetID: number
): Maybe<StatusBarWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetTextColumnRowVisualizationInfo(widgetID: number): Maybe<TextColumnRowVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetTextColumnRowVisualizationInfo(widgetID))
end

function Wrappers.GetTextColumnRowVisualizationInfoInto(
	reuse: Maybe<TextColumnRowVisualizationInfo>,
	widgetID: number
): Maybe<TextColumnRowVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetTextColumnRowVisualizationInfo(widgetID))
end

function Wrappers.GetTextWithStateWidgetVisualizationInfo(widgetID: number): Maybe<TextWithStateWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetTextWithStateWidgetVisualizationInfoInto(
	reuse: Maybe<TextWithStateWidgetVisualizationInfo>,
	widgetID: number
): Maybe<TextWithStateWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetTextWithSubtextWidgetVisualizationInfo(
	widgetID: number
): Maybe<TextWithSubtextWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetTextWithSubtextWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetTextWithSubtextWidgetVisualizationInfoInto(
	reuse: Maybe<TextWithSubtextWidgetVisualizationInfo>,
	widgetID: number
): Maybe<TextWithSubtextWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetTextWithSubtextWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetTextureAndTextRowVisualizationInfo(widgetID: number): Maybe<TextureAndTextRowVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetTextureAndTextRowVisualizationInfo(widgetID))
end

function Wrappers.GetTextureAndTextRowVisualizationInfoInto(
	reuse: Maybe<TextureAndTextRowVisualizationInfo>,
	widgetID: number
): Maybe<TextureAndTextRowVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetTextureAndTextRowVisualizationInfo(widgetID))
end

function Wrappers.GetTextureAndTextVisualizationInfo(widgetID: number): Maybe<TextureAndTextVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetTextureAndTextVisualizationInfo(widgetID))
end

function Wrappers.GetTextureAndTextVisualizationInfoInto(
	reuse: Maybe<TextureAndTextVisualizationInfo>,
	widgetID: number
): Maybe<TextureAndTextVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetTextureAndTextVisualizationInfo(widgetID))
end

function Wrappers.GetTextureWithAnimationVisualizationInfo(
	widgetID: number
): Maybe<TextureWithAnimationVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetTextureWithAnimationVisualizationInfo(widgetID))
end

function Wrappers.GetTextureWithAnimationVisualizationInfoInto(
	reuse: Maybe<TextureWithAnimationVisualizationInfo>,
	widgetID: number
): Maybe<TextureWithAnimationVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetTextureWithAnimationVisualizationInfo(widgetID))
end

function Wrappers.GetTugOfWarWidgetVisualizationInfo(widgetID: number): Maybe<TugOfWarWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetTugOfWarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetTugOfWarWidgetVisualizationInfoInto(
	reuse: Maybe<TugOfWarWidgetVisualizationInfo>,
	widgetID: number
): Maybe<TugOfWarWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetTugOfWarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetUnitPowerBarWidgetVisualizationInfo(widgetID: number): Maybe<UnitPowerBarWidgetVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetUnitPowerBarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetUnitPowerBarWidgetVisualizationInfoInto(
	reuse: Maybe<UnitPowerBarWidgetVisualizationInfo>,
	widgetID: number
): Maybe<UnitPowerBarWidgetVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetUnitPowerBarWidgetVisualizationInfo(widgetID))
end

function Wrappers.GetWidgetSetInfo(widgetSetID: number): Maybe<UIWidgetSetInfo>
	return Maybe.of(C_UIWidgetManager.GetWidgetSetInfo(widgetSetID))
end

function Wrappers.GetWidgetSetInfoInto(reuse: Maybe<UIWidgetSetInfo>, widgetSetID: number): Maybe<UIWidgetSetInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetWidgetSetInfo(widgetSetID))
end

function Wrappers.GetZoneControlVisualizationInfo(widgetID: number): Maybe<ZoneControlVisualizationInfo>
	return Maybe.of(C_UIWidgetManager.GetZoneControlVisualizationInfo(widgetID))
end

function Wrappers.GetZoneControlVisualizationInfoInto(
	reuse: Maybe<ZoneControlVisualizationInfo>,
	widgetID: number
): Maybe<ZoneControlVisualizationInfo>
	return Reuse.maybe(reuse, C_UIWidgetManager.GetZoneControlVisualizationInfo(widgetID))
end

return Wrappers
