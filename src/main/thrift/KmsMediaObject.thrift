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
 * Abstract base type. All other elements should extend from this class.
 *
 * Constructors:
 * MediaObject(KmsMediaObjectConstructorParams);
 */

const string CONSTRUCTOR_PARAMS_DATA_TYPE = "KmsMediaObjectConstructorParams";

/**
 * @param collectOnUnreferenced determines if the MediaObject must be released
 *                              when it goes to UNREFERENCED state.
 *                              Default value:
 *                                true for MediaPipeline.
 *                                false for the rest of MediaObjects.
 * @param garbageCollectorPeriod determines the timeout when a MediaObject goes
 *                               to UNREFERENCED state.
 *                               If <= 0, the MediaObject is excluded from GC
 *                               and it always is in REFERENCED state.
 *                               Default value:
 *                                 DEFAULT_GARBAGE_COLLECTOR_PERIOD.
 *
 * STATE TRANSITION
 * At the media server, all collectable MediaObjects have two states: REFERENCED
 * and UNREFERENCED.
 * All media objects are created in the REFERENCED state, and it maintains the
 * REFERENCED state while keep-alives are received for the MediaObject.
 * If the keep-alive timeout (2*garbageCollectorPeriod seconds without any
 * keep-alive) is reached for the MediaObject, it goes to
 * UNREFERENCED (REF -> UNREF) state.
 * If an already created MediaObject reference is obtained, the REFERENCED state
 * is established, so if its state is UNREFERENCED, it goes to
 * REFERENCED (UNREF -> REF).
 *
 * RELEASING
 * The release of a MediaObject depends on the value of collectOnUnreferenced
 * when it goes to UNREFERENCED state, and on the type of the MediaObject.
 * When a MediaPipeline goes to UNREFERENCED state and collectOnUnreferenced is
 * true (by default) it is only collected if all its MediaObjects are in
 * UNREFERENCED state. Otherwise it is not collected until all its MediaObjects
 * go to UNREFERENCED state, and it is in UNREFERENCED state.
 * The rest of MediaObjects (typically MediaElement and MediaMixer) are
 * collected when they go to UNREFERENCED state if collectOnUnreferenced is true
 * (by default they are not collected).
 */
struct KmsMediaObjectConstructorParams {
  1: optional bool collectOnUnreferenced,
  2: optional i32 garbageCollectorPeriod
}
