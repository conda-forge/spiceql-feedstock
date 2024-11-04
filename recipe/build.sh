#!/bin/sh
mkdir build && cd build

# to avoid complaints in conda-forge, see https://conda-forge.org/docs/maintainer/knowledge_base/#newer-c-features-with-old-sdk 
export CXXFLAGS="$CXXFLAGS -D_LIBCPP_DISABLE_AVAILABILITY"
cmake ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=RELEASE -DSPICEQL_BUILD_TESTS=OFF  -DPython3_EXECUTABLE=$PYTHON  ..
cmake --build . --config RELEASE
cmake --install . --config RELEASE
