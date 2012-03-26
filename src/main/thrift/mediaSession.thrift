namespace * com.kurento.kms.api

include "common.thrift"
include "mediaObject.thrift"
include "networkConnection.thrift"

struct MediaSession {
	1: required mediaObject.MediaObject parent,
}

service MediaSessionService extends mediaObject.MediaObjectService {
	networkConnection.NetworkConnection createNetworkConnection(1: MediaSession mediaSessionId, 2: networkConnection.NetworConnectionConfig config) throws (1: common.MediaServerException mse, 2: common.NotFoundException nfe);
	void deleteNetworkConnection(1: MediaSession mediaSessionId, 2: networkConnection.NetworkConnection networConnection) throws (1: common.MediaServerException mse, 2: common.NotFoundException nfe);
	list<networkConnection.NetworkConnection> getNetworkConnections(1: MediaSession mediaSessionId) throws (1: common.MediaServerException mse, 2: common.NotFoundException nfe);
}
