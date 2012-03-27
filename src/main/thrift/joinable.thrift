namespace * com.kurento.kms.api

include "mediaObject.thrift"

enum Direction {
	SEND,
	RECV,
	SEND_RECV,
}

struct Joinable {
	1: required mediaObject.MediaObject parent;
}

exception JoinableNotFoundException {
	1: required string description,
}

exception JoinException {
	1: required string description,
}

service JoinableService extends mediaObject.MediaObjectService {
	void join(1: Joinable from, 2: Joinable to, 3: Direction direction) throws (1: JoinableNotFoundException jnfe, 2: JoinException je),
	void unjoin(1: Joinable from, 2: Joinable to) throws (1: JoinableNotFoundException jnfe, 2: JoinException je)
}
