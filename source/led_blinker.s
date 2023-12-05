.equ GPIO, 0x60000000
.equ CNTR, 100000000

.section .text
.global _start
_start:
        li sp, 	GPIO
        li t1, 	0
        li t2, 	1
        sw t1, 	0(sp)
loop:
        li t3, 	CNTR      
delay_loop:
        addi t3, t3, -1         
        bnez t3, delay_loop
toggle_led:
        lw 		t1, 0(sp)
        xor 	t1, t1, t2
        sw 		t1, 0(sp)
        jump 	loop, t0
