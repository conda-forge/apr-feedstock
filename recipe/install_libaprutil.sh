#!/bin/sh

cd "${SRC_DIR}/apr-util"
cp $BUILD_PREFIX/share/gnuconfig/config.* build
./configure --prefix="${PREFIX}" --host="${HOST}" --with-apr="${PREFIX}" \
            --with-apr-iconv="./apr-iconv" --without-iconv --without-sqlite3
make
make install
