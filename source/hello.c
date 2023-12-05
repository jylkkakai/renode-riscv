// #include <stdio.h>

// void hello(){
//   printf("Hello, World!");
// }
// int add(int value){
//   return value++;
// }
int main(){

  int *value_p;
  value_p = (int *)0x5f8;
  int value;
  value = 9;
  *value_p = 5;

  // for (int i = 0; i <3; i++){
  //   add(value);
  //   // hello();
  // }
  // while(1){

  // }
  
  return 1;
}