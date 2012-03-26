namespace * com.kurento.kms.api

enum ErrorCode {
	NO_RESOURCES,
	NOT_FOUND,
	UNEXPECTED,
}

exception MediaServerException {
	1: required string description;
	2: ErrorCode code = ErrorCode.UNEXPECTED,
}

exception NotFoundException {
	1: string description;
}
