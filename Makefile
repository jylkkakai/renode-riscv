
hello:
	riscv64-unknown-elf-gcc -O0 -c -ffunction-sections -fdata-sections -o test_hello.o hello.c
	riscv64-unknown-elf-gcc -nostartfiles -T riscv64-virt.ld -o test_hello.elf test_hello.o crt0.s

led_blinker:
	riscv64-unknown-elf-gcc -O0 -c -ffunction-sections -fdata-sections -o led_blinker_gdb.o led_blinker.c
	riscv64-unknown-elf-gcc -nostartfiles -T riscv64-virt.ld -o led_blinker_gdb.elf led_blinker_gdb.o crt0.s

led_blinker_gdb:
	riscv64-unknown-elf-gcc -g -O0 -c -ffunction-sections -fdata-sections -o led_blinker.o led_blinker.c
	riscv64-unknown-elf-gcc -g -nostartfiles -T riscv64-virt.ld -o led_blinker.elf led_blinker.o crt0.s

uart_simple:
	riscv64-unknown-elf-as  -o build/uart_simple.o uart_simple.s
	riscv64-unknown-elf-ld -o uart_simple.elf build/uart_simple.o

uart_simple_c: uart_utils.h uart_simple.c
	riscv64-unknown-elf-gcc -O0 -c -ffunction-sections -fdata-sections -o build/uart_simple_c.o uart_simple.c 
	riscv64-unknown-elf-gcc -nostartfiles -T riscv64-virt.ld -o uart_simple.elf build/uart_simple_c.o  crt0.s