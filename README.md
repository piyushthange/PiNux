<p align="center">
    <img width="100" src="emb.png">
</p>

<h1 align="center"> 
    PiNux - A Multithreaded Kernel 
</h1>

# Index
- [Introduction](#introduction)
- [Fundamentals & Environment Setup](#fundamentals--environment-setup)
- [Real Mode Development](#real-mode-development)
- [Protected Mode Development](#protected-mode-development)
  
---

# Introduction

I'm building a basic Multithereaded Kernel. This OS is a hobby project to which \
I'll try to add GUI on the top of this space. The terms used are REAL MODE \
(legacy Mode) & PROTECTED MODE(All 32 bit OS use), Virtual Memory, Virtualization, \
Mapping of addresses, Paging & many more. The file format will be ELF files \
which will be loaded into memory. Handeling Malacious programs & killing them \
as well as handeling crashes & detecting them.

# Fundamentals & Environment Setup

Piece of hardware which stores information is known as *MEMORY*. Random Access \
Memory(RAM) is the main memory for computers & programs can read write info. \
RAM is a writeable memory & can be written or read from. It's a temporary Memory \
& all data is lot a when system is powered off. \
Read Only Memory(ROM) is a permanent type of storage i.e information cannot be \
read or wrote to the memory. The data could be retained again even after power \
loss. e.g. Microcontroller in toaster which don't let burn the toast. \
There are multiple types of ROM's 
- PROM(Programmable Read-Only Memory) - can be written only once & could never \
  be rewritten again
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
options of multiple OS's installed. Windows has Windows Boot Manager. \
CPU exectues instructions directly from the BIOS's ROM. BIOS loads itself into \
RAM and continues execution & initialize essenial hardware like keyboard, HDDS \
mouse, display, etc. BIOS will search for a boot signature on the storage medium \
as `0x55AA` and load the bootloader on the memory. BIOS is a 16 bit code and \
contains routines to direct bootloader in booting our kernel. 

Use `setup.sh` for setting up the environment this will install all the deps \
required to create the OS.

# Real Mode Development

### *Real Mode*

Modern Operating systems run in Protected Mode, due to reason of security, \
less memory access & 16 bits accessible at one time in Real Mode. only 1MB \
of RAM is accissible which is done through segmentation model. Doesn't \
matter how much RAM you have. Real Mode is based on x86 from 1970 design & has \
some limitations. All the code in Real Mode is required to be 16 bits. \
There's no memory security nor hardware security & Simple user program can \
destroy OS. In Real mode only 8 & 16 bit registers are accissible hence only \
request memory address offsets/Numbers of upto 65535. \
Operations can only be done with 16 bit numbers.

### *Segmentation Memory Model*

In Segmentation Memory Model memory is accessed by segment & an offset. Due to \
nature of SMM programs can be loaded into different areas of memory and could be \
run without any issues. \
In real mode there are 4 Segment Registers
- CS - Code Segment
- SS - Stack Segment
- DS - Data Segment
- ES - Extra Segment

We use Segment Registers so as to access memory in RAM. Using segment register & \
an offset, absolute position of a particular piece of data could be found in RAM \
Through the combination of segment register & offset we can calculate absolute \
position of data.
eg. Suppose our code segment is at `0x7C0` & Assembly origin `ORG` is at `0` \
Let's assume the first instruction to be at origin `0` so our offset is zero \
To calculate the absolute position of first instruction in our program we follow \
- Step 1:
`0x7C0 * 16 = 0x7C00` --> Multiply the segment with 16
- Step 2:
`0x7C00 + 0 = 0x7C00` --> Add the OFFSET to o/p value. This is where our first \
instruction is.

> [!TIP]
> In Hexadecimal, multiplying by 16 is equivalent to shifting one postion to left

Different instruction use different segment registers.

[FAT(File Allocation Table)](https://wiki.osdev.org/FAT)

### *Burning bootloader to USB*

To check bootloader on a real system we'll burn the `boot.bin` to  USB key.
- Connect the USB key to your pc
- List disk & check for USB key `sudo fdisk -l`
- Pick `sda/sdb` as described in the output `fdisk`
- Burn the disk. `if`: input file `of`: output file
 `sudo dd if=boot.bin of=/dev/sda`
- Unplug the USB key
- Plug the USB key into the PC which is powered off
- Enter BIOS go to boot menu 
- Boot using USB key.

### *Interrupt Vector Table*

Interrupts are like subroutines & you don't need to know the memory address to \
invoke them. Interrupts are called through interrupt number rather than memory \
addresses. These can be setup by programmers invoke the code. \
Invoking an interrupt means a process is interrupted, old state is saved on the \
stack & interrupt is exectued. Interrupt vector table is a table describing \
where these interrupts are on the memory. There are 256 interrupt handelers. \
Each entry contains 4 Bytes(OFFSET:SEGMENT) & interrupts are in numberical order \
in the table. IVT starts at absolute address `0x00` in RAM with four bytes per \
interrupt(OFFSET:SEGMENT).

|Interrupt|Address|
|:---:|:---:|
|0|0x00|
|1|0x04|
|2|0x08|

What offset will be 0x15 is? \
0x15 * 0x04 = 0x54 or 84 decimal. `int 0x15` processor looks at offset 84 in RAM. \
84-85 --> OFFSET(2 bytes) : 86-87 --> SEGMENT(2 bytes)

### *File System & Disk Access*

# Protected Mode Development
