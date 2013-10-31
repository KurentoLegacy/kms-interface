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
 * PlateDetectorFilter Extends KmsMediaObject
 *
 * Constructors:
 * PlateDetectorFilter (KmsMediaObjectConstructorParams);
 */
const string TYPE_NAME = "PlateDetectorFilter";

/* EVENTS */

/**
This event is generated when a license plate is detected.
This event has string data type indicating plate characters.
*/
const string EVENT_PLATE_DETECTED = "plate-detected";

/**
This event is generated when a detected license plate is no longer detected
This event has string data type indicating the plate no longer detected
*/
const string EVENT_PLATE_LOST = "plate-lost";
