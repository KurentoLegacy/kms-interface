namespace * com.kurento.kms.api

include "joinable.thrift"

enum MixerConfig {
	AUDIO,
	VIDEO,
}

struct Mixer {
	1: required joinable.Joinable parent,
	2: required list<MixerConfig> config;
}

exception MixerNotFoundException {
}

service MixerService extends joinable.JoinableService {

}