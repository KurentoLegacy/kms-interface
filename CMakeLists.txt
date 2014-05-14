cmake_minimum_required(VERSION 2.8)

set (PROJECT_NAME "kms-interface-rom")

project (${PROJECT_NAME})

find_program(GIT_EXEC git)

SET (TAG "${PROJECT_NAME}-")

execute_process(COMMAND ${GIT_EXEC} rev-parse --git-dir OUTPUT_VARIABLE GIT_DIR
                OUTPUT_STRIP_TRAILING_WHITESPACE)

if(EXISTS ${GIT_EXEC} AND EXISTS "${GIT_DIR}")
  execute_process(COMMAND ${GIT_EXEC} submodule init WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
  execute_process(COMMAND ${GIT_EXEC} submodule update WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
  execute_process(COMMAND ${GIT_EXEC} remote update WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
  execute_process(COMMAND ${GIT_EXEC} describe --abbrev=6 --tags --dirty --always --match "${TAG}*"
                  OUTPUT_VARIABLE PROJECT_VERSION
                  OUTPUT_STRIP_TRAILING_WHITESPACE
                  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
  string(REGEX REPLACE "^${TAG}(.*)" "\\1" PROJECT_VERSION ${PROJECT_VERSION})
  if (NOT EXISTS ${GIT_DIR}/hooks/pre-commit)
    execute_process(COMMAND ln -s ${CMAKE_CURRENT_SOURCE_DIR}/hooks/pre-commit.hook
                    "${GIT_DIR}/hooks/pre-commit")
  endif ()
else()
  set(PROJECT_MAJOR_VERSION 4)
  set(PROJECT_MINOR_VERSION 2)
  set(PROJECT_PATCH_VERSION 3-dev)
  set(PROJECT_VERSION
      ${PROJECT_MAJOR_VERSION}.${PROJECT_MINOR_VERSION}.${PROJECT_PATCH_VERSION})
endif()

# TODO: Check if HAVE_INIT_TYPES_H has to be added (not in all systems)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic -Wall -DHAVE_INTTYPES_H -std=c++0x")

find_program(THRIFT_EXEC thrift)

IF(NOT EXISTS ${THRIFT_EXEC})
	MESSAGE(FATAL_ERROR "Thrift not found")
ENDIF(NOT EXISTS ${THRIFT_EXEC})

MESSAGE(STATUS "Thrift found: ${THRIFT_EXEC}")

find_package(PkgConfig)

pkg_check_modules(THRIFT REQUIRED thrift=0.9.0)

CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/kms_interface_config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/kms_interface_config.h)

set(GEN_H_FILES ${CMAKE_CURRENT_BINARY_DIR}/kms_interface_config.h)

set(THRIFT_FILES_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/main/thrift)
set(GEN_FILES_DIR ${CMAKE_BINARY_DIR}/gen-cpp)
FILE(MAKE_DIRECTORY ${GEN_FILES_DIR})

FILE(GLOB THRIFT_FILES ${THRIFT_FILES_DIR}/*.thrift)

function(get_base_name thrift_file out_base_name)
	STRING(REGEX REPLACE "[/]+(([^/]+)[/]+)+(.*).thrift\$" "\\3" base_name "${thrift_file}")
	SET(${out_base_name} ${base_name} PARENT_SCOPE)
endfunction(get_base_name)

FOREACH(THRIFT_FILE ${THRIFT_FILES})
	SET(CUR_GEN_CPP_FILES "")
	get_base_name(${THRIFT_FILE} BASE_NAME)
	MESSAGE(STATUS "Processing thrift file: ${BASE_NAME}.thrift")

	SET(CPP_FILE "${GEN_FILES_DIR}/${BASE_NAME}_types.cpp")
	SET(CUR_GEN_CPP_FILES ${CUR_GEN_CPP_FILES} ${CPP_FILE})
	SET(CPP_FILE "${GEN_FILES_DIR}/${BASE_NAME}_constants.cpp")
	SET(CUR_GEN_CPP_FILES ${CUR_GEN_CPP_FILES} "${CPP_FILE}")

	SET(H_FILE "${GEN_FILES_DIR}/${BASE_NAME}_types.h")
	SET(GEN_H_FILES ${GEN_H_FILES} ${H_FILE})
	SET(H_FILE "${GEN_FILES_DIR}/${BASE_NAME}_constants.h")
	SET(GEN_H_FILES ${GEN_H_FILES} "${H_FILE}")

	execute_process(COMMAND grep service ${THRIFT_FILE}
			COMMAND cut -d " " -f 2
			OUTPUT_VARIABLE SERVICE_NAME)

	IF(NOT ${SERVICE_NAME} EQUAL "")
		STRING(REPLACE "\n" "" SERVICE_NAME ${SERVICE_NAME})
		MESSAGE (STATUS "Found service: ${SERVICE_NAME}")
		SET(CPP_FILE "${GEN_FILES_DIR}/${SERVICE_NAME}.cpp")
		SET(CUR_GEN_CPP_FILES ${CUR_GEN_CPP_FILES} "${CPP_FILE}")

		SET(H_FILE "${GEN_FILES_DIR}/${SERVICE_NAME}.h")
		SET(GEN_H_FILES ${GEN_H_FILES} "${H_FILE}")
	ENDIF(NOT ${SERVICE_NAME} EQUAL "")

	SET(GEN_CPP_FILES ${GEN_CPP_FILES} ${CUR_GEN_CPP_FILES})

	FOREACH(CPP_FILE ${CUR_GEN_CPP_FILES})
		ADD_CUSTOM_COMMAND(
			COMMENT		"Generating source from: ${BASE_NAME}.thrift"

			OUTPUT		"${CPP_FILE}"

			DEPENDS		"${THRIFT_FILE}"

			COMMAND		${THRIFT_EXEC}
			ARGS		--gen cpp -out "${GEN_FILES_DIR}"
					"${THRIFT_FILE}"
		)
	ENDFOREACH(CPP_FILE)
ENDFOREACH(THRIFT_FILE)

SET(ALL_INCLUDES "${GEN_H_FILES}" "${THRIFT_FILES}")

add_library(kmsiface ${GEN_CPP_FILES})

set_target_properties(kmsiface PROPERTIES
		PUBLIC_HEADER	"${ALL_INCLUDES}"
)

include_directories(kmsiface ${THRIFT_INCLUDE_DIRS})
target_link_libraries(kmsiface ${THRIFT_LIBRARIES})
