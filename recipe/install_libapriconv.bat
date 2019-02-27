SET PROJ_DIR=apr-iconv
SET PROJ_LIB=%PROJ_DIR:-=%

SET BUILD_MODE=Release
SET "SHARED_LIBDIR=x64\%BUILD_MODE%"
SET "STATIC_LIBDIR=x64\LibR"

copy %PROJ_DIR%\%SHARED_LIBDIR%\lib%PROJ_LIB%-1.dll %LIBRARY_BIN%\
copy %PROJ_DIR%\%SHARED_LIBDIR%\lib%PROJ_LIB%-1.lib %LIBRARY_LIB%\
IF EXIST %PROJ_DIR%\%SHARED_LIBDIR%\lib%PROJ_LIB%-1.pdb copy %PROJ_DIR%\%SHARED_LIBDIR%\lib%PROJ_LIB%-1.pdb %LIBRARY_BIN%\

mkdir %LIBRARY_PREFIX%\LibR
copy %PROJ_DIR%\%STATIC_LIBDIR%\%PROJ_LIB%-1.lib %LIBRARY_PREFIX%\LibR\
IF EXIST %PROJ_DIR%\%STATIC_LIBDIR%\%PROJ_LIB%-1.pdb copy %PROJ_DIR%\%STATIC_LIBDIR%\%PROJ_LIB%-1.pdb %LIBRARY_PREFIX%\LibR\

xcopy %PROJ_DIR%\include\*.h %LIBRARY_INC%\

IF NOT EXIST %LIBRARY_BIN%\iconv MKDIR %LIBRARY_BIN%\iconv
copy apr-iconv\%SHARED_LIBDIR%\iconv\*.so %LIBRARY_BIN%\iconv
copy apr-iconv\%SHARED_LIBDIR%\iconv\*.pdb %LIBRARY_BIN%\iconv
