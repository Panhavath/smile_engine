#Try it nowAsk again laterDon't show again
cmake_minimum_required(VERSION 3.4.1)  # for example

include_directories(../ios/Classes/includes)

add_library( smile_engine
SHARED
../ios/Classes/SMILE-Engine-Dengue.cpp )

add_library(smile
SHARED
IMPORTED
)

set_target_properties( smile
PROPERTIES IMPORTED_LOCATION
${CMAKE_CURRENT_SOURCE_DIR}/../ios/Classes/targets/arm64-v8a/libsmile.a
)

if("${ANDROID_ABI}" MATCHES "arm64-v8a")
target_link_libraries(smile_engine smile)
endif()

add_library(smile2
SHARED
IMPORTED
)

set_target_properties( smile2
PROPERTIES IMPORTED_LOCATION
${CMAKE_CURRENT_SOURCE_DIR}/../ios/Classes/targets/armeabi-v7a/libsmile.a
)


if("${ANDROID_ABI}" MATCHES "armeabi-v7a")
target_link_libraries(smile_engine smile2)
endif()

#x86
add_library(smile3
SHARED
IMPORTED
)
#
set_target_properties( smile3
PROPERTIES IMPORTED_LOCATION
${CMAKE_CURRENT_SOURCE_DIR}/../ios/Classes/targets/x86/libsmile.a
)


if("${ANDROID_ABI}" MATCHES "x86")
target_link_libraries(smile_engine smile3)
endif()

#x86_64
add_library(smile4
SHARED
IMPORTED
)

set_target_properties( smile4
PROPERTIES IMPORTED_LOCATION
${CMAKE_CURRENT_SOURCE_DIR}/../ios/Classes/targets/x86_64/libsmile.a
)


if("${ANDROID_ABI}" MATCHES "x86_64")
target_link_libraries(smile_engine smile4)
endif()