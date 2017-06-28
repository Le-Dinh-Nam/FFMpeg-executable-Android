#!/bin/bash
NDK=$1
SYSROOT=$NDK/platforms/android-9/arch-mips
TOOLCHAIN=$NDK/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64

function build_one
{
	./configure \
	--prefix=./android/mips \
	--disable-shared \
	--enable-small \
	--enable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--arch=mips \
	--cross-prefix=$TOOLCHAIN/bin/mipsel-linux-android- \
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
