#!/bin/bash

sudo apt update
sudo apt install qemu-system nasm gdb

# Cross Compilation tools

#flex - Fast lexical analyzer generator
#bison - general purpose parser generator that converts an annotated context-free grammar into a deterministic LR
# gmp3 - Arithmetic lib
#MPFR - Multiple Precision Floating-Point Reliable Library
#texinfo - produces o/p in multiple formats
#CLOOG - Code Generation Library for Optimized Code Generation
# bless - hex editor

sudo apt install -y build-essential \
		 flex \
		 bison \
		 libgmp3-dev \
		 libmpc-dev libmpfr-dev \
		 texinfo \
		 libisl-dev \
		 bless 

export	PREFIX="$HOME/opt/corss"
mkdir $PREFIX
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"
mkdir -p ../ENV
ENV=`readlink -f ../ENV`

#function to install latest gcc
gcc_13() {
	cd $ENV
	wget https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.xz
	tar -xf gcc-13.2.0.tar.xz
	which --$TARGET-as || echo $TARGET-as is not in the PATH
	mkdir build-gcc
	cd build-gcc
	../gcc-13.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls \
	--enable-languages=c,c++ --without-headers
	make all-gcc -j`nproc`
	make all-target-libgcc -j`nproc`
	make install-gcc -j`nproc`
	make install-target-libgcc -j`nproc`
}

#function to install latest binutils
binut(){
	cd $ENV
	wget https://ftp.gnu.org/gnu/binutils/binutils-2.41.tar.xz
	tar -xf binutils-2.41.tar.xz
	mkdir build-binutils
	cd build-bintuils
	../binutils-2.41/configure --target=$TARGET --prefix="$PREFIX" \
	--with-sysroot --disable-nls --disable-werror
	make -j`nproc`
	make install
}
