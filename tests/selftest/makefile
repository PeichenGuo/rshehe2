RISCV64_CPP := $(shell which riscv64-unknown-elf-c++)

SELFTEST_ROOT := $(PROJ_ROOT)/$(TEST_ROOT)/selftest
SRC := src
HEX := build/hex
DISASSEMBLY := build/disassembly
ELF := build/elf
BUILD_DIR := build

HEX_WIDTH := 16 	#bytes
HEX_DEPTH := 2048
HEX_BASE  := 2147483648

CC      := $(shell which riscv64-unknown-elf-c++)
OBJDUMP := $(shell which riscv64-unknown-elf-objdump)
ELF2HEX := $(shell which elf2hex)

CFLAGS := -O0 -march=rv64im -mabi=lp64 -nostdlib -mcmodel=medany -fvisibility=hidden -static -I../include -Wl,-Bstatic,-T,../include/test.ld,--strip-debug -mno-relax

loop:
	$(CC) $(CFLAGS) -o $(SELFTEST_ROOT)/$(ELF)/loop.elf $(SELFTEST_ROOT)/$(SRC)/loop.S
	$(OBJDUMP) -D $(SELFTEST_ROOT)/$(ELF)/loop.elf > $(SELFTEST_ROOT)/$(DISASSEMBLY)/loop.txt
	$(ELF2HEX) $(HEX_WIDTH) $(HEX_DEPTH) $(SELFTEST_ROOT)/$(ELF)/loop.elf $(HEX_BASE) > $(SELFTEST_ROOT)/$(HEX)/loop.hex
