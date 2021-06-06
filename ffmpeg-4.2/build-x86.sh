#!/bin/bash
NDK=$1
SYSROOT=$NDK/platforms/android-16/arch-x86
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/darwin-x86_64

function build_one
{
    ./configure \
    --prefix=./android/x86 \
    --disable-shared \
    --enable-small \
    --enable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-doc \
    --disable-yasm \
    --arch=x86 \
    --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
    --extra-cflags="-I../x264/android/x86/include" \
    --extra-ldflags="-L../x264/android/x86/lib" \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --target-os=linux \
    --extra-cflags="-Os -fpic -fPIE -pie " \
    --extra-ldflags="-lx264 -fPIE -pie" \
    --enable-pthreads \
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
    --disable-debug \
  $ADDITIONAL_CONFIGURE_FLAG
  make clean
  make -j8
  make install
}

build_one
