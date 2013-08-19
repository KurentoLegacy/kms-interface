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

struct MediaEvent {
  1: binary event,
  2: mediaServer.MediaObjectId source,
}

struct MediaError {
  1: binary error,
  2: mediaServer.MediaObjectId source,
}

service MediaHandlerService {
  void onError (1: MediaError error);
  void onEvent (1: MediaEvent event);
}
