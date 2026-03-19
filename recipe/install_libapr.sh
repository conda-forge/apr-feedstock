#!/bin/sh

set -x

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build

./configure --prefix="${PREFIX}" --host="${HOST}"

make
make install

# Strip hardcoded BUILD_PREFIX paths from libtool so downstream packages
# find the compiler on $PATH instead of an absolute build-env path.
sed "s|${BUILD_PREFIX}/bin/||g" "${PREFIX}/build-1/libtool" > "${PREFIX}/build-1/libtool.tmp"
mv "${PREFIX}/build-1/libtool.tmp" "${PREFIX}/build-1/libtool"
