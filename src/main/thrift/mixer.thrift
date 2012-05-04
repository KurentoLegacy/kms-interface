/*
kms-interface: Thrift interfaces for mediaserver
Copyright (C) 2012 Tikal Technologies

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3
as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

namespace * com.kurento.kms.api

include "joinable.thrift"

enum MixerConfig {
	AUDIO,
	VIDEO,
}

struct Mixer {
	1: required joinable.Joinable joinable,
	2: required list<MixerConfig> config;
}

exception MixerNotFoundException {
}

service MixerService extends joinable.JoinableService {

}