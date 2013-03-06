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

namespace java com.kurento.kms.api
namespace cpp kurento
namespace * Kurento

const i32 DEFAULT_TIMEOUT = 60;

enum MediaType {
	AUDIO,
	VIDEO,
}

typedef i64 ObjectId

struct MediaObject {
	1: ObjectId id,
	2: string token, // Authentication token
}

exception MediaServerException {
	1: required string description,
}

exception MediaObjectNotFoundException {
}

exception JoinException {
	1: required string description,
}

exception NegotiationException {
	1: required string description,
}


service MediaServerService {
	void ping(1: MediaObject resource, 2: i32 timeout = DEFAULT_TIMEOUT) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

	/**
	 * Release a previous created media object.
	 */
	void release(1: MediaObject mediaObject) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

	// MediaFactory
	MediaObject createMediaFactory() throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	MediaObject createMediaPlayer(1: MediaObject mediaFactory) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	MediaObject createMediaRecorder(1: MediaObject mediaFactory) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	MediaObject createStream(1: MediaObject mediaFactory) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	MediaObject createMixer(1: MediaObject mediaFactory, 2: i32 mixerId) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// MediaElement
	MediaType getMediaType(1: MediaObject mediaElement) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// MediaSrc
	void connect(1: MediaObject mediaSrc, 2: MediaObject mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	void disconnect(1: MediaObject src, 2: MediaObject mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	list<MediaObject> getConnectedSinks(1: MediaObject mediaSrc) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// MediaSink
	MediaObject getConnectedSrc(1: MediaObject mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// Joinable
	void join(1: MediaObject joinableA, 2: MediaObject joinableB) throws (1: MediaObjectNotFoundException monfe, 2: JoinException je, 3: MediaServerException mse);
	void unjoin(1: MediaObject joinableA, 2: MediaObject joinableB) throws (1: MediaObjectNotFoundException monfe, 2: JoinException je, 3: MediaServerException mse);

	list<MediaObject> getMediaSrcs(1: MediaObject joinable) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	list<MediaObject> getMediaSinks(1: MediaObject joinable) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

	list<MediaObject> getMediaSrcsByMediaType(1: MediaObject joinable, 2: MediaType mediaType) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	list<MediaObject> getMediaSinksByMediaType(1: MediaObject joinable, 2: MediaType mediaType) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// MediaPlayer
	void play(1: MediaObject mediaPlayer) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	void pausePlayer(1: MediaObject mediaPlayer) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	void stopPlayer(1: MediaObject mediaPlayer) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// MediaRecorder
	void record(1: MediaObject mediaRecorder) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	void pauseRecorder(1: MediaObject mediaRecorder) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	void stopRecorder(1: MediaObject mediaRecorder) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// Stream
	string generateOffer(1: MediaObject stream) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	string processAnswer(1: MediaObject stream, 2: string anwser) throws (1: MediaObjectNotFoundException monfe, 2: NegotiationException ne, 3: MediaServerException mse);
	string processOffer(1: MediaObject stream, 2: string offer) throws (1: MediaObjectNotFoundException monfe, 2: NegotiationException ne, 3: MediaServerException mse);

	string getLocalDescriptor(1: MediaObject stream) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
	string getRemoteDescriptor(1: MediaObject stream) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// Mixer
	MediaObject getMixerPort(1: MediaObject mixer) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);


	// MixerPort
	MediaObject getMixer(1: MediaObject mixerPort) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
}
