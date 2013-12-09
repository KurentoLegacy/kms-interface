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
* @param uri URI of the image (file or URL).
* @param offsetXPercent offset relative to x position. A percentage of the detected face width.
* @param offsetYPercent offset relative to y position. A percentage of the detected face height.
* @param widthPercent a percentage to modify the width. The resulting width of the overlay image
*                     will be the percentage of the detected face width.
*                     E.g.: with widthPercent= 2.0, the width of the overlay image will be the double of the detected face width
* @param heightPercent a percentage to modify the height. The resulting height of the overlay image
*                     will be the percentage of the detected face height.
*                     E.g.: with heightPercent= 2.0, the height of the overlay image will be the double of the detected face height
*/
struct KmsMediaFaceOverlayImage {
  1: required string uri,
  2: double offsetXPercent,
  3: double offsetYPercent,
  4: double widthPercent,
  5: double heightPercent
}

/**
 * FaceOverlayFilter Extends KmsMediaObject
 *
 * Constructors:
 * FaceOverlayFilter (KmsMediaObjectConstructorParams);
 */
const string TYPE_NAME = "FaceOverlayFilter";

/* METHODS */
/**
 * This method allows to define a new image to overlay the detected face
 * void setImageOverlay (KmsMediaFaceOverlayImage image);
 */
const string SET_IMAGE_OVERLAY = "setImageOverlay";
const string SET_IMAGE_OVERLAY_PARAM_IMAGE= "image";
const string SET_IMAGE_OVERLAY_PARAM_IMAGE_TYPE= "KmsMediaFaceOverlayImage";
