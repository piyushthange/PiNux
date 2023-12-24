<!-- ![Alt text](logo.png) -->
<p align="center">
    <img width="100" src="logo.png">
</p>

<h1 align="center"> 
    PiNux - A Multithreaded Kernel 
</h1>

# Index
- [Introduction](#introduction)
- [Real Mode Development](#real-mode-development)
- [Segmentation Memory Model](#segmentation-memory-model)

---

# Introduction

A basic Multithereaded Kernel from Scratch. This OS is a hobby project 
& a base understanding is going to build for the OS. Addition to this I'll
be adding some extra gui if possible for it.

# Real Mode Development

Modern Operating systems run in Protected Mode, due to reason of security,
less memory access & 16 bits accessible at one time.
In Real Mode only 1MB of RAM is accissible which is done through segmentation
model. Doesn't matter how much RAM you have.
Real Mode is based on x86 design & has some limitations. All the code in 
Real Mode is required to be 16 bits.
There's no memory security nor hardware security & Simple user program can
destroy OS. \
In Real mode only 8 & 16 bit registers are accissible hence only request 
memory address offsets of upto 65535.
Operations can only be done with 16 bit numbers.

## Segmentation Memory Model.
Memory is accessed by segment & an offset

For bootloader use the following command to create a bin out of an asm

## Creation of bootloader.

Use `bootloader/boot.asm` for generating `boot.bin`

`nasm -f bin boot.asm -o boot.bin` \
`ndisasm boot.bin #This is Netwide Disassembler for 80x86 bin file` \
`qemu-system-x86_64 -hda boot.bin #This will display the first char form bin`
