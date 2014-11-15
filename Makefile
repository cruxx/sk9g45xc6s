#
#
#

CROSS_COMPILE=../buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-

CC=$(CROSS_COMPILE)gcc
#CXX=$(CROSS_COMPILE)g++
LD=$(CROSS_COMPILE)ld

LDFLAGS :=-L ../buildroot/output/host/usr/lib

export CC
#export CXX
export LD
export LDFLAGS

SOURCE_DIR := source_arm/  # the directory with source files (*.c, *.h) 
OUTPUT_DIR := bin_arm/     # the directory with binary, object and other build output files (*.o, *.d, etc) 
INSTALL_DIR := root@192.168.1.45:/tmp

SOURCES := $(wildcard $(addsuffix *.c,$(SOURCE_DIR)))
OBJECTS := $(patsubst %.c,$(OUTPUT_DIR)%.o,$(notdir $(SOURCES)))  # $(notdir $(patsubst %.c,%.o,$(SOURCES)))
EXEC_NAME := fpga_control

all: $(OUTPUT_DIR)$(EXEC_NAME)

$(OUTPUT_DIR)$(EXEC_NAME): $(OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@
VPATH   := $(SOURCE_DIR)
$(OUTPUT_DIR)%.o: %.c
	$(CC) -c -MMD $(addprefix -I ,$(SOURCE_DIR)) $< -o $@
        
include $(wildcard   *.d)

clean:
	cd $(OUTPUT_DIR); rm -f $(EXEC_NAME) *.o *.d

install:
	scp $(OUTPUT_DIR)$(EXEC_NAME) $(INSTALL_DIR)
