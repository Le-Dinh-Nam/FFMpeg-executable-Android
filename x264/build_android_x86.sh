#!/bin/bash
NDK=$1
PLATFORM=$NDK/platforms/android-16/arch-x86/
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/darwin-x86_64
PREFIX=./android/x86

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=i686-linux \
  --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
  --sysroot=$PLATFORM \
  --disable-asm \
  --disable-cli \
  --disable-win32thread \
  --disable-debug 

  make clean
  make
  make install
}

build_one

echo Android x86 builds finished
