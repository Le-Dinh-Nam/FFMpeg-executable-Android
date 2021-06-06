#!/bin/bash
NDK=$1
PLATFORM=$NDK/platforms/android-16/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
PREFIX=./android/arm

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=arm-linux \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --sysroot=$PLATFORM \
  --disable-cli \
  --disable-win32thread \
  --disable-debug 

  make clean
  make
  make install
}

build_one

echo Android ARM builds finished
