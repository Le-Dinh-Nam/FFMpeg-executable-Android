#!/bin/bash
NDK=$1
SYSROOT=$NDK/platforms/android-9/arch-x86
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/linux-x86_64

function build_one
{
    ./configure \
    --prefix=./android/x86 \
    --disable-shared \
    --enable-small \
    --enable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
    --disable-yasm \
    --arch=x86 \
    --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --target-os=linux \
    --extra-cflags="-Os -fpic -fPIE -pie" \
    --disable-debug \
  $ADDITIONAL_CONFIGURE_FLAG
  make clean
  make -j8
  make install
}

build_one
