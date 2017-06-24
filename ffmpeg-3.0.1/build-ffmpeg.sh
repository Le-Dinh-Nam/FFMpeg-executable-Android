#!/bin/bash
NDK=/home/nam/Android/android-ndk-r14b

./build-armeabi.sh "$NDK"
./build-armeabi-v7a.sh "$NDK"
./build-arm64-v8a.sh "$NDK"
./build-mips.sh "$NDK"
./build-mips64.sh "$NDK"
./build-x86.sh "$NDK"
./build-x86_64.sh "$NDK"










