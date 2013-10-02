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
 * Abstract Type (no instantiable)
 * SdpEndPoint extends MediaSessionEndPoint
 */

/* COMMANDS */

/**
This command requests a SdpEndPoint to provide its local session description.

String getLocalSdp ();
*/
const string GET_LOCAL_SDP = "getLocalSdp";

/**
This command requests a SdpEndPoint to provide its remote session description.

String getRemoteSdp ();
*/
const string GET_REMOTE_SDP = "getRemoteSdp";

/**
This command requests a SdpEndPoint to generate an offer.

String generateSdpOffer ();
*/
const string GENERATE_SDP_OFFER = "generateSdpOffer";

/**
This command requests a SdpEndPoint to process an offer.

String processSdpOffer (String sdpOffer);
*/
const string PROCESS_SDP_OFFER = "processSdpOffer";

/**
This command requests a SdpEndPoint to process an answer.

String processSdpAnswer (String sdpAnswer);
*/
const string PROCESS_SDP_ANSWER = "processSdpAnswer";
