#!/bin/bash
NDK=$1
SYSROOT=$NDK/platforms/android-16/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

function build_one
{
	./configure \
	--prefix=./android/armeabi \
	--disable-shared \
	--enable-small \
	--enable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-doc \
	--arch=arm \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--extra-cflags="-I../x264/android/arm/include" \
	--extra-ldflags="-L../x264/android/arm/lib" \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	--target-os=linux \
	--extra-cflags="-Os -fpic -marm -fPIE -pie" \
	--extra-ldflags="-lx264 -marm -fPIE -pie" \
	--enable-pthreads \
       --disable-doc \
       --enable-avdevice \
       --enable-swresample \
       --enable-postproc \
       --enable-avfilter \
	--enable-gpl \
	--enable-libx264 \
	--enable-encoder=libx264 \
	--enable-encoder=libx264rgb \
       --enable-hwaccels \
       --disable-bsfs \
       --disable-indevs \
       --disable-outdevs \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j8
	make install
}

build_one
