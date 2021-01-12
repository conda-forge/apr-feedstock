#!/bin/sh

cd "${SRC_DIR}/apr-util"
cp $BUILD_PREFIX/share/gnuconfig/config.* build
./configure --prefix="${PREFIX}" --host="${HOST}" --with-apr="${PREFIX}" \
            --with-apr-iconv="${PREFIX} --without-iconv --without-sqlite3 --disable-static
make -j${CPU_COUNT}
make install
