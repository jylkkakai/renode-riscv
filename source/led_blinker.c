#include<std_io.h>

const int LED_ADDR = 0x60000000;


int main(){

  int *led_p;
  int led = 0;
  led_p = (int *)LED_ADDR;
  *led_p = 0;

  while(1){
    int count = 30000000;
    for (int i = 0; i < count; ++i) {
      count--;
    }
    led ^= 1;
    *led_p = led;
  }
  
  return 1;
}