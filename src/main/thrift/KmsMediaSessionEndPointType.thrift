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

/**
 * Abstract Type (non instantiable)
 * SessionEndPoint extends KmsMediaObject
 */

/* EVENTS */

/**
On HttpEndPoints this event is generated when the end point receives the
first HTTP request requesting for media. For subsequent request of the same
session this event is not generated.

On RTP and similar end points this event is generated when the RTP
exchange starts, either by send, receive or send/receive of media packages.

This event has void (inexistent) data
*/
const string EVENT_MEDIA_SESSION_START = "MediaSessionStart";

/**
On HttpEndPoints this event is generated whenever the media session is
considered terminated. This occurs when the underlying TCP connection
is lost and either the HTTP session or of reconnection timeout expired.

On RTP and similar end-points this event is generated when the media
exchange

This event has void (inexistent) data
*/
const string EVENT_MEDIA_SESSION_COMPLETE = "MediaSessionComplete";
