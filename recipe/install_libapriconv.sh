#!/bin/sh

cd "${SRC_DIR}/apr-iconv"
cp $BUILD_PREFIX/share/gnuconfig/config.* build
./configure --prefix="${PREFIX}" --with-apr="${PREFIX}"
make
make install
