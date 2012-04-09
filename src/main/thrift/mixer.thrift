namespace * com.kurento.kms.api

include "mediaObject.thrift"
include "joinable.thrift"

enum MixerConfig {
	AUDIO,
	VIDEO,
}

struct Mixer {
	1: required joinable.Joinable parent,
	2: required list<MixerConfig> config;
	3: required mediaObject.MediaSession session,
}

exception MixerNotFoundException {
}

service MixerService extends joinable.JoinableService {

}