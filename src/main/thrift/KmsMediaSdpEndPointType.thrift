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

/**
 * Abstract Type (non instantiable)
 * SdpEndPoint extends MediaSessionEndPoint
 *
 * Constructors:
 * SdpEndPoint (KmsMediaObjectConstructorParams);
 */

/* METHODS */

/**
This method requests a SdpEndPoint to provide its local session description.

String getLocalSdp ();
*/
const string GET_LOCAL_SDP = "getLocalSdp";

/**
This method requests a SdpEndPoint to provide its remote session description.

String getRemoteSdp ();
*/
const string GET_REMOTE_SDP = "getRemoteSdp";

/**
This method requests a SdpEndPoint to generate an offer.

String generateSdpOffer ();
*/
const string GENERATE_SDP_OFFER = "generateSdpOffer";

/**
This method requests a SdpEndPoint to process an offer.

String processSdpOffer (String offer);
*/
const string PROCESS_SDP_OFFER = "processSdpOffer";
const string PROCESS_SDP_OFFER_PARAM_OFFER_STR = "offer";

/**
This method requests a SdpEndPoint to process an answer.

String processSdpAnswer (String answer);
*/
const string PROCESS_SDP_ANSWER = "processSdpAnswer";
const string PROCESS_SDP_ANSWER_PARAM_ANSWER_STR = "answer";


/* EVENTS */

const string EVENT_MEDIA_TRANSMISSION_DATA_TYPE  = KmsMediaServer.MEDIA_TYPE;

/**
This event is generated when transmission of media has started

This event provides a media transmission data type as parameter
*/
const string EVENT_MEDIA_TRANSMISSION_START = "MediaTransmissionStart";

/**
This event is generated when transmission of media has stopped

This event provides a media transmission data type as parameter
*/
const string EVENT_MEDIA_TRANSMISSION_STOP = "MediaTransmissionStop";

