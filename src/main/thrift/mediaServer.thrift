/*
kms-interface: Thrift interfaces for mediaserver
Copyright (C) 2012 Tikal Technologies

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3
as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

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
