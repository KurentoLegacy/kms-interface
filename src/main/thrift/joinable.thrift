namespace * com.kurento.kms.api

include "common.thrift"
include "mediaSpec.thrift"

typedef mediaSpec.Direction Direction

enum StreamType {
	AUDIO,
	VIDEO,
}

struct Joinable {
	1: required common.MediaObject object;
	2: required common.MediaSession session;
}

exception JoinableNotFoundException {
	1: required string description,
}

exception JoinException {
	1: required string description,
}

exception StreamNotFoundException {
	1: required string description,
}

service JoinableService {
	list<StreamType> getStreams(1: Joinable joinable) throws (1: JoinableNotFoundException jnfe, 2: common.MediaServerException mse),

	void join(1: Joinable from, 2: Joinable to, 3: Direction direction) throws (1: JoinableNotFoundException jnfe, 2: JoinException je, 3: common.MediaServerException mse),
	void unjoin(1: Joinable from, 2: Joinable to) throws (1: JoinableNotFoundException jnfe, 2: JoinException je, 3: common.MediaServerException mse),

	void joinStream(1: Joinable from, 2: Joinable to, 3: StreamType stream, 4: Direction direction) throws (1: JoinableNotFoundException jnfe, 2: JoinException je, 3: StreamNotFoundException enfs, 4: common.MediaServerException mse),
	void unjoinStream(1: Joinable from, 2: Joinable to, 3: StreamType stream) throws (1: JoinableNotFoundException jnfe, 2: JoinException je, 3: StreamNotFoundException enfs, 4: common.MediaServerException mse),

	list<Joinable> getJoinees(1: Joinable from) throws (1: JoinableNotFoundException jnfe, 2: common.MediaServerException mse),
	list<Joinable> getDirectionJoinees(1: Joinable from, 2: Direction direction) throws (1: JoinableNotFoundException jnfe, 2: common.MediaServerException mse),

	list<Joinable> getStreamJoinees(1: Joinable from, 2: StreamType stream) throws (1: JoinableNotFoundException jnfe, 3: StreamNotFoundException enfs, 4: common.MediaServerException mse),
	list<Joinable> getStreamDirectionJoinees(1: Joinable from, 2: StreamType stream, 3: Direction direction) throws (1: JoinableNotFoundException jnfe, 3: StreamNotFoundException enfs, 4: common.MediaServerException mse),

	void release(1: Joinable joinable) throws (1: JoinableNotFoundException jnfe, 2: common.MediaServerException mse),
}
