#!/bin/bash
NDK=$1
SYSROOT=$NDK/platforms/android-9/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64

function build_one
{
	./configure \
	--prefix=./android/armeabi \
	--disable-shared \
	--enable-small \
	--enable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-doc \
	--arch=arm \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	--target-os=linux \
	--extra-cflags="-Os -fpic -marm -fPIE -pie" \
	--extra-ldflags="-marm -fPIE -pie" \
    --disable-debug \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j8
	make install
}

build_one
