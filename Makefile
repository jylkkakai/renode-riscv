
init: 
	mkdir build

clear:
	rm -rf build/

hello:
	riscv64-unknown-elf-gcc -O0 -c -ffunction-sections -fdata-sections -o build/test_hello.o source/hello.c
	riscv64-unknown-elf-gcc -nostartfiles -T riscv64-virt.ld -o build/test_hello.elf build/test_hello.o crt0.s

led_blinker:
	riscv64-unknown-elf-gcc -O0 -c -ffunction-sections -fdata-sections -o build/led_blinker_gdb.o source/led_blinker.c
	riscv64-unknown-elf-gcc -nostartfiles -T riscv64-virt.ld -o build/led_blinker_gdb.elf build/led_blinker_gdb.o crt0.s

led_blinker_gdb:
	riscv64-unknown-elf-gcc -g -O0 -c -ffunction-sections -fdata-sections -o build/led_blinker.o source/led_blinker.c
	riscv64-unknown-elf-gcc -g -nostartfiles -T riscv64-virt.ld -o build/led_blinker.elf build/led_blinker.o crt0.s

uart_simple:
	riscv64-unknown-elf-as  -o build/uart_simple.o source/uart_simple.s
	riscv64-unknown-elf-ld -o build/uart_simple.elf build/uart_simple.o

uart_simple_c: source/uart_utils.h source/uart_simple.c
	riscv64-unknown-elf-gcc -O0 -c -ffunction-sections -fdata-sections -o build/uart_simple_c.o source/uart_simple.c 
	riscv64-unknown-elf-gcc -nostartfiles -T riscv64-virt.ld -o build/uart_simple.elf build/uart_simple_c.o  crt0.s