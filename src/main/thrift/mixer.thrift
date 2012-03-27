namespace * com.kurento.kms.api

include "joinableContainer.thrift"

enum MixerConfig {
	AUDIO,
	VIDEO,
}

struct Mixer {
	1: required joinableContainer.JoinableContainer parent,
	2: required list<MixerConfig> config;
}

exception MixerNotFoundException {
}

service MixerService extends joinableContainer.JoinableContainerService {
	
}