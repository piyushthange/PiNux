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
- [Creation of bootloader](#creation-of-bootloader)

---

 # Introduction
 
A basic Multithereaded Kernel from Scratch. This OS is a hobby project 
& a base understanding is going to build for the OS. Addition to this I'll
be adding some extra gui if possible for it.
I'm building a basic Multithereaded Kernel. This OS is a hobby project to which \
I'll try to add GUI on the top of this space. The terms used are 
REAL MODE(legacy Mode) & PROTECTED MODE(All 32 bit OS use), Virtual Memory, \
Virtualization, Mapping of addresses, Paging & many more.
The file format will be ELF files which will be loaded into memory.
Handeling Malacious programs & killing them as well as handeling crashes & detecting them.

# Setup Environment

Piece of hardware which stores information is known as *MEMORY*. Random Access \
Memory(RAM) is the main memory for computers & programs can read write info. \
RAM is a writeable memory & can be written or read from. It's a temporary Memory \
& all data is lot a when system is powered off. \
Read Only Memory(ROM) is a permanent type of storage i.e information cannot be \
read or wrote to the memory. The data could be retained again even after power \
loss. e.g. Microcontroller in toaster which don't let burn the toast.
There are multiple types of ROM's 
- PROM(Programmable Read-Only Memory) - can be written only once & never rewritten
- EPROM(Erasable PROM) - can be rewritten using UV light exposure e.g BIOS
- EEPROM(Electrically Erasable PROM) - can be rewritten multiple times using \
 electric charge
- Flash Memory - It contains both program code & user data. This is found in \
  USB drives & digital cameras.

Booting Steps
- BIOS is executed from ROM.
- BIOS loads the bootloader into Address 0x7C00
- Bootloader loads the Kernel

A bootloader is a small program that is responsible to load the kernel & are \
generally small. Linux has GRUB(GRand Unified Bootloader) which'll provide the \
options of multiple OS's installed. Windows has Windows Boot Manager.

# Introduction

I'm building a basic Multithereaded Kernel. This OS is a hobby project to which \
I'll try to add GUI on the top of this space. The terms used are 
REAL MODE(legacy Mode) & PROTECTED MODE(All 32 bit OS use), Virtual Memory, \
Virtualization, Mapping of addresses, Paging & many more.
The file format will be ELF files which will be loaded into memory.
Handeling Malacious programs & killing them as well as handeling crashes & detecting them.

# Setup Environment

Piece of hardware which stores information is known as *MEMORY*. Random Access \
Memory(RAM) is the main memory for computers & programs can read write info. \
RAM is a writeable memory & can be written or read from. It's a temporary Memory \
& all data is lot a when system is powered off. \
Read Only Memory(ROM) is a permanent type of storage i.e information cannot be \
read or wrote to the memory. The data could be retained again even after power \
loss. e.g. Microcontroller in toaster which don't let burn the toast.
There are multiple types of ROM's 
- PROM(Programmable Read-Only Memory) - can be written only once & never rewritten
- EPROM(Erasable PROM) - can be rewritten using UV light exposure e.g BIOS
- EEPROM(Electrically Erasable PROM) - can be rewritten multiple times using \
 electric charge
 - Flash Memory - It contains both program code & user data. This is found in \
  USB drives & digital cameras.

Booting Steps
- BIOS is executed from ROM.
- BIOS loads the bootloader into Address 0x7C00
- Bootloader loads the Kernel

A bootloader is a small program that is responsible to load the kernel & are \
generally small. Linux has GRUB(GRand Unified Bootloader) which'll provide the \
options of multiple OS's installed. Windows has Windows Boot Manager.



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

## Protected Mode Development


