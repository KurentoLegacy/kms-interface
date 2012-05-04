/*
kms-interface: Thrift interfaces for mediaserver
Copyright (C) 2012 Tikal Technologies

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

namespace * com.kurento.kms.api

include "common.thrift"
include "joinable.thrift"
include "sessionSpec.thrift"

enum NetworkConnectionConfig {
	RTP,
	RTMP,
}

struct NetworkConnection {
	1: required joinable.Joinable joinable,
	2: required list<NetworkConnectionConfig> config,
}

exception NetworkConnectionNotFoundException {
}

exception NegotiationException {
	1: required string description,
}

service NetworkConnectionService extends joinable.JoinableService {
	sessionSpec.SessionSpec generateOffer(1: NetworkConnection nc) throws (1: NetworkConnectionNotFoundException ncnfe, 2: common.MediaServerException mse),
	sessionSpec.SessionSpec processAnswer(1: NetworkConnection nc, 2: sessionSpec.SessionSpec anwser) throws (1: NetworkConnectionNotFoundException ncnfe, 2: NegotiationException ne, 3: common.MediaServerException mse),
	sessionSpec.SessionSpec processOffer(1: NetworkConnection nc, 2: sessionSpec.SessionSpec offer) throws (1: NetworkConnectionNotFoundException ncnfe, 2: NegotiationException ne, 3: common.MediaServerException mse),

	sessionSpec.SessionSpec getLocalDescriptor(1: NetworkConnection nc) throws (1: NetworkConnectionNotFoundException ncnfe, 2: common.MediaServerException mse),
	sessionSpec.SessionSpec getRemoteDescriptor(1: NetworkConnection nc) throws (1: NetworkConnectionNotFoundException ncnfe, 2: NegotiationException ne, 3: common.MediaServerException mse),
}
