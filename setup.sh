#!/bin/bash

sudo apt update
sudo apt install qemu-system nasm gdb

# Cross Compilation tools

sudo apt install build-essential flex bison \
		 libgmp3-dev libmpc-dev libmpfr-dev \
		 texinfo libcloog-isl-dev libisl-dev \
		 bless \ #hex editor
