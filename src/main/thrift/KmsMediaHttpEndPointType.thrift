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
 * HttpEndPoint extends MediaSessionEndPoint
 *
 * Constructors:
 * HttpEndPoint ();
 * HttpEndPoint (KmsMediaHttpEndPointConstructorParams);
 * HttpEndPoint (KmsMediaHttpEndPointConstructorParams, KmsMediaObjectConstructorParams);
 * HttpEndPoint (KmsMediaObjectConstructorParams);
 */
const string TYPE_NAME = "HttpEndPoint";

const string CONSTRUCTOR_PARAMS_DATA_TYPE = "KmsMediaHttpEndPointConstructorParams";

struct KmsMediaHttpEndPointConstructorParams {
  2: optional i32 disconnectionTimeout
  3: optional bool terminateOnEOS
}

/* METHODS */

/**
This method requests an HttpEndPoint to provide its associated URL.

String getUrl ();
*/
const string GET_URL = "getUrl";

/* EVENTS */

/**
 * This event is raised when an End of Stream is detected at the input of this element
 * if this element is not live it will also terminate the HTTP Session closing the
 * connection with the client
 *
 * This event has void (inexistent) data
 */
const string EVENT_EOS_DETECTED = "EOS_DETECTED";
