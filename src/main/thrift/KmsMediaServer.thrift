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

typedef i64 KmsMediaObjectId

//Reserved for internal errors caused by miss-behavior of the media server
exception KmsMediaServerException {
  1: string description,
  2: i32 errorCode
}

enum KmsMediaPadDirection {
  SINK,
  SRC
}

enum KmsMediaType {
  AUDIO,
  VIDEO,
  DATA
}

struct KmsMediaElement {
  1: string elementType
}

struct KmsMediaPipeline {
}

struct KmsMediaPad {
  1: KmsMediaPadDirection direction,
  2: KmsMediaType mediaType,
  3: string mediaDescription //subtype of media. Useful for "data" KmsMediaType. Ex. location, accelerometer, etc.
}

struct KmsMediaMixer {
  1: string mixerType //type of mixer indicating mixing style.
}

union KmsMediaObjectType {
  1: optional KmsMediaPipeline pipeline,
  2: optional KmsMediaElement element,
  3: optional KmsMediaPad pad,
  4: optional KmsMediaMixer mixer
}

//class simulating a "parent" of all MediaObjects. Useful for consolidating methods
struct KmsMediaObjectRef {
  1: KmsMediaObjectId id, //This may be a union of the rest of types, so that it works on common calls
  2: string token,
  3: KmsMediaObjectType objectType
}

struct KmsMediaParams {
  1: string dataType,
  2: optional binary data
}

struct KmsMediaCommand {
  1: string name,
  2: KmsMediaParams params
}

typedef KmsMediaParams KmsMediaCommandResult

service KmsMediaServerService {
  i32 getVersion();

  /////////////////////////////////////////////////////////////////////////////////
  //Common methods for all media objects
  ////////////////////////////////////////////////////////////////////////////////

  //Invoke this method each GarbagePeriod seconds in order to avoid the MediaObject to be garbage collected
  void keepAlive(1: KmsMediaObjectRef mediaObjectRef) throws (1: KmsMediaServerException mse);
  //Explicity release a MediaObject form memory. All its descendants will be also released and collected.
  void release(1: KmsMediaObjectRef mediaObjectRef) throws (1: KmsMediaServerException mse);

  //Invoke this for receiving events form a MediaObject. This method returns a callbackToken that needs to be used for unsubscribing and that will be present on all events.
  string subscribe(1: KmsMediaObjectRef mediaObjectRef, 2: string eventType, 3: string handlerAddress, 4: i32 handlerPort) throws (1: KmsMediaServerException mse);
  //Invoke this for stop receiving events form a MediaObject. The parameter callbackToken must match the one returned by subscribe to the listener.
  void unsubscribe(1: KmsMediaObjectRef mediaObjectRef, 2: string callbackToken) throws (1: KmsMediaServerException mse);

  //Send a comand to a media object
  KmsMediaCommandResult sendCommand(1: KmsMediaObjectRef mediaObjectRef, 2: KmsMediaCommand command) throws (1: KmsMediaServerException mse);

  //Returns the parent (object that created it) of a MediaObject
  KmsMediaObjectRef getParent(1: KmsMediaObjectRef mediaObjectRef) throws (1: KmsMediaServerException mse);
  //Returns the pipeline to which this MediaObjects belong, or the pipeline itself if the argument references a pipeline
  KmsMediaObjectRef getMediaPipeline(1: KmsMediaObjectRef mediaObjectRef) throws (1: KmsMediaServerException mse);

   /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaPipeline object
  /////////////////////////////////////////////////////////////////////////////////
  KmsMediaObjectRef createMediaPipeline() throws (1: KmsMediaServerException mse);
  KmsMediaObjectRef createMediaPipelineWithParams(1: KmsMediaParams params) throws (1: KmsMediaServerException mse);
  KmsMediaObjectRef createMediaElement(1: KmsMediaObjectRef mediaPipeline, 2: string elementType) throws (1: KmsMediaServerException mse);
  KmsMediaObjectRef createMediaElementWithParams(1: KmsMediaObjectRef mediaPipeline, 2: string elementType, 3: KmsMediaParams params) throws (1: KmsMediaServerException mse);
  KmsMediaObjectRef createMediaMixer(1: KmsMediaObjectRef mediaPipeline, 2: string mixerType) throws (1: KmsMediaServerException mse);
  KmsMediaObjectRef createMediaMixerWithParams(1: KmsMediaObjectRef mediaPipeline, 2: string mixerType, 3: KmsMediaParams params) throws (1: KmsMediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaElement objects
  /////////////////////////////////////////////////////////////////////////////////
  list<KmsMediaObjectRef> getMediaSrcs(1: KmsMediaObjectRef mediaElement) throws (1: KmsMediaServerException mse);
  list<KmsMediaObjectRef> getMediaSinks(1: KmsMediaObjectRef mediaElement)  throws (1: KmsMediaServerException mse);
  list<KmsMediaObjectRef> getMediaSrcsByMediaType(1: KmsMediaObjectRef mediaElement, 2: KmsMediaType mediaType) throws (1: KmsMediaServerException mse);
  list<KmsMediaObjectRef> getMediaSinksByMediaType(1: KmsMediaObjectRef mediaElement, 2: KmsMediaType mediaType) throws (1: KmsMediaServerException mse);
  list<KmsMediaObjectRef> getMediaSrcsByFullDescription(1: KmsMediaObjectRef mediaElement, 2: KmsMediaType mediaType, 3: string description) throws (1: KmsMediaServerException mse);
  list<KmsMediaObjectRef> getMediaSinksByFullDescription(1: KmsMediaObjectRef mediaElement, 2: KmsMediaType mediaType, 3: string description) throws (1: KmsMediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to MediaPad objects
  /////////////////////////////////////////////////////////////////////////////////
  void connect(1: KmsMediaObjectRef mediaSrc, 2: KmsMediaObjectRef mediaSink) throws (1: KmsMediaServerException mse);
  void disconnect(1: KmsMediaObjectRef mediaSrc, 2: KmsMediaObjectRef mediaSink) throws (1: KmsMediaServerException mse);
  list<KmsMediaObjectRef> getConnectedSinks(1: KmsMediaObjectRef mediaSrc) throws (1: KmsMediaServerException mse);
  KmsMediaObjectRef getConnectedSrc(1: KmsMediaObjectRef mediaSinkRef) throws (1: KmsMediaServerException mse);
  KmsMediaObjectRef getMediaElement(1: KmsMediaObjectRef mediaPadRef) throws (1: KmsMediaServerException mse);

  /////////////////////////////////////////////////////////////////////////////////
  // Methods associated to Mixer objects
  /////////////////////////////////////////////////////////////////////////////////
  KmsMediaObjectRef createMixerEndPoint(1: KmsMediaObjectRef mixer) throws (1: KmsMediaServerException mse);
  KmsMediaObjectRef createMixerEndPointWithParams(1: KmsMediaObjectRef mixer, 2: KmsMediaParams params) throws (1: KmsMediaServerException mse);
}
