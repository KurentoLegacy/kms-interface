namespace * com.kurento.kms.api

enum ErrorCode {
	NO_RESOURCES,
	UNEXPECTED,
}

exception MediaServerException {
	1: required string description;
	2: ErrorCode code = ErrorCode.UNEXPECTED,
}

