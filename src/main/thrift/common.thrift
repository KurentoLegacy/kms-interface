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
