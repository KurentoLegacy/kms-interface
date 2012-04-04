namespace * com.kurento.kms.api

include "joinable.thrift"

struct JoinableContainer {
	1: required joinable.Joinable parent;
}

exception JoinableContainerNotFoundException {
}

enum StreamType {
	AUDIO,
	VIDEO,
}

struct JoinableStream {
	1: required joinable.Joinable parent;
	2: required JoinableContainer container;
	3: required StreamType streamType;
}

exception JoinableStreamNotFoundException {
}

service JoinableContainerService extends joinable.JoinableService {
	JoinableStream getJoinableStream(1: JoinableContainer container, 2: StreamType value) throws (1: JoinableContainerNotFoundException jcnfs, 2: JoinableStreamNotFoundException jsnf);

	list<JoinableStream> getJoinableStreams(1: JoinableContainer container) throws (1: JoinableContainerNotFoundException jcnfs);
}
