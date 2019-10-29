.code16		#16bit的实模式
.global start	#声明供外部使用
.text		#定义代码段
hex:	.ascii	"0123456789ABCDEF"
start:
	ljmp	$0x07c0, $main	#跳转到main这个label
msg:	.asciz	"Hello World"
len:	.word 	. - msg		#mes的长度
main:
	mov %cs, %ax	#
	mov %ax, %ds	#
	mov %ax, %es	#初始化数据段寄存器

	mov $0xB800, %ax	#bios-vedio address
	mov %ax, %es		#0xB800 to es register
	xor %di, %di		#init %di value to zero
	movb $'A', %es:0(%di)	#copy 'A' to es segment di(offset) location char
	movb $0x03, %es:1(%di)	#set the attr (b_display) value to 0x03

ax2hex:
	pusha	#sace general registers
	mov	$4, %cx
nxnyb:
	rol	$4, %ax		#rotate hi-nybble into AL

loop:	jmp loop	#死循环
.org	510
	.byte	0x55
	.byte 	0xAA
#	.word	0xAA55
.end
