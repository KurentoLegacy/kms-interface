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

include "KmsMediaProfile.thrift"

/**
 * RecorderEndPoint extends UriEndPoint
 *
 * Constructors:
 * RecorderEndPoint (KmsMediaUriEndPointConstructorParams);
 * RecorderEndPoint (KmsMediaUriEndPointConstructorParams, KmsMediaObjectConstructorParams);
 * RecorderEndPoint (KmsMediaUriEndPointConstructorParams, KmsMediaRecoderEndPointConstructorParams);
 * RecorderEndPoint (KmsMediaUriEndPointConstructorParams, KmsMediaObjectConstructorParams,
 *                   KmsMediaRecoderEndPointConstructorParams);
 */
const string TYPE_NAME = "RecorderEndPoint";

const string CONSTRUCTOR_PARAMS_DATA_TYPE = "KmsMediaRecoderEndPointConstructorParams";

/**
* @param profileType Defines the format used to save the media.
* @param stopOnEOS if it is TRUE, forces the recorder end point to finish processing data
                   when an EOS is detected in the stream.
*/
struct KmsMediaRecoderEndPointConstructorParams {
  1: optional KmsMediaProfile.KmsMediaProfile profileType,
  2: optional bool stopOnEOS
}
