#!/bin/sh

set -x

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build

# Use just the compiler basename so libtool doesn't embed absolute build-env
# paths that won't exist for downstream outputs or end users.
export CC=$(basename "$CC")
export CPP=$(basename "$CPP")
export CXX=$(basename "${CXX:-c++}")

./configure --prefix="${PREFIX}" --host="${HOST}"

make
make install
