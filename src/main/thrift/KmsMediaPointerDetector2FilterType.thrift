/*
 * (C) Copyright 2014 Kurento (http://kurento.org/)
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

include "KmsMediaComputerVision.thrift"
include "KmsMediaPointerDetectorFilterType.thrift"

struct KmsMediaPointerDetector2ConstructorParams {
  1: required KmsMediaComputerVision.KmsMediaImageRegion colorCalibrationRegion,
  2: optional KmsMediaPointerDetectorFilterType.KmsMediaPointerDetectorWindowSet windowSet
}

/**
 * PointerDetector2Filter Extends KmsMediaObject
 *
 * Constructors:
 * PointerDetector2Filter (KmsMediaObjectConstructorParams);
 * PointerDetector2Filter (KmsMediaObjectConstructorParams, KmsMediaPointerDetector2ConstructorParams);
 */
const string TYPE_NAME = "PointerDetector2Filter";
const string CONSTRUCTOR_PARAMS_DATA_TYPE = "KmsMediaPointerDetector2ConstructorParams";

/* METHODS */
/**
 * This method allows to define a new window.
 * void addWindow (KmsMediaPointerDetectorWindow window);
 */
const string ADD_NEW_WINDOW = "addWindow";
const string ADD_NEW_WINDOW_PARAM_WINDOW= "window";
const string ADD_NEW_WINDOW_PARAM_WINDOW_TYPE= "KmsMediaPointerDetectorWindow";

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

/**
 * This method allows to calibrate the tracking color. The new tracking color
 * will be the color into the colorCalibrationRegion.
 * void trackColorFromCalibrationRegion ();
 */
const string TRACK_COLOR_FROM_CALIBRATION_REGION = "trackColorFromCalibrationRegion";

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