#!/bin/bash
NDK=$1
SYSROOT=$NDK/platforms/android-21/arch-x86_64
TOOLCHAIN=$NDK/toolchains/x86_64-4.9/prebuilt/linux-x86_64

function build_one
{
  ./configure \
  --prefix=./android/x86_64 \
  --enable-shared \
  --enable-small \
  --enable-ffmpeg \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-yasm \
  --arch=x86_64 \
  --cross-prefix=$TOOLCHAIN/bin/x86_64-linux-android- \
  --enable-cross-compile \
  --sysroot=$SYSROOT \
  --target-os=linux \
  --extra-cflags="-Os -fpic -fPIE -pie" \
	--extra-ldflags="-fPIE -pie" \
  --disable-debug \
  $ADDITIONAL_CONFIGURE_FLAG
  make clean
  make -j8
  make install
}

build_one
