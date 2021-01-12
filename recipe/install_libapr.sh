#!/bin/sh

cd "${SRC_DIR}/apr"
cp $BUILD_PREFIX/share/gnuconfig/config.* build
./configure \
    --prefix="${PREFIX}" \
    --disable-static
make -j${CPU_COUNT}
make install
