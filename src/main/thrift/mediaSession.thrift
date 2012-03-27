namespace * com.kurento.kms.api

include "common.thrift"
include "mediaObject.thrift"
include "networkConnection.thrift"

struct MediaSession {
	1: required mediaObject.MediaObject parent,
}

exception MediaSessionNotFoundException {
}

service MediaSessionService extends mediaObject.MediaObjectService {
	networkConnection.NetworkConnection createNetworkConnection(1: MediaSession mediaSessionId, 2: list<networkConnection.NetworkConnectionConfig> config) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);
	void deleteNetworkConnection(1: MediaSession mediaSessionId, 2: networkConnection.NetworkConnection networConnection) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe, 3: networkConnection.NetworkConnectionNotFoundException ncnfe);
	list<networkConnection.NetworkConnection> getNetworkConnections(1: MediaSession mediaSessionId) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);
}
