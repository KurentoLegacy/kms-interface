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

const string TYPE_NAME = "MainMixer";

/* METHODS */
/**
 * This method allows to set the main mixerEndPoint.
 * void setMainEndPoint (KmsMediaObjectRef mixerEndPoint);
 */
const string SET_MAIN_END_POINT = "setMainEndPoint";
const string SET_MAIN_END_POINT_PARAM_MIXER = "mixerEndPoint";
const string SET_MAIN_END_POINT_PARAM_MIXER_TYPE = "KmsMediaObjectRef";

/**
 * This method allows to unset the main mixerEndPoint.
 * void unsetMainEndPoint ();
 */
const string UNSET_MAIN_END_POINT = "unsetMainEndPoint";
