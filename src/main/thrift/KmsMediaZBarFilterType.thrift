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
 * ZBarFilter Extends KmsMediaObject
 *
 * Constructors:
 * ZBarFilter (KmsMediaObjectConstructorParams);
 */
const string TYPE_NAME = "ZBarFilter";

/* EVENTS */

/**
This event is generated when a new code (Bar code, QR code, etc.) is found.

This event has string data type.
*/
const string EVENT_CODE_FOUND = "CodeFound";
const string EVENT_CODE_FOUND_DATA_TYPE = "EventCodeFoundData";

struct KmsMediaEventCodeFoundData {
  1: string type,
  2: string value
}
