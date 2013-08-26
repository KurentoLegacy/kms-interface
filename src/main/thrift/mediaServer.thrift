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

const i32 VERSION = 1;

enum MediaType {
  AUDIO,
  VIDEO,
}

typedef i64 ObjectId

exception MediaServerException {
  1: required string description,
}

exception MediaObjectNotFoundException {
}

exception ConnectionException {
  1: required string description,
}

exception NegotiationException {
  1: required string description,
}

exception HandlerNotFoundException {
}

exception NoParentException {
}

exception EncodingException {
}

enum MediaObjectType {
  MEDIA_PIPELINE,
  MEDIA_ELEMENT,
  MIXER,
  MEDIA_PAD
}

enum MediaPadType {
  MEDIA_SINK,
  MEDIA_SRC
}

enum MediaElementType {
  END_POINT,
  FILTER
}

enum EndPointType {
  HTTP_END_POINT,
  MIXER_END_POINT,
  SDP_END_POINT,
  URI_END_POINT
}

enum SdpEndPointType {
  RTP_END_POINT,
  WEBRTC_END_POINT,
}

enum UriEndPointType {
  PLAYER_END_POINT,
  RECORDER_END_POINT,
}

enum MixerType {
  MAIN_MIXER
}

enum FilterType {
  ZBAR_FILTER,
  POINTER_DETECTOR_FILTER
}

union MediaObjectTypeUnion {
  1: optional MediaObjectType mediaObject,
  2: optional MediaPadType mediaPad,
  3: optional MediaElementType mediaElement,
  4: optional EndPointType endPoint,
  5: optional SdpEndPointType sdpEndPoint,
  6: optional UriEndPointType uriEndPoint,
  7: optional MixerType mixerType,
  8: optional FilterType filterType,
}

struct MediaObjectId {
  1: ObjectId id,
  2: string token, // Authentication token
  3: MediaObjectTypeUnion type;
}

struct Command {
  1: binary command,
  2: MediaObjectId destination,
}

struct CommandResult {
  1: binary result,
  2: MediaObjectId source,
}

service MediaServerService {
  i32 getVersion();

  void addHandlerAddress (1: i32 handlerId, 2: string address, 3: i32 port) throws (1: MediaServerException mse);

  // MediaObject
  /**
   * Release a previous created media object.
   */
  void release(1: MediaObjectId mediaObject) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  MediaObjectId getParent (1: MediaObjectId mediaObject) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse, 3: NoParentException npe);

  // MediaPipeline
  MediaObjectId createMediaPipeline(1: i32 handlerId) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse, 3: HandlerNotFoundException cnfe);

  MediaObjectId createSdpEndPoint (1: MediaObjectId mediaPipeline, 2: SdpEndPointType type) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  MediaObjectId createSdpEndPointWithFixedSdp (1: MediaObjectId mediaPipeline, 2: SdpEndPointType type, 3: string sdp) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  MediaObjectId createUriEndPoint (1: MediaObjectId mediaPipeline, 2: UriEndPointType type, 3: string uri) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  MediaObjectId createHttpEndPoint (1: MediaObjectId mediaPipeline) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  MediaObjectId createMixer (1: MediaObjectId mediaPipeline, 2: MixerType type) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  MediaObjectId createFilter (1: MediaObjectId mediaPipeline, 2: FilterType type) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // MediaElement
  CommandResult sendCommand (1: MediaObjectId mediaElement, 2: Command command) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse, 3: EncodingException se);
  list<MediaObjectId> getMediaSrcs(1: MediaObjectId mediaElement) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  list<MediaObjectId> getMediaSinks(1: MediaObjectId mediaElement) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  list<MediaObjectId> getMediaSrcsByMediaType(1: MediaObjectId mediaElement, 2: MediaType mediaType) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  list<MediaObjectId> getMediaSinksByMediaType(1: MediaObjectId mediaElement, 2: MediaType mediaType) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // MediaPad
  MediaType getMediaType (1: MediaObjectId mediaPad) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // MediaSrc
  void connect(1: MediaObjectId mediaSrc, 2: MediaObjectId mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: ConnectionException ce, 3: MediaServerException mse);
  void disconnect(1: MediaObjectId src, 2: MediaObjectId mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  list<MediaObjectId> getConnectedSinks(1: MediaObjectId mediaSrc) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // MediaSink
  MediaObjectId getConnectedSrc(1: MediaObjectId mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // Mixer
  MediaObjectId createMixerEndPoint(1: MediaObjectId mixer) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // HttpEndPoint
  string getUrl(1: MediaObjectId httpEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // UriEndPoint
  string getUri(1: MediaObjectId uriEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  void start(1: MediaObjectId uriEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  void pause(1: MediaObjectId uriEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  void stop(1: MediaObjectId uriEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // SdpEndPoint
  string generateOffer(1: MediaObjectId sdpEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  string processAnswer(1: MediaObjectId sdpEndPoint, 2: string answer) throws (1: MediaObjectNotFoundException monfe, 2: NegotiationException ne, 3: MediaServerException mse);
  string processOffer(1: MediaObjectId sdpEndPoint, 2: string offer) throws (1: MediaObjectNotFoundException monfe, 2: NegotiationException ne, 3: MediaServerException mse);

  string getLocalSessionDescription(1: MediaObjectId sdpEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  string getRemoteSessionDescription(1: MediaObjectId sdpEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
}
