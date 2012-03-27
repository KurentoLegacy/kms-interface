namespace * com.kurento.kms.api

include "common.thrift"
include "mediaSession.thrift"

service MediaServerService {
	/**
	 * Creates a new mediaSession that allows interaction with media server
	 */
	mediaSession.MediaSession createMediaSession() throws (1: common.MediaServerException mse),

	/**
	 * Deletes a previously created media session.
	 */
	void deleteMediaSession(1: mediaSession.MediaSession session) throws (1: mediaSession.MediaSessionNotFoundException msnfe),
}
