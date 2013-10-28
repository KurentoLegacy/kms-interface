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

struct KmsMediaPointerDetectorWindow {
  1: required i32 topRightCornerX,
  2: required i32 topRightCornerY,
  3: required i32 width,
  4: required i32 height,
  5: required string id
}

typedef set<KmsMediaPointerDetectorWindow> KmsMediaPointerDetectorWindowSet
/**
 * PointerDetectorFilter Extends KmsMediaObject
 *
 * Constructors:
 * PointerDetectorFilter (KmsMediaObjectConstructorParams);
 * PointerDetectorFilter (KmsMediaObjectConstructorParams, KmsMediaPointerDetectorWindowSet);
 */
const string TYPE_NAME = "PointerDetectorFilter";
const string CONSTRUCTOR_PARAMS_DATA_TYPE = "KmsMediaPointerDetectorWindowSet";

/* METHODS */
/**
 * This method allows to define a new window.
 * void addWindow (KmsMediaPointerDetectorWindow window);
 */
const string ADD_NEW_WINDOW = "addWindow";
const string ADD_NEW_WINDOW_PARAM_WINDOW= "window";

/**
 * This method allows to remove an existing window.
 * void removeWindow (string windowID);
 */
const string REMOVE_WINDOW = "removeWindow";
const string REMOVE_WINDOW_PARAM_WINDOW_ID = "windowID";

/**
 * This method allows to clear all existing windows.
 * void clearWindows ();
 */
const string CLEAR_WINDOWS = "clearWindows";

/* EVENTS */

/**
This event is generated when an object leaves a window.
This event has string data type indicated window id.
*/
const string EVENT_WINDOW_OUT = "window-out";
/**
This event is generated when an object enters in a window.
This event has string data type indicated window id.
*/
const string EVENT_WINDOW_IN = "window-in";
