AS=as
LD=ld
QEMU=qemu-system-i386
QEMU_FLAGES=-m 129M -fda
CURSES=-curses
DD=dd

all:clean bootload.img

bootload.img: bootload.bin
	$(DD) if=bootload.bin of=bootload.img bs=512 count=1

bootload.bin:
	$(AS) bootload.s -o bootload.o
	$(LD) bootload.o -T ./ldscript -o bootload.bin

qemu:
	$(QEMU) $(QEMU_FLAGES) bootload.img -boot a $(CURSES)

clean:
	rm -rf *.bin
	rm -rf *.img
	rm -rf *.o

