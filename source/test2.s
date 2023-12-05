.global _start;
_start:
	addi	sp,sp,-32
	addi t1, zero, 5
	sw t1, 0(sp)
	lw t2, 0(sp)
  ret
  