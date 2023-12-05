#include <stdio.h>

void print_string(char *string_ptr){
  printf("print..\n");
  int ii = 0;
  while (*string_ptr != '\0' && ii < 20){
    printf("%c\n", *string_ptr);
    string_ptr++;

    ii++;
  }
}

int main(){

  char *string = "Hello World!";
  print_string(string);
  return 0;
}