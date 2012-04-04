namespace * com.kurento.kms.api

include "joinable.thrift"

struct JoinableContainer {
	1: required joinable.Joinable parent;
}

exception JoinableContainerNotFoundException {
}

struct JoinableStream {
	1: required joinable.Joinable parent;
}

exception JoinableStreamNotFoundException {
}

enum StreamType {
	AUDIO,
	VIDEO,
}

service JoinableContainerService extends joinable.JoinableService {
	JoinableStream getJoinableStream(1: JoinableContainer container, 2: StreamType value) throws (1: JoinableContainerNotFoundException jcnfs, 2: JoinableStreamNotFoundException jsnf);

	list<JoinableStream> getJoinableStreams(1: JoinableContainer container) throws (1: JoinableContainerNotFoundException jcnfs);
}

service JoinableStreamService extends joinable.JoinableService {
	JoinableContainer getContainer(1: JoinableStream stream) throws (1: JoinableStreamNotFoundException jsnf);

	StreamType getType(1: JoinableStream stream) throws (1: JoinableStreamNotFoundException jsnf);
}
