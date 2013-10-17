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
 * Abstract base type. All other elements should extend form this class.
 *
 * Constructors:
 * MediaObject(KmsMediaObjectConstructorParams);
 */

const string CONSTRUCTOR_PARAMS_DATA_TYPE = "KmsMediaObjectConstructorParams";

struct KmsMediaObjectConstructorParams {
  1: optional bool excludeFromGC,
  2: optional i32 garbageCollectorPeriod
}
