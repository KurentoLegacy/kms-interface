namespace * com.kurento.kms.api

include "common.thrift"
include "mediaSession.thrift"

struct ServerConfig {
	1: required string address,
	2: required i32 serverServicePort,

	3: optional i32 mediaSessionServicePort,
	4: optional i32 networkConnectionServicePort,
	5: optional i32 mixerServicePort,
}

service MediaServerService {
	/**
	 * Gets current server configuration that may be usefull for clients
	 */
	ServerConfig getServerconfig(),

	/**
	 * Creates a new mediaSession that allows interaction with media server
	 */
	mediaSession.MediaSession createMediaSession() throws (1: common.MediaServerException mse),

	/**
	 * Deletes a previously created media session.
	 */
	void deleteMediaSession(1: mediaSession.MediaSession session) throws (1: mediaSession.MediaSessionNotFoundException msnfe, 2: common.MediaServerException mse),
}
