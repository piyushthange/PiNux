SRC_DIR := src/bootloader
BUILD_DIR := build
BIN_DIR := bin

# List of Makefile 
COMPONENTS := 01 02 03 04 05 06

# Targets
all: $(COMPONENTS)

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

.PHONY: all clean
