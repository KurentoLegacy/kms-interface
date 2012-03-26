namespace * com.kurento.kms.api

include "joinableContainer.thrift"

enum NetworConnectionConfig {
	RTP,
	RTMP,
}

struct NetworkConnection {
	1: required joinableContainer.JoinableContainer parent,
}

service NetworkConnectionService extends joinableContainer.JoinableContainerService {
	
}
