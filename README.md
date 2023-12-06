PiNux - A Multithreaded Kernel
==============================

 
- [Introduction](#introduction)

---------------------------------

# Introduction

A basic Multithereaded Kernel from Scratch.

# Real Mode Development

Modern Operating systems run in Protected Mode, due to reason of security,
less memory access, & 16 bits accessible at one time.
In Real Mode only 1MB of RAM is accissible which is done through segmentation
model. Doesn't matter how much RAM you have.
Real Mode is based on x86 design & has same limitations. All the code in 
Real Mode is required to be 16 bits.
There's no memory security nor hardware security & Simple user program can
destroy OS. \
In Real mode only 8 & 16 bit registers are accissible hence only request 
memory address offsets of upto 65535.
Operations can only be done with 16 bit numbers.

Segmentation Memory Model.
Memory is accessed by segment & an offset

For bootloader use the following command to create a bin out of an asm

`nasm -f bin boot.asm -o boot.bin` \
`ndisasm boot.bin #This is Netwide Disassembler for 80x86 bin file` \
`qemu-system-x86_64 -hda boot.bin #This will display the first char form bin`
