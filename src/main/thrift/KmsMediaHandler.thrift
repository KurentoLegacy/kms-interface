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

include "KmsMediaServer.thrift"

typedef KmsMediaServer.KmsMediaParam KmsMediaEventData

struct KmsMediaEvent {
  1: string type,
  2: KmsMediaServer.KmsMediaObjectRef source,
  3: optional KmsMediaEventData eventData
}

struct KmsMediaError {
  1: string type,
  2: string description,
  3: i32 errorCode
  4: KmsMediaServer.KmsMediaObjectRef source
}

service KmsMediaHandlerService {
  void onEvent(1: string callbackToken, 2: KmsMediaEvent event);
  void onError(1: string callbackToken, 2: KmsMediaError error);
}
