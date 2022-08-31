#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
#
# Platform Overrides:
#      <Put a description of the supported Overrides here
#
#------------------------------------------------------------------------------
include sources.mk


ifeq ($(PLATFORM), MSP432)
	CC=arm-none-eabi-gcc
	LD = arm-none-eabi-ld
	LINKER_FILE = ../msp432p401r.lds
	LDFLAGS = -Wl,-Map=$(TARGET).map -Wl,-T$(LINKER_FILE) --specs=$(SPECS)
	CPU = cortex-m4
	ARCH = thumb
	SPECS = nosys.specs
	FPU = fpv4-sp-d16
	ARMFLAGS = -mcpu=$(CPU) -m$(ARCH)  -march=armv7e-m  -mfpu=$(FPU)
	OBJDUMP = arm-none-eabi-objdump
	SIZE = arm-none-eabi-size
else
	CC = gcc
	LD = ld
	SIZE = size
	OBJDUMP = objdump
endif



# Compiler Flags and Defines
TARGET = c1m2

CFLAGS = -Wall -Werror -g -O0 -std=c99 $(ARMFLAGS)
CPPFLAGS = -D$(PLATFORM) $(INCLUDES)


OBJS = $(SOURCES:.c=.o)
PREPRO = $(SOURCES:.c=.i)
ASMS = $(SOURCES:.c=.asm)
DEPS = $(SOURCES:.c=.d)


FILES = *.asm *.i *.o *.d

.PHONY: build
build: $(TARGET).out

$(TARGET).out: $(OBJS) 
	$(CC) $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)  -o $@ 
	$(SIZE) $(TARGET).out
	
%.o : %.c	
	$(CC) -c $< $(CFLAGS) $(CPPFLAGS)  -o $@

%.i : %.c
	$(CC) -E $< $(CFLAGS) $(CPPFLAGS)  -o $@

%.asm : %.c
	$(CC) -S $< $(CLAGS) $(CPPFLAGS) -o $@

%.d : %.c
	$(CC) -E -M $< $(CFLAGS) $(CPPFLAGS) -o $@

.PHONY: compile-all
compile-all : $(OBJS)
	


.PHONY: clean
clean: 
	rm -f $(TARGET).asm $(FILES) $(TARGET).out $(TARGET).map $(PREPO) $(ASMS) $(DEPS) $(OBJS)