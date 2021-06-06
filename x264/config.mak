SRCPATH=.
prefix=./android/x86
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
SYS_ARCH=X86
SYS=LINUX
CC=/Users/nam/Android/android-ndk-r15c/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-gcc
CFLAGS=-Wno-maybe-uninitialized -Wshadow -O3 -ffast-math -m32  -Wall -I. -I$(SRCPATH) --sysroot=/Users/nam/Android/android-ndk-r15c/platforms/android-16/arch-x86/ -std=gnu99 -D_GNU_SOURCE -mpreferred-stack-boundary=6 -fPIC -fomit-frame-pointer -fno-tree-vectorize
COMPILER=GNU
COMPILER_STYLE=GNU
DEPMM=-MM -g0
DEPMT=-MT
LD=/Users/nam/Android/android-ndk-r15c/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-gcc -o 
LDFLAGS=-m32  --sysroot=/Users/nam/Android/android-ndk-r15c/platforms/android-16/arch-x86/ -lm  -ldl
LIBX264=libx264.a
AR=/Users/nam/Android/android-ndk-r15c/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-gcc-ar rc 
RANLIB=/Users/nam/Android/android-ndk-r15c/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-gcc-ranlib
STRIP=/Users/nam/Android/android-ndk-r15c/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/i686-linux-android-strip
INSTALL=install
AS=
ASFLAGS= -I. -I$(SRCPATH) -DARCH_X86_64=0 -I$(SRCPATH)/common/x86/ -f elf32 -DSTACK_ALIGNMENT=64 -DPIC -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8
RC=
RCFLAGS=
EXE=
HAVE_GETOPT_LONG=1
DEVNULL=/dev/null
PROF_GEN_CC=-fprofile-generate
PROF_GEN_LD=-fprofile-generate
PROF_USE_CC=-fprofile-use
PROF_USE_LD=-fprofile-use
HAVE_OPENCL=yes
default: lib-static
install: install-lib-static
LDFLAGSCLI = 
CLI_LIBX264 = $(LIBX264)
