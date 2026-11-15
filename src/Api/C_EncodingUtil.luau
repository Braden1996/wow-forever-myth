--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.CompressString(
	source: stringView,
	method: Enum_CompressionMethod?,
	level: Enum_CompressionLevel?
): Maybe<string>
	return Maybe.of(C_EncodingUtil.CompressString(source, method, level))
end

function Wrappers.CompressStringInto(
	reuse: Maybe<string>,
	source: stringView,
	method: Enum_CompressionMethod?,
	level: Enum_CompressionLevel?
): Maybe<string>
	return Reuse.maybe(reuse, C_EncodingUtil.CompressString(source, method, level))
end

function Wrappers.DecodeBase64(source: stringView, variant: Enum_Base64Variant?): Maybe<string>
	return Maybe.of(C_EncodingUtil.DecodeBase64(source, variant))
end

function Wrappers.DecodeBase64Into(
	reuse: Maybe<string>,
	source: stringView,
	variant: Enum_Base64Variant?
): Maybe<string>
	return Reuse.maybe(reuse, C_EncodingUtil.DecodeBase64(source, variant))
end

function Wrappers.DecodeHex(source: string): Maybe<string>
	return Maybe.of(C_EncodingUtil.DecodeHex(source))
end

function Wrappers.DecodeHexInto(reuse: Maybe<string>, source: string): Maybe<string>
	return Reuse.maybe(reuse, C_EncodingUtil.DecodeHex(source))
end

function Wrappers.DecompressString(source: stringView, method: Enum_CompressionMethod?): Maybe<string>
	return Maybe.of(C_EncodingUtil.DecompressString(source, method))
end

function Wrappers.DecompressStringInto(
	reuse: Maybe<string>,
	source: stringView,
	method: Enum_CompressionMethod?
): Maybe<string>
	return Reuse.maybe(reuse, C_EncodingUtil.DecompressString(source, method))
end

function Wrappers.DeserializeCBOR(source: stringView): Maybe<LuaValueVariant>
	return Maybe.of(C_EncodingUtil.DeserializeCBOR(source))
end

function Wrappers.DeserializeCBORInto(reuse: Maybe<LuaValueVariant>, source: stringView): Maybe<LuaValueVariant>
	return Reuse.maybe(reuse, C_EncodingUtil.DeserializeCBOR(source))
end

function Wrappers.DeserializeJSON(source: string): Maybe<LuaValueVariant>
	return Maybe.of(C_EncodingUtil.DeserializeJSON(source))
end

function Wrappers.DeserializeJSONInto(reuse: Maybe<LuaValueVariant>, source: string): Maybe<LuaValueVariant>
	return Reuse.maybe(reuse, C_EncodingUtil.DeserializeJSON(source))
end

function Wrappers.EncodeBase64(source: stringView, variant: Enum_Base64Variant?): Maybe<string>
	return Maybe.of(C_EncodingUtil.EncodeBase64(source, variant))
end

function Wrappers.EncodeBase64Into(
	reuse: Maybe<string>,
	source: stringView,
	variant: Enum_Base64Variant?
): Maybe<string>
	return Reuse.maybe(reuse, C_EncodingUtil.EncodeBase64(source, variant))
end

function Wrappers.EncodeHex(source: stringView): Maybe<string>
	return Maybe.of(C_EncodingUtil.EncodeHex(source))
end

function Wrappers.EncodeHexInto(reuse: Maybe<string>, source: stringView): Maybe<string>
	return Reuse.maybe(reuse, C_EncodingUtil.EncodeHex(source))
end

return Wrappers
