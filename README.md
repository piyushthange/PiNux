PiNux - A Multithreaded Kernel
==============================

 
- [Introduction](#introduction)

---------------------------------

# Introduction

A basic Multithereaded Kernel from Scratch.

# Real Mode Development

For bootloader use the following command to create a bin out of an asm

`nasm -f bin boot.asm -o boot.bin`
`ndisasm boot.bin #This is Netwide Disassembler for 80x86 bin file`
`qemu-system-x86_64 -hda boot.bin #This will display the first char form bin`
