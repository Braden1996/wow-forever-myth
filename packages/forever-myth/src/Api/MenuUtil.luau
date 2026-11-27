--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.CreateButtonContextMenu(ownerRegion: Region?, ...: { unknown }): Maybe<Frame>
	return Maybe.of(MenuUtil.CreateButtonContextMenu(ownerRegion, ...))
end

function Wrappers.CreateButtonContextMenuInto(reuse: Maybe<Frame>, ownerRegion: Region?, ...: { unknown }): Maybe<Frame>
	return Reuse.maybe(reuse, MenuUtil.CreateButtonContextMenu(ownerRegion, ...))
end

function Wrappers.CreateCheckboxContextMenu(
	ownerRegion: Region?,
	isSelected: (data: unknown) -> boolean,
	setSelected: MenuResponder,
	...: { unknown }
): Maybe<Frame>
	return Maybe.of(MenuUtil.CreateCheckboxContextMenu(ownerRegion, isSelected, setSelected, ...))
end

function Wrappers.CreateCheckboxContextMenuInto(
	reuse: Maybe<Frame>,
	ownerRegion: Region?,
	isSelected: (data: unknown) -> boolean,
	setSelected: MenuResponder,
	...: { unknown }
): Maybe<Frame>
	return Reuse.maybe(reuse, MenuUtil.CreateCheckboxContextMenu(ownerRegion, isSelected, setSelected, ...))
end

function Wrappers.CreateContextMenu(
	ownerRegion: Region?,
	generator: (ownerRegion: Region, description: RootMenuDescriptionProxy, ...unknown) -> (),
	...: unknown
): Maybe<Frame>
	return Maybe.of(MenuUtil.CreateContextMenu(ownerRegion, generator, ...))
end

function Wrappers.CreateContextMenuInto(
	reuse: Maybe<Frame>,
	ownerRegion: Region?,
	generator: (
		ownerRegion: Region,
		description: RootMenuDescriptionProxy,
		...unknown
	) -> (),
	...: unknown
): Maybe<Frame>
	return Reuse.maybe(reuse, MenuUtil.CreateContextMenu(ownerRegion, generator, ...))
end

function Wrappers.CreateRadioContextMenu(
	ownerRegion: Region?,
	isSelected: (data: unknown) -> boolean,
	setSelected: MenuResponder,
	...: { unknown }
): Maybe<Frame>
	return Maybe.of(MenuUtil.CreateRadioContextMenu(ownerRegion, isSelected, setSelected, ...))
end

function Wrappers.CreateRadioContextMenuInto(
	reuse: Maybe<Frame>,
	ownerRegion: Region?,
	isSelected: (data: unknown) -> boolean,
	setSelected: MenuResponder,
	...: { unknown }
): Maybe<Frame>
	return Reuse.maybe(reuse, MenuUtil.CreateRadioContextMenu(ownerRegion, isSelected, setSelected, ...))
end

return Wrappers
