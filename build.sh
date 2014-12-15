#!/bin/bash -xe
LUA_ROOT=${1:-"$HOME/cs164lua"}
rm -r CMakeFiles
rm *.cmake
rm CMakeCache.txt
cmake \
		-DWITH_LUAVER=53 \
		-DWITH_MIXER=On \
		-DWITH_TTF=On \
		-DWITH_NET=On \
		-DWITH_IMAGE=On \
		-DLUA53_LIBRARY="$LUA_ROOT/src/liblua.so" \
		-DLUA53_INCLUDE_DIR="$LUA_ROOT/src" \
		-DCMAKE_BUILD_TYPE=Debug
make
make DESTDIR=install install
cp -r install/usr/local/lib/lua/5.3/SDL install/usr/local/lib/lua/5.3/SDL.so $LUA_ROOT
