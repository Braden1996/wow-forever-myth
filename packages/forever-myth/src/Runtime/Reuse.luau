--!strict
local Maybe = require("@truemyth/Maybe")

type Maybe<T> = Maybe.Maybe<T>
type Cell = { kind: "Just", value: unknown }

local Reuse = {}

local function uncheckedWeakKeys(): { [unknown]: any }
	return setmetatable({}, { __mode = "k" }) :: any
end

local function uncheckedAsMaybe(cell: unknown): Maybe<any>
	return cell :: any
end

local function uncheckedAsCell(maybe: unknown): Cell
	return maybe :: any
end

local function uncheckedFields(record: unknown): { [string]: any }
	return record :: any
end

local ownedCells: { [unknown]: boolean } = uncheckedWeakKeys()
local cellOfRecord: { [unknown]: Cell } = uncheckedWeakKeys()

local function newCell(value: unknown): Cell
	local cell: Cell = { kind = "Just", value = value }
	ownedCells[cell] = true
	return cell
end

function Reuse.maybe<T>(previous: Maybe<T>, value: T?): Maybe<T>
	if value == nil then
		return Maybe.nothing()
	end
	if ownedCells[previous] then
		uncheckedAsCell(previous).value = value
		return previous
	end
	return uncheckedAsMaybe(newCell(value))
end

function Reuse.just<T>(record: T): Maybe<T>
	local cell = cellOfRecord[record]
	if cell == nil then
		local created = newCell(record)
		cellOfRecord[record] = created
		return uncheckedAsMaybe(created)
	end
	return uncheckedAsMaybe(cell)
end

function Reuse.fields(record: unknown): { [string]: any }
	return uncheckedFields(record)
end

return Reuse
