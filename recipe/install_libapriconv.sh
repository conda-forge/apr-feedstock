#!/bin/sh

cd "${SRC_DIR}/apr-iconv"
cp $BUILD_PREFIX/share/gnuconfig/config.* build
./configure \
    --with-apr="${PREFIX}" \
    --prefix="${PREFIX}" \
    --disable-static
make -j${CPU_COUNT}
make install
