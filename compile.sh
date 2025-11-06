#!/bin/bash

set -e

# Prerequisites:
# 1. Install necessary tools
#    `sudo apt install mingw-w64 binutils-mingw-w64 gcc-mingw-w64 g++-mingw-w64`
#    `sudo apt install make autoconf automake libtool autopoint`

CC=x86_64-w64-mingw32-gcc
CXX=x86_64-w64-mingw32-c++
LD=x86_64-w64-mingw32-ld
AR=x86_64-w64-mingw32-ar
AS=x86_64-w64-mingw32-as
NM=x86_64-w64-mingw32-nm
STRIP=x86_64-w64-mingw32-strip
RANLIB=x86_64-w64-mingw32-ranlib
DLLTOOL=x86_64-w64-mingw32-dlltool
OBJDUMP=x86_64-w64-mingw32-objdump
RESCOMP=x86_64-w64-mingw32-windres
WINDRES=x86_64-w64-mingw32-windres

./configure --disable-shared --enable-static --host=x86_64-w64-mingw32 LDFLAGS="-static"
make -j$(nproc)
echo "Build completed successfully."
echo "fswatch executable is located at: $(pwd)/fswatch/src/fswatch.exe"
echo "If you run the exe, it may need to bring some DLLs:"
echo "    libgcc_s_seh-1.dll (/usr/lib/gcc/x86_64-w64-mingw32/13-win32/libgcc_s_seh-1.dll)"
echo "    libstdc++-6.dll (/usr/lib/gcc/x86_64-w64-mingw32/13-win32/libstdc++-6.dll)"
