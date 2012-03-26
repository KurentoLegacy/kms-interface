include "common.thrift"

namespace * com.kurento.kms.api

/**
 * Default timeout is one minute
 */
const i32 DEFAULT_TIMEOUT = 60;

typedef i32 ObjectId

struct MediaObject {
	1: ObjectId id,
}

service MediaObjectService {
	/**
	 * Notifies the remote party that an object is already in use
	 * 
	 * @param objectId The object identifier
	 * @param timeout The time until other timeout is required (in seconds)
	 */
	void ping(1: MediaObject mediaObject, 2: i32 timeout = DEFAULT_TIMEOUT) throws (1: common.NotFoundException nfe),
	
	/**
	 * Releases the given media object
	 * 
	 * @param mediaObject The mediaObject that will be released
	 */
	void release(1: MediaObject mediaObject) throws (1: common.NotFoundException nfe),
}
