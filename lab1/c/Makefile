AS=as
AS_FLAGS=-g --32
LD=ld
LD_FLAGS=-melf_i386 -E
QEMU=qemu-system-i386
QEMU_FLAGES=-m 129M -fda
CURSES=-curses
DD=dd
OBJCOPY=objcopy
OBJCOPY_FLAGS = -R .pdr -R .comment -R .note -S -O binary

all:clean bootload.img

bootload.img: bootload.bin
	$(DD) if=bootload.bin of=bootload.img bs=512 count=1

bootload.bin:
	$(AS) $(AS_FLAGS) bootload.s -o bootload.o
	$(LD) $(LD_FLAGS) bootload.o -o bootload.elf -T ldscript
	$(OBJCOPY) $(OBJCOPY_FLAGS) bootload.elf $@
qemu:
	$(QEMU) $(QEMU_FLAGES) bootload.img -boot a $(CURSES)

clean:
	rm -rf *.bin
	rm -rf *.img
	rm -rf *.o
	rm -rf *.elf

