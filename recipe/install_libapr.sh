#!/bin/sh

set -x

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build

./configure --prefix="${PREFIX}" --host="${HOST}"

make
make install

# Strip hardcoded absolute paths to conda build-env compilers in the installed
# libtool, so downstream outputs/packages find them on $PATH instead.
sed "s|[^ ]*/build_env/bin/||g" "${PREFIX}/build-1/libtool" > "${PREFIX}/build-1/libtool.tmp"
mv "${PREFIX}/build-1/libtool.tmp" "${PREFIX}/build-1/libtool"
