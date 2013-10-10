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
 * UriEndPoint extends KmsMediaObject
 *
 * Constructors:
 * UriEndPoint (KmsMediaUriEndPointConstructorParams);
 * UriEndPoint (KmsMediaUriEndPointConstructorParams, KmsMediaObjectConstructorParams);
 */

const string CONSTRUCTOR_PARAMS_DATA_TYPE = "KmsMediaUriEndPointConstructorParams";

struct KmsMediaUriEndPointConstructorParams {
  1: string uri
}

/* COMMANDS */

/**
This command requests an UriEndPoint to provide its local uri

String getUri ();
*/
const string GET_URI = "getUri";

/**
This command requests an UriEndPoint assing its Uri

void setUri (String uri);
*/
const string SET_URI = "setUri";
const string SET_URI_PARAM_URI_STR = "uri";

/**
This command requests an UriEndPoint to start its media operation (ex. play)

void start ();
*/
const string START = "start";

/**
This command requests an UriEndPoint to pause

void pause ();
*/
const string PAUSE = "pause";

/**
This command requests an UriEndPoint to stop its media operation

void stop ();
*/
const string STOP = "stop";
