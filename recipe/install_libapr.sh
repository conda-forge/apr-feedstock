#!/bin/sh

set -x

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" && $target_platform == "osx-arm64" ]]; then
  export ac_cv_file__dev_zero=yes
  export ac_cv_func_setpgrp_void=yes
  export apr_cv_process_shared_works=yes
  export apr_cv_mutex_robust_shared=no
  export apr_cv_mutex_recursive=yes
  export apr_cv_tcp_nodelay_with_cork=no
  export ac_cv_sizeof_struct_iovec=16
  export ap_cv_atomic_builtins=yes
  export apr_cv_gai_addrconfig=yes
  export ac_cv_sizeof_pid_t=4
fi

autoreconf -vfi

./configure --prefix="${PREFIX}" --host="${HOST}"

make
make install

# The installed libtool ($PREFIX/build-1/libtool) contains hardcoded absolute paths
# to the compiler in $BUILD_PREFIX (e.g. .../build_env/bin/x86_64-conda-linux-gnu-cc).
# That absolute path won't exist for downstream packages or end users. Strip the
# directory so libtool uses just the compiler name, which will be found on $PATH.
# Strip hardcoded BUILD_PREFIX paths from libtool so downstream packages
# find the compiler on $PATH instead of an absolute build-env path.
sed "s|${BUILD_PREFIX}/bin/||g" "${PREFIX}/build-1/libtool" > "${PREFIX}/build-1/libtool.tmp"
mv "${PREFIX}/build-1/libtool.tmp" "${PREFIX}/build-1/libtool"
