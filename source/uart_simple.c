//#include<std_io.h>
#include "uart_utils.h"
#define UART_ADDR 0x10000000

int main(){
char *text = "Hello World!\n";
  uart_put_char("H");
  uart_put_char("e");
  uart_put_char("l");
  uart_put_char("l");
  uart_put_char("o");
  uart_put_char("\n");
  uart_put_string(text);
  return 0;
}