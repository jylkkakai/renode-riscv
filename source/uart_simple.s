.equ UART, 0x10000000

.section .text
.global _start
_start:
        addi a0, x0, 0x68
	li a1, UART

	sb a0, (a1) # 'h'

	addi a0, x0, 0x65
	sb a0, (a1) # 'e'

	addi a0, x0, 0x6C
	sb a0, (a1) # 'l'

	addi a0, x0, 0x6C
	sb a0, (a1) # 'l'

	addi a0, x0, 0x6F
	sb a0, (a1) # 'o'

  addi a0, x0, 0xA
	sb a0, (a1) # 'new line'
