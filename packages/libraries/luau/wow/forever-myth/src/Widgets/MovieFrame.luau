--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type StartMovieResults = {
	read success: boolean,
	read returnCode: number,
}

export type StartMovieByNameResults = {
	read success: boolean,
	read returnCode: number,
}

local Wrappers = {}

function Wrappers.StartMovie(object: MovieFrame, movieID: number, looping: boolean?): StartMovieResults
	local r1, r2 = object:StartMovie(movieID, looping)
	return {
		success = r1,
		returnCode = r2,
	}
end

function Wrappers.StartMovieInto(
	reuse: StartMovieResults,
	object: MovieFrame,
	movieID: number,
	looping: boolean?
): StartMovieResults
	local r1, r2 = object:StartMovie(movieID, looping)
	local fields = Reuse.fields(reuse)
	fields.success = r1
	fields.returnCode = r2
	return reuse
end

function Wrappers.StartMovieByName(
	object: MovieFrame,
	movieName: string,
	looping: boolean?,
	resolution: number?
): StartMovieByNameResults
	local r1, r2 = object:StartMovieByName(movieName, looping, resolution)
	return {
		success = r1,
		returnCode = r2,
	}
end

function Wrappers.StartMovieByNameInto(
	reuse: StartMovieByNameResults,
	object: MovieFrame,
	movieName: string,
	looping: boolean?,
	resolution: number?
): StartMovieByNameResults
	local r1, r2 = object:StartMovieByName(movieName, looping, resolution)
	local fields = Reuse.fields(reuse)
	fields.success = r1
	fields.returnCode = r2
	return reuse
end

return Wrappers
