/*
kms-interface: Thrift interfaces for mediaserver
Copyright (C) 2013 Tikal Technologies

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3
as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

namespace java com.kurento.kms.api
namespace cpp kurento
namespace * Kurento

include "mediaServer.thrift"

struct KmsEvent {
  1: binary event,
  2: mediaServer.MediaObject source,
}

struct KmsError {
  1: binary error,
  2: mediaServer.MediaObject source,
}

service HandlerService {
  void onError (1: KmsError error);
  void onEvent (1: KmsEvent event);
}
