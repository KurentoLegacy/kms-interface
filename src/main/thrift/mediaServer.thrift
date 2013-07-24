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
  MEDIA_MANAGER,
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
  IGNORE
}

union MediaObjectTypeUnion {
  1: MediaObjectType mediaObject,
  2: MediaPadType mediaPad,
  3: MediaElementType mediaElement,
  4: EndPointType endPoint,
  5: SdpEndPointType sdpEndPoint,
  6: UriEndPointType uriEndPoint,
  7: MixerType mixerType,
  8: FilterType filterType,
}

struct MediaObject {
  1: ObjectId id,
  2: string token, // Authentication token
  3: MediaObjectTypeUnion type;
}

struct Command {
  1: binary command,
  2: MediaObject destination,
}

struct CommandResult {
  1: binary result,
  2: MediaObject source,
}

service MediaServerService {
  i32 getVersion();

  void addHandlerAddress (1: i32 handlerId, 2: string address, 3: i32 port) throws (1: MediaServerException mse);

  // MediaObject
  /**
   * Release a previous created media object.
   */
  void release(1: MediaObject mediaObject) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  MediaObject getParent (1: MediaObject mediaObject) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse, 3: NoParentException npe);

  // MediaManager
  MediaObject createMediaManager(1: i32 handlerId) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse, 3: HandlerNotFoundException cnfe);

  MediaObject createSdpEndPoint (1: MediaObject mediaManager, 2: SdpEndPointType type) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  MediaObject createSdpEndPointWithFixedSdp (1: MediaObject mediaManager, 2: SdpEndPointType type, 3: string sdp) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  MediaObject createUriEndpoint (1: MediaObject mediaManager, 2: UriEndPointType type, 3: string uri) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  MediaObject createHttpEndpoint (1: MediaObject mediaManager) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  MediaObject createMixer (1: MediaObject mediaManager, 2: MixerType type) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  MediaObject createFilter (1: MediaObject mediaManager, 2: FilterType type) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // MediaElement
  CommandResult sendCommand (1: MediaObject mediaElement, 2: Command command) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse, 3: EncodingException se);
  list<MediaObject> getMediaSrcs(1: MediaObject mediaElement) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  list<MediaObject> getMediaSinks(1: MediaObject mediaElement) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  list<MediaObject> getMediaSrcsByMediaType(1: MediaObject mediaElement, 2: MediaType mediaType) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  list<MediaObject> getMediaSinksByMediaType(1: MediaObject mediaElement, 2: MediaType mediaType) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // MediaPad
  MediaType getMediaType (1: MediaObject mediaPad) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // MediaSrc
  void connect(1: MediaObject mediaSrc, 2: MediaObject mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: ConnectionException ce, 3: MediaServerException mse);
  void disconnect(1: MediaObject src, 2: MediaObject mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  list<MediaObject> getConnectedSinks(1: MediaObject mediaSrc) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // MediaSink
  MediaObject getConnectedSrc(1: MediaObject mediaSink) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // Mixer
  MediaObject createMixerEndPoint(1: MediaObject mixer) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // UriEndPoint
  string getUri(1: MediaObject uriEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  void start(1: MediaObject uriEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  void pause(1: MediaObject uriEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  void stop(1: MediaObject uriEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);

  // SdpEndPoint
  string generateOffer(1: MediaObject sdpEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  string processAnswer(1: MediaObject sdpEndPoint, 2: string answer) throws (1: MediaObjectNotFoundException monfe, 2: NegotiationException ne, 3: MediaServerException mse);
  string processOffer(1: MediaObject sdpEndPoint, 2: string offer) throws (1: MediaObjectNotFoundException monfe, 2: NegotiationException ne, 3: MediaServerException mse);

  string getLocalSessionDescription(1: MediaObject sdpEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
  string getRemoteSessionDescription(1: MediaObject sdpEndPoint) throws (1: MediaObjectNotFoundException monfe, 2: MediaServerException mse);
}
