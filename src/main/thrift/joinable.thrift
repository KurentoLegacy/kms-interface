namespace * com.kurento.kms.api

include "mediaObject.thrift"

enum Direction {
	SEND,
	RECV,
	SEND_RECV,
}

enum StreamType {
	AUDIO,
	VIDEO,
}

struct Joinable {
	1: required mediaObject.MediaObject object;
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

service JoinableService extends mediaObject.MediaObjectService {
	list<StreamType> getStreams(1: Joinable joinable) throws (1: JoinableNotFoundException jnfe),

	void join(1: Joinable from, 2: Joinable to, 3: Direction direction) throws (1: JoinableNotFoundException jnfe, 2: JoinException je),
	void unjoin(1: Joinable from, 2: Joinable to) throws (1: JoinableNotFoundException jnfe, 2: JoinException je),

	void joinStream(1: Joinable from, 2: Joinable to, 3: StreamType stream, 4: Direction direction) throws (1: JoinableNotFoundException jnfe, 2: JoinException je, 3: StreamNotFoundException enfs),
	void unjoinStream(1: Joinable from, 2: Joinable to, 3: StreamType stream) throws (1: JoinableNotFoundException jnfe, 2: JoinException je, 3: StreamNotFoundException enfs),

	list<Joinable> getJoinees(1: Joinable from) throws (1: JoinableNotFoundException jnfe),
	list<Joinable> getDirectionJoiness(1: Joinable from, 2: Direction direction) throws (1: JoinableNotFoundException jnfe),

	list<Joinable> getStreamJoinees(1: Joinable from, 2: StreamType stream) throws (1: JoinableNotFoundException jnfe, 3: StreamNotFoundException enfs),
	list<Joinable> getStreamDirectionJoiness(1: Joinable from, 2: StreamType stream, 3: Direction direction) throws (1: JoinableNotFoundException jnfe, 3: StreamNotFoundException enfs),
}
