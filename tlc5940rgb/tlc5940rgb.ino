#include "Tlc5940.h"


int cols[5][3] = {
  {3000,2000,1000},
  {0,0,0},
  {0,0,0},
  {0,0,0},
  {0,0,0}
};

int channel,red,green,blue;


void setup(){
  Tlc.init();
  Serial.begin(9600);
  seq = 0;
}

boolean reading = true;

void loop(){

   //setRGB(5, 2000,0,0);
   if(Serial.available() > 0){
     byte c = Serial.read() - 48;
     switch(seq){
       case 0:
         Serial.print("channel\n");
         channel = c;
         break;
       case 1:
         Serial.print("red\n");
         red = c;
         break;
       case 2:
         Serial.print("green\n");
         green = c;
         break;
       case 3:
         Serial.print("blue\n");
         blue = c;
         Serial.print("write: ");
         Serial.write(red+48);
         Serial.print(",");
         Serial.write(green+48);
         Serial.print(",");
         Serial.write(blue+48);
         Serial.print("\n");
         cols[channel][0] = red << 9 - 1;
         cols[channel][1] = green << 9 - 1;
         cols[channel][2] = blue << 9 - 1;
         seq = -1;
         break;
       default: 
         seq = -1;
     }
     seq++;
   }
   for(int i=0;i<5;i++){
     setRGB(i+1, cols[i][0],cols[i][1],cols[i][2]);
   }
   //setRGB(1, 3000,2000,1000);
   //setRGB(2, 0,2000,0);
   //setRGB(3, 0,0,2000);
   //setRGB(4, 2000,0,2000);
   //setRGB(5, 2000,2000,0);
   //delay(2000);
   //setRGB(0,0,0);
   //delay(500);
   //delay(1);
   //foo++;
   //if(foo > 4094){
   //  foo = 0;
  // }
}
void setRGB(int channel, int r, int g, int b){
  //Tlc.clear();
  int offset = channel * 3 - 2;
  Tlc.set(offset+1, trans(r));
  Tlc.set(offset, trans(g));
  Tlc.set(offset+2, trans(b));
  Tlc.update();

}
void white(int intensity){
  Tlc.clear();
  Tlc.set(13, trans(intensity));
  Tlc.set(14, 4095 - intensity);
  Tlc.set(15, 4095 - intensity);
  Tlc.update();

}
const float FOO = 1.0 /  pow(4095,2.3) * 4095.0;
int trans(int intensity){
  //return 4095 - intensity;
  return (unsigned int)(4095 - pow(intensity,2.3) * FOO);
  //return (unsigned int)((4095 - pow(intensity,2.3) / pow(4095,2.3) * 4095));
}
