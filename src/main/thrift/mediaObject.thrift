include "common.thrift"

namespace * com.kurento.kms.api

typedef i64 ObjectId

struct MediaObject {
	1: ObjectId id,
	2: string token, // Autentication token
}

// Declared here to avoid double inclussion on MediaSession childs
struct MediaSession {
	1: required MediaObject object,
}

exception MediaObjectNotFoundException {
}

service MediaObjectService {
	/**
	 * Releases the given media object
	 *
	 * @param mediaObject The mediaObject that will be released
	 */
	void release(1: MediaObject mediaObject) throws (1: MediaObjectNotFoundException monf, 2: common.MediaServerException mse),
}
