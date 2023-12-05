.equ UART,  	0x10000000
.equ ADDR,  	0x5f8
.equ GPIO, 		0x60000000
.equ CLINT, 	0x02000000
.equ PLIC,		0x0C000000

.section .text
.global _start;
_start:
	li 		sp, ADDR
	addi 	t1, zero, 5
	sw 		t1, 0(sp)
	lw 		t2, 0(sp)

	li		sp, UART
	sw		t2, 0(sp)
	sb		t2, 1(sp)
	sb		t2, 2(sp)

	li		sp, GPIO
	li		t3, 1
	sw		t3, 0(sp)

	li		sp, PLIC
	li		t3, 1
	sw		t3, 0(sp)

	li		sp, CLINT
	li		t3, 1
	sw		t3, 0(sp)

  ret
  