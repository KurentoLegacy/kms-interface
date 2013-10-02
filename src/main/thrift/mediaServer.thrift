/*
 * (C) Copyright 2013 Kurento (http://kurento.org/)
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 */

namespace java com.kurento.kms.thrift.api
namespace cpp kurento
namespace * Kurento

const i32 VERSION = 3;

const i32 GARBAGE_PERIOD = 120; //Activation period of the distributed garbage collector in seconds

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

struct MediaElementType {
  1: string elementType
}

struct MediaPipelineType {
}

struct MediaPadType {
  1: PadDirection direction,
  2: MediaType mediaType,
  3: string mediaDescription //subtype of media. Useful for "data" MediaType. Ex. location, accelerometer, etc.
}

struct MediaMixerType {
  1: string mixerType //type of mixer indicating mixing style.
}

union MediaObjectType {
  1: optional MediaPipelineType pipelineType,
  2: optional MediaElementType elementType,
  3: optional MediaPadType padType,
  4: optional MediaMixerType mixerType
}

//class simulating a "parent" of all MediaObjects. Useful for consolidating methods
struct MediaObjectRef {
  1: ObjectId id, //This may be a union of the rest of types, so that it works on common calls
  2: string token,
  3: MediaObjectType type
}

struct Params {
  1: string dataType,
  2: optional binary data
}

struct Command {
  1: string name,
  2: optional Params params
}

typedef Params CommandResult

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
  string subscribe(1: MediaObjectRef mediaObjectRef, 2: string eventType, 3: string handlerAddress, 4: i32 handlerPort) throws (1: MediaServerException mse);
  //Invoke this for stop receiving events form a MediaObject. The parameter callbackToken must match the one returned by subscribe to the listener.
  void unsubscribe(1: MediaObjectRef mediaObjectRef, 2: string callbackToken) throws (1: MediaServerException mse);

  //Send a comand to a media object
  CommandResult sendCommand(1: MediaObjectRef mediaObjectRef, 2: Command command) throws (1: MediaServerException mse);

  //Returns the parent (object that created it) of a MediaObject
  MediaObjectRef getParent(1: MediaObjectRef mediaObjectRef) throws (1: MediaServerException mse);
  //Returns the pipeline to which this MediaObjects belong, or the pipeline itself if the argument references a pipeline
  MediaObjectRef getMediaPipeline(1: MediaObjectRef mediaObjectRef) throws (1: MediaServerException mse);

   /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaPipeline object
  /////////////////////////////////////////////////////////////////////////////////
  MediaObjectRef createMediaPipeline() throws (1: MediaServerException mse);
  MediaObjectRef createMediaPipelineWithParams(1: Params params) throws (1: MediaServerException mse);
  MediaObjectRef createMediaElement(1: MediaObjectRef mediaPipeline, 2: string elementType) throws (1: MediaServerException mse);
  MediaObjectRef createMediaElementWithParams(1: MediaObjectRef mediaPipeline, 2: string elementType, 3: Params params) throws (1: MediaServerException mse);
  MediaObjectRef createMediaMixer(1: MediaObjectRef mediaPipeline, 2: string mixerType) throws (1: MediaServerException mse);
  MediaObjectRef createMediaMixerWithParams(1: MediaObjectRef mediaPipeline, 2: string mixerType, 3: Params params) throws (1: MediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaElement objects
  /////////////////////////////////////////////////////////////////////////////////
  list<MediaObjectRef> getMediaSrcs(1: MediaObjectRef mediaElement) throws (1: MediaServerException mse);
  list<MediaObjectRef> getMediaSinks(1: MediaObjectRef mediaElement)  throws (1: MediaServerException mse);
  list<MediaObjectRef> getMediaSrcsByMediaType(1: MediaObjectRef mediaElement, 2: MediaType mediaType) throws (1: MediaServerException mse);
  list<MediaObjectRef> getMediaSinksByMediaType(1: MediaObjectRef mediaElement, 2: MediaType mediaType) throws (1: MediaServerException mse);
  list<MediaObjectRef> getMediaSrcsByFullDescription(1: MediaObjectRef mediaElement, 2: MediaType mediaType, 3: string description) throws (1: MediaServerException mse);
  list<MediaObjectRef> getMediaSinksByFullDescription(1: MediaObjectRef mediaElement, 2: MediaType mediaType, 3: string description) throws (1: MediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaPad objects
  /////////////////////////////////////////////////////////////////////////////////
  void connect(1: MediaObjectRef mediaSrc, 2: MediaObjectRef mediaSink) throws (1: MediaServerException mse);
  void disconnect(1: MediaObjectRef mediaSrc, 2: MediaObjectRef mediaSink) throws (1: MediaServerException mse);
  list<MediaObjectRef> getConnectedSinks(1: MediaObjectRef mediaSrc) throws (1: MediaServerException mse);
  MediaObjectRef getConnectedSrc(1: MediaObjectRef mediaSinkRef) throws (1: MediaServerException mse);
  MediaObjectRef getMediaElement(1: MediaObjectRef mediaPadRef) throws (1: MediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to Mixer objects
  /////////////////////////////////////////////////////////////////////////////////
  MediaObjectRef createMixerEndPoint(1: MediaObjectRef mixer) throws (1: MediaServerException mse);
  MediaObjectRef createMixerEndPointWithParams(1: MediaObjectRef mixer, 2: Params params) throws (1: MediaServerException mse);
}
