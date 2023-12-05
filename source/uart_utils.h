
#define UART_ADDR 0x10000000

void uart_put_char(char *ch){

  *(volatile char*)(UART_ADDR) = *ch;
}

void uart_put_string(char *string){

  unsigned int ii = 0;
  while(string[ii] != '\0'){   

    uart_put_char(&string[ii]);
    ii++;
  }
}