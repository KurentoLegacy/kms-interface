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
 * PlayerEndPoint extends UriEndPoint
 *
 * Constructors:
 * PlayerEndPoint (KmsMediaUriEndPointConstructorParams);
 * PlayerEndPoint (KmsMediaUriEndPointConstructorParams, KmsMediaPlayerEndPointConstructorParams);
 * PlayerEndPoint (KmsMediaUriEndPointConstructorParams, KmsMediaObjectConstructorParams);
 * PlayerEndPoint (KmsMediaUriEndPointConstructorParams, KmsMediaObjectConstructorParams, KmsMediaPlayerEndPointConstructorParams);
 */
const string TYPE_NAME = "PlayerEndPoint";
const string CONSTRUCTOR_PARAMS_DATA_TYPE = "KmsMediaPlayerEndPointConstructorParams";

struct KmsMediaPlayerEndPointConstructorParams {
  /**
   * @param useEncodedMedia This parameter allows to change from raw media
   * to encoded media. If the parameter is TRUE the element uses encoded
   * media. If the parameter is set to FALSE or not set then the element uses
   * raw media.
   * Changing this parameter could affect in a severe way to stability because
   * key frames lost will not be generated.
   * Changing the media type does not affect to the result except in the
   * performance (just in the case where original media and target media are the
   * same) and in the problem with the key frames.
   * We strongly recommended not to use this parameter because correct behaviour
   * is not guarantied.
   */
  1: optional bool useEncodedMedia
}

/* EVENTS */

/**
 * This event has void (inexistent) data
 */
const string EVENT_EOS = "EOS";
