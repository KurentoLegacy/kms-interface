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

namespace java com.kurento.kms.thrift.api
namespace cpp kurento
namespace * Kurento

const i32 VERSION = 3;

const i32 GarbagePeriod = 120; //Activation period of the distributed garbage collector in seconds

typedef i64 ObjectId

//Reserved for internal errors caused by miss-behavior of the media server
exception MediaServerException {
  1: string description,
  2: i32 errorCode
}

enum PadDirection {
  SINK,
  SRC
}

enum MediaType {
  AUDIO,
  VIDEO,
  DATA
}

/*
We create specific types of references for each kind of media object.
Advantages:
- More intuitive (ex. a media pipeline and a media element are not "types" of anything, so there is no a notion of inheritance or super-type here)
- Avoid having "types" and "subtypes"
-- Ex. It would make no sense to have only "type" and make it "MediaPipeline" for a pipeline. This would allow creating media pipelines as elements.
*/

//This represents a logical address for accessing a MediaObject
struct MediaObjectId {
  1: ObjectId id, //This may be a union of the rest of types, so that it works on common calls
  2: string token
}

struct MediaElementRef {
  1: MediaObjectId mediaObjectId,
  2: string elementType
}

struct MediaPipelineRef {
  1: MediaObjectId mediaObjectId
}

struct MediaPadRef {
  1: MediaObjectId mediaObjectId,
  2: PadDirection direction,
  3: MediaType mediaType,
  4: string mediaDescription //subtype of media. Useful for "data" MediaType. Ex. location, accelerometer, etc.
}

struct MediaMixerRef {
  1: MediaObjectId mediaObjectId,
  2: string mixerType //type of mixer indicating mixing style.
}

//class simulating a "parent" of all MediaObjects. Useful for consolidating methods
union MediaObjectRef {
  1: optional MediaElementRef mediaElementRef,
  2: optional MediaPipelineRef mediaPipelineRef,
  3: optional MediaPadRef mediaPadRef,
  4: optional MediaMixerRef mediaMixerRef
}

struct Command {
  1: string type,
  2: binary data
}

typedef Command Params

struct CommandResult {
  1: binary result
}


service MediaServerService {
  i32 getVersion();

  /////////////////////////////////////////////////////////////////////////////////
  //Common methods for all media objects
  ////////////////////////////////////////////////////////////////////////////////

  //Invoke this method each GarbagePeriod seconds in order to avoid the MediaObject to be garbage collected
  void keepAlive(1: MediaObjectRef mediaObjectRef) throws (1: MediaServerException mse);
  //Explicity release a MediaObject form memory. All its descendants will be also released and collected.
  void release(1: MediaObjectRef mediaObjectRef) throws (1: MediaServerException mse);
  
  //Invoke this for receiving events form a MediaObject. This method returns a callbackToken that needs to be used for unsubscribing and that will be present on all events.
  string subscribe(1: MediaObjectRef mediaObjectRef, 2: string handlerAddress, 3: i32 handlerPort) throws (1: MediaServerException mse);
  //Invoke this for stop receiving events form a MediaObject. The parameter callbackToken must much the one returned by subscribe to the listener.
  void unsubscribe(1: MediaObjectRef mediaObjectRef, 2: string callbackToken) throws (1: MediaServerException mse);

  //Send a comand to a media object
  CommandResult sendCommand(1: MediaObjectRef mediaObject, 2: Command command) throws (1: MediaServerException mse);
  
  //Returns the parent (object that created it) of a MediaObject
  MediaObjectRef getParent(1: MediaObjectRef mediaObjectRef) throws (1: MediaServerException mse);
  //Returns the pipeline to which this MediaObjects belong, or the pipeline itself if the argument references a pipeline
  MediaPipelineRef getMediaPipeline(1: MediaObjectRef mediaObjectRef) throws (1: MediaServerException mse);

   /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaPipeline object
  /////////////////////////////////////////////////////////////////////////////////
  MediaPipelineRef createMediaPipeline() throws (1: MediaServerException mse);
  MediaPipelineRef createMediaPipelineWithParams(1: Params params) throws (1: MediaServerException mse);
  MediaElementRef createMediaElement(1: MediaPipelineRef mediaPipeline, 2: string elementType) throws (1: MediaServerException mse);
  MediaElementRef createMediaElementWithParams(1: MediaPipelineRef mediaPipeline, 2: string elementType, 3: Params params) throws (1: MediaServerException mse);
  MediaMixerRef createMediaMixer(1: MediaPipelineRef mediaPipeline, 2: string mixerType) throws (1: MediaServerException mse);
  MediaMixerRef createMediaMixerWithParams(1: MediaPipelineRef mediaPipeline, 2: string mixerType, 3: Params params) throws (1: MediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaElement objects
  /////////////////////////////////////////////////////////////////////////////////
  list<MediaPadRef> getMediaSrcs(1: MediaElementRef mediaElement) throws (1: MediaServerException mse);
  list<MediaPadRef> getMediaSinks(1: MediaElementRef mediaElement)  throws (1: MediaServerException mse);
  list<MediaPadRef> getMediaSrcsByMediaType(1: MediaElementRef mediaElement, 2: MediaType mediaType) throws (1: MediaServerException mse);
  list<MediaPadRef> getMediaSinksByMediaType(1: MediaElementRef mediaElement, 2: MediaType mediaType) throws (1: MediaServerException mse);
  list<MediaPadRef> getMediaSrcsByFullDescription(1: MediaElementRef mediaElement, 2: MediaType mediaType, 3: string description) throws (1: MediaServerException mse);
  list<MediaPadRef> getMediaSinksByFullDescription(1: MediaElementRef mediaElement, 2: MediaType mediaType, 3: string description) throws (1: MediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaPad objects
  /////////////////////////////////////////////////////////////////////////////////
  void connect(1: MediaPadRef mediaSrc, 2: MediaPadRef mediaSink) throws (1: MediaServerException mse);
  void disconnect(1: MediaPadRef mediaSrc, 2: MediaPadRef mediaSink) throws (1: MediaServerException mse);
  list<MediaPadRef> getConnectedSinks(1: MediaPadRef mediaSrc) throws (1: MediaServerException mse);
  MediaPadRef getConnectedSrc(1: MediaPadRef mediaSinkRef) throws (1: MediaServerException mse);
  MediaElementRef getMediaElement(1: MediaPadRef mediaPadRef) throws (1: MediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to Mixer objects
  /////////////////////////////////////////////////////////////////////////////////
  MediaElementRef createMixerEndPoint(1: MediaMixerRef mixer) throws (1: MediaServerException mse);
  MediaElementRef createMixerEndPointWithParams(1: MediaMixerRef mixer, 2: Params params) throws (1: MediaServerException mse);
}
