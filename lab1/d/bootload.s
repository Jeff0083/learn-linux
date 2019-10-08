.code16		#16bit的实模式
.global start	#声明供外部使用
.text		#定义代码段
start:
	ljmp	$0x07c0, $main	#跳转到main这个label
msg:	.asciz	"Hello World"
len:	.word 	. - msg		#mes的长度
main:
	mov %cs, %ax	#
	mov %ax, %ds	#
	mov %ax, %es	#初始化数据段寄存器
	
	mov len, %cx	#字符长度
	mov $msg, %bp	#msg的address给bp寄存器
	mov $0x0003, %bx
	mov $0x1507, %dx
	mov $0x1301, %ax
	int $0x10
loop:	jmp loop	#死循环
.org	510
	.byte	0x55
	.byte 	0xAA
#	.word	0xAA55
.end
