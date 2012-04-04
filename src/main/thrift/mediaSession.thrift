namespace * com.kurento.kms.api

include "common.thrift"
include "mediaObject.thrift"
include "networkConnection.thrift"
include "mixer.thrift"

struct MediaSession {
	1: required mediaObject.MediaObject parent,
}

exception MediaSessionNotFoundException {
}

service MediaSessionService extends mediaObject.MediaObjectService {
	networkConnection.NetworkConnection createNetworkConnection(1: MediaSession mediaSession, 2: list<networkConnection.NetworkConnectionConfig> config) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);
	void deleteNetworkConnection(1: MediaSession mediaSession, 2: networkConnection.NetworkConnection networConnection) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe, 3: networkConnection.NetworkConnectionNotFoundException ncnfe);
	list<networkConnection.NetworkConnection> getNetworkConnections(1: MediaSession mediaSession) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);

	mixer.Mixer createMixer(1: MediaSession mediaSession, 2: list<mixer.MixerConfig> config) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);
	void deleteMixer(1: MediaSession mediaSession, 2: mixer.Mixer mixer) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe, 3: mixer.MixerNotFoundException mnfe);
	list<mixer.Mixer> getMixers(1: MediaSession mediaSession) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);
}
