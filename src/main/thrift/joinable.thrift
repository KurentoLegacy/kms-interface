namespace * com.kurento.kms.api

include "mediaObject.thrift"

struct Joinable {
	1: required mediaObject.MediaObject parent;
}

service JoinableService extends mediaObject.MediaObjectService {
	// TODO: Add methods here
}
