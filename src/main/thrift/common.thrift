/*
kms-interface: Thrift interfaces for mediaserver
Copyright (C) 2012 Tikal Technologies

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3
as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

namespace * com.kurento.kms.api

enum ErrorCode {
	NO_RESOURCES,
	UNEXPECTED,
}

exception MediaServerException {
	1: required string description;
	2: ErrorCode code = ErrorCode.UNEXPECTED,
}

typedef i64 ObjectId

struct MediaObject {
	1: ObjectId id,
	2: string token, // Autentication token
}

// Declared here to avoid double inclussion on MediaSession childs
struct MediaSession {
	1: required MediaObject object,
}
