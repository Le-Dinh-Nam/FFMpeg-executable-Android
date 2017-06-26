#!/bin/bash
NDK=$1
SYSROOT=$NDK/platforms/android-21/arch-arm64
TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64

function build_one
{
	./configure \
	--prefix=./android/arm64-v8a \
	--disable-static \
	--enable-shared \
	--enable-small \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-doc \
	--arch=arm64 \
	--cpu=cortex-a53 \
	--cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
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
