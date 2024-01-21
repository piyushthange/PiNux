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

#function to install latest gcc
gcc_13() {
	wget https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.xz
	tar -xf gcc-13.2.0.tar.xz
	cd gcc-13.2.0

}

#function to install latest binutils
binut(){
	wget https://ftp.gnu.org/gnu/binutils/binutils-2.41.tar.xz
	tar -xf binutils-2.41.tar.xz
	cd binutils-2.41

}	
