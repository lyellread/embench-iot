# Makefile to ease the debugging process of building embench
# Lyell Read; 1/30/2020.

.PHONY: default
default: all;

all:
	if [ -d ../build ]; then rm -rf ../build; fi

	mkdir ../build

	python3.7 ./build_all.py \
	                --builddir ../build \
	                --logdir ../build/log \
	                --arch riscv32 \
	                --chip p1 \
	                --board p1-fpga #\



logs:
	make log

log:
	less ../build/log/*

clean:
	rm -rf ../build

ec:
	nano ./config/riscv32/chips/p1/chip.cfg

eb:
	nano ./config/riscv32/boards/p1-fpga/board.cfg

ea:
	nano ./config/riscv32/arch.cfg

objdump:
	make od

od:
	riscv64-unknown-elf-objdump -x ../build/src/aha-mont64/aha-mont64
