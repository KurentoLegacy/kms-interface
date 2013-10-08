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

/* CODE RANGE */
const i32 MIN = 40000;
const i32 MAX = 49999;

/* GENERIC MEDIA ERRORS */
const i32 MEDIA_ERROR_MIN = 40000;
const i32 MEDIA_ERROR_MAX = 40099;
const i32 MEDIA_ERROR = 40000;
const i32 MARSHALL_ERROR = 40001;
const i32 UNMARSHALL_ERROR = 40002;
const i32 UNEXPECTED_ERROR = 40003;

/* MediaObject ERRORS */
const i32 MEDIA_OBJECT_ERROR_MIN = 40100;
const i32 MEDIA_OBJECT_ERROR_MAX = 40199;
const i32 MEDIA_OBJECT_TYPE_NOT_FOUND = 40100;
const i32 MEDIA_OBJECT_NOT_FOUND = 40101;
const i32 MEDIA_OBJECT_CAST_ERROR = 40102;
const i32 MEDIA_OBJECT_HAS_NOT_PARENT = 40103;
const i32 MEDIA_OBJECT_CONSTRUCTOR_NOT_FOUND = 40104;
const i32 MEDIA_OBJECT_COMMAND_NOT_FOUND = 40105;
const i32 MEDIA_OBJECT_EVENT_NOT_SUPPORTED = 40106;

/* SDP ERRORS */
const i32 SDP_ERROR_MIN = 40200;
const i32 SDP_ERROR_MAX = 40299;
const i32 SDP_CREATE_ERROR = 40200;
const i32 SDP_PARSE_ERROR = 40201;
const i32 SDP_END_POINT_NO_LOCAL_SDP_ERROR = 40202;
const i32 SDP_END_POINT_NO_REMOTE_SDP_ERROR = 40203;
const i32 SDP_END_POINT_GENERATE_OFFER_ERROR = 40204;
const i32 SDP_END_POINT_PROCESS_OFFER_ERROR = 40205;
const i32 SDP_END_POINT_PROCESS_ANSWER_ERROR = 40206;

/* HTTP ERRORS */
const i32 HTTP_ERROR_MIN = 40300;
const i32 HTTP_ERROR_MAX = 40399;
const i32 HTTP_END_POINT_REGISTRATION_ERROR = 40300;
