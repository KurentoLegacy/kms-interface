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
 * GStreamerFilter Extends KmsMediaObject
 *
 * Constructors:
 * GStreamerFilter (KmsMediaObjectConstructorParams, string command);
 */
const string TYPE_NAME = "GStreamerFilter";
/**
 * command is a MediaParam with a String payload. The format is the same used
 * in gst-launch.
 * Format: element property1=value1 property2=value2 ... propertyN=valueN
 */
const string CONSTRUCTOR_PARAM_GSTREAMER_COMMAND = "command";