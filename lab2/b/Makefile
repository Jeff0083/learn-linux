CC=gcc
CC_FLAGS=-fno-builtin -Wall -ggdb -m32 -nostdinc -fno-stack-protector -Os -nostdinc
LD=ld
LD_FLAGS=-melf_i386 -E
QEMU=qemu-system-i386
QEMU_FLAGES=-m 129M -fda
ifeq ($V,1)
CURSES=
else
CURSES=-curses
endif
DD=dd
OBJCOPY=objcopy
OBJCOPY_FLAGS = -R .pdr -R .comment -R .note -S -O binary

all:clean bootload.img

bootload.img: bootload.bin
	$(DD) if=bootload.bin of=bootload.img bs=512 count=1

bootload.bin:
	$(CC) $(CC_FLAGS) -c bootload.s -o bootload.o
	$(LD) $(LD_FLAGS) bootload.o -o bootload.elf -T ldscript
	$(OBJCOPY) $(OBJCOPY_FLAGS) bootload.elf $@
qemu:all
	$(QEMU) $(QEMU_FLAGES) bootload.img -boot a $(CURSES)

clean:
	rm -rf *.bin
	rm -rf *.img
	rm -rf *.o
	rm -rf *.elf

