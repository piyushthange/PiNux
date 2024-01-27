SRC_DIR := src/bootloader
BUILD_DIR := build
BIN_DIR := bin
FILES = ./build/kernel.asm.o

# List of Makefile 
COMPONENTS := 01 02 03 04 05 06 07

./bin/boot.bin: ./src/bootloader/boot_*.asm
	nasm -f bin ./src/bootloader/boot_*.asm -o ./bin/boot.bin

./build/kernel.asm.o: ./src/kernel.asm
	nasm -f elf -g ./src/kernel.asm -o ./build/kernel.asm.o

# Targets
all: ./bin/boot.bin $(COMPONENTS) $(FILES)
	rm -rf ./bin/os.bin
	dd if=./bin/boot.bin >> ./bin/os.bin

# Build each component
$(COMPONENTS):
	$(MAKE) -C $(SRC_DIR) -f Makefile_$@
	cp -r $(SRC_DIR)/*.bin $(BIN_DIR)/
	rm -r $(SRC_DIR)/*.bin
# Clean
clean:
	@for component in $(COMPONENTS); do \
		$(MAKE) -C $(SRC_DIR) -f Makefile_$$component clean; \
	done
	rm -rf $(BIN_DIR)

.PHONY: all clean
