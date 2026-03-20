copy %SRC_DIR%\cmake\apr-iconv\CMakeLists.txt %SRC_DIR%\CMakeLists.txt
if errorlevel 1 exit 1

cmake -GNinja ^
    -S%SRC_DIR% ^
    -B%SRC_DIR%\build ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
if errorlevel 1 exit 1

cmake --build %SRC_DIR%\build -- install
if errorlevel 1 exit 1
