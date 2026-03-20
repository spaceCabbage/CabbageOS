# Default build profile
PROFILE ?= desktop

.DEFAULT_GOAL := help

.PHONY: help build build-ram clean test

help:
	@echo "CabbageOS Build Engine"
	@echo "----------------------"
	@echo "Available targets:"
	@echo "  make build       - Build the ISO (standard)"
	@echo "  make build-ram   - Build the ISO in RAM (requires 23GB+ RAM)"
	@echo "  make test        - Run the generated ISO in QEMU"
	@echo "  make clean       - Remove build artifacts and work directories"
	@echo ""
	@echo "Default target: help"

build:
	@echo "Building CabbageOS ISO..."
	sudo ./buildiso.sh -p $(PROFILE)

build-ram:
	@echo "Building CabbageOS ISO in RAM..."
	sudo ./buildiso.sh -p $(PROFILE) -r

clean:
	@echo "Cleaning build artifacts..."
	sudo rm -rf build/
	sudo rm -rf out/
	sudo rm -rf work/

test:
	@echo "Testing ISO in QEMU..."
	# Using QEMU directly instead of VirtualBox for standard UEFI testing
	# Requires qemu-system-x86_64 and edk2-ovmf
	qemu-system-x86_64 -m 4G -enable-kvm -cpu host \
		-bios /usr/share/edk2-ovmf/x64/OVMF_CODE.fd \
		-cdrom out/*/cabbageos-*.iso
