/*
kms-interface: Thrift interfaces for mediaserver
Copyright (C) 2013 Tikal Technologies

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

////////////////////////////////////////////////////////////////////////////////
/**
On HttpEndPoints this event is generated when the end point receives the
first HTTP request requesting for media. For subsequent request of the same
session this event is not generated.

On Rtp and similar end points this event is generated when the RTP
exchange starts, either by send, receive or send/receive of media packages.

This event has void (inexistent) data
*/
const string MEDIA_SESSION_START = "MediaSessionStart";

////////////////////////////////////////////////////////////////////////////////
/**
This event is generated by HttpEndPoints whenever an HTTP request is
received.

This event has HttpRequestReceivedData data type
*/
const string HTTP_REQUEST_RECEIVED = "HttpRequestReceived";

enum HttpMethod {
  GET,
  POST,
  OTHER
}

struct HttpRequestReceivedData {
 1: HttpMethod method,
 2: string uri,
 3: list<string> headers
}

////////////////////////////////////////////////////////////////////////////////
/**
On HttpEndPoints this event is generated whenever the media session is
considered terminated. This occurs when the underlying TCP connection
is lost and either the HTTP session or of reconnection timeout expired.

On Rtp and similar end-points this event is generated when the media
exchange

This event has void (inexistent) data
*/
const string MEDIA_SESSION_COMPLETE = "MediaSessionComplete";

////////////////////////////////////////////////////////////////////////////////
/**
This event is generated by Video Content Analysis (Computer Vision)
filters, which find an string on the media stream. For example
ZBarFilter and PlateRecognitionFilter generate this event.

This event has VcaStringFoundData data type.
*/
const string VCA_STRING_FOUND = "VcaStringFound";

struct VcaStringFoundData {
  1: string valueType, //Application dedendant. Ex. qr-code, plate, etc.
  2: string value
}

