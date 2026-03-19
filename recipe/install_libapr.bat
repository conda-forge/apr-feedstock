cmake -GNinja ^
    -S%SRC_DIR% ^
    -B%SRC_DIR%\build ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%
if errorlevel 1 exit 1

cmake --build %SRC_DIR%\build -- install
if errorlevel 1 exit 1
