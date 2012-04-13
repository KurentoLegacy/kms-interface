namespace * com.kurento.kms.api

include "common.thrift"
include "networkConnection.thrift"
include "mixer.thrift"

typedef common.MediaSession MediaSession

/**
 * Default timeout is one minute
 */
const i32 DEFAULT_TIMEOUT = 60;

exception MediaSessionNotFoundException {
}

service MediaSessionService {
	/**
	 * Notifies the remote party that an object is already in use
	 *
	 * @param objectId The object identifier
	 * @param timeout The time until other timeout is required (in seconds)
	 */
	void ping(1: common.MediaSession mediaSession, 2: i32 timeout = DEFAULT_TIMEOUT) throws (1: MediaSessionNotFoundException msnfe, 2: common.MediaServerException mse),
	void release(1: common.MediaSession session) throws (1: MediaSessionNotFoundException msnfe, 2: common.MediaServerException mse),

	networkConnection.NetworkConnection createNetworkConnection(1: common.MediaSession mediaSession, 2: list<networkConnection.NetworkConnectionConfig> config) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);
	void deleteNetworkConnection(1: common.MediaSession mediaSession, 2: networkConnection.NetworkConnection networkConnection) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe, 3: networkConnection.NetworkConnectionNotFoundException ncnfe);
	list<networkConnection.NetworkConnection> getNetworkConnections(1: common.MediaSession mediaSession) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);

	mixer.Mixer createMixer(1: common.MediaSession mediaSession, 2: list<mixer.MixerConfig> config) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);
	void deleteMixer(1: common.MediaSession mediaSession, 2: mixer.Mixer mixer) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe, 3: mixer.MixerNotFoundException mnfe);
	list<mixer.Mixer> getMixers(1: common.MediaSession mediaSession) throws (1: common.MediaServerException mse, 2: MediaSessionNotFoundException msnfe);
}
