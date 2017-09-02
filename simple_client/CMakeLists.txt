cmake_minimum_required(VERSION 3.5)
project(simple_client)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/../3rd_party/libssh/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../3rd_party/openssl/include
)

link_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/../3rd_party/openssl
        ${CMAKE_CURRENT_SOURCE_DIR}/../3rd_party/libssh.build/src
)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

set(SOURCE_FILES main.cpp)
add_executable(simple_client ${SOURCE_FILES})

target_link_libraries(simple_client crypto ssl ssh)

