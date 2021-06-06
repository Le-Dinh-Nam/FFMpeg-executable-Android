#!/bin/bash
NDK=/Users/nam/Android/android-ndk-r15c

#build x264 first

cd x264

# Build arm v6 v7a
./build_android_arm.sh "$NDK"

# Build x86
./build_android_x86.sh "$NDK"

#build ffmpeg

cd ../ffmpeg-4.2

./build-armeabi.sh "$NDK"

./build-armeabi-v7a.sh "$NDK"

./build-x86.sh "$NDK"
