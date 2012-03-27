namespace * com.kurento.kms.api

include "joinableContainer.thrift"

enum NetworkConnectionConfig {
	RTP,
	RTMP,
}

struct NetworkConnection {
	1: required joinableContainer.JoinableContainer parent,
	2: required list<NetworkConnectionConfig> config,
}

exception NetworkConnectionNotFoundException {
}

service NetworkConnectionService extends joinableContainer.JoinableContainerService {
	
}
