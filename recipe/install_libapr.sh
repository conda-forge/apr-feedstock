#!/bin/sh

cd "${SRC_DIR}/apr"
cp $BUILD_PREFIX/share/gnuconfig/config.* build
./configure --prefix="${PREFIX}"
make
make install
