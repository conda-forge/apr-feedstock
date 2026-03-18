#!/bin/sh

set -x

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build

./configure --prefix="${PREFIX}" --host="${HOST}" --with-apr="${PREFIX}" \
            --without-iconv --without-sqlite3
make
make install
