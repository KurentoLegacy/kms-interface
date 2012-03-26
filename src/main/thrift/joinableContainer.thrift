namespace * com.kurento.kms.api

include "mediaObject.thrift"

// TODO: Change inheritance to joinable

struct JoinableContainer {
	1: required mediaObject.MediaObject parent;
}

service JoinableContainerService extends mediaObject.MediaObjectService {
	// TODO: Add methods here
}
