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

namespace java com.kurento.kms.thrift.api
namespace cpp kurento
namespace * Kurento

include "mediaServer.thrift"

////////////////////////////////////////////////////////////////////////////////
/**
This command requests media elements their associated URL. Ex. URL of a
given HttpEndPoint

This command has void (inexistent) data
*/
const string GET_URL = "GetUrl";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an SdpEndPoint to process an offer.

This command has string data.
*/
const string PROCESS_SDP_OFFER = "ProcessSdpOffer";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an SdpEndPoint to process an answer.

This command has string data.
*/
const string PROCESS_SDP_ANSWER = "ProcessSdpAnswer";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an SdpEndPoint to offer and SDP

This command has void (inexistent) data.
*/
const string GENERATE_SDP_OFFER = "GenerateSdpOffer";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an SdpEndPoint to provide its local session description

This command has void (inexistent) data.
*/
const string GET_LOCAL_SDP = "GetLocalSdp";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an SdpEndPoint to provide its remote session description

This command has void (inexistent) data.
*/
const string GET_REMOTE_SDP = "GetRemoteSdp";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an UriEndPoint to provide its local uri

This command has void (inexistent) data.
*/
const string GET_URI = "GetUri";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an UriEndPoint assing its Uri

This command has string data.
*/
const string SET_URI = "SetUri";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an UriEndPoint to pause

This command has void (inexistent) data.
*/
const string PAUSE = "Pause";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an UriEndPoint to start its media operation (ex. play)

This command has void (inexistent) data.
*/
const string START = "Start";

////////////////////////////////////////////////////////////////////////////////
/**
This command request an UriEndPoint to stop its media operation

This command has void (inexistent) data.
*/
const string STOP = "Stop";

