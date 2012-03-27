namespace * com.kurento.kms.api

include "joinable.thrift"

struct JoinableContainer {
	1: required joinable.Joinable parent;
}

service JoinableContainerService extends joinable.JoinableService {
	// TODO: Add methods here
}
