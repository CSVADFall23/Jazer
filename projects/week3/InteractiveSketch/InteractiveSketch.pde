import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

void setup(){
size(600, 600);

println(Arduino.list());
arduino = new Arduino(this, "/dev/tty.usbmodem101", 57600);
}
void draw(){
background(255);
int numSq = 60;
//int smallest = 20;
float wid = (2*width)/(numSq);
float hei = (2*height)/(numSq);
int mWid = mouseX - width/2;
int mHei = mouseY - height/2;
translate(width/2, height/2);
rectMode(CENTER);
noFill();

int ard = arduino.analogRead(5);

if (frameCount < 600){
  fill(0);
  textAlign(CENTER);
  textSize(40);
 text("please wait...", 0, 0); 
 }
else{
for(int i=0; i<(numSq); i++){
 float spin = .125*PI*(i/numSq);
   rotate(TWO_PI/numSq);
   // scaling formula: https://math.stackexchange.com/questions/828878/calculate-dimensions-of-square-inside-a-rotated-square 
   wid *= 1/(cos(spin) + sin(spin));
   hei *= 1/(cos(spin) + sin(spin));
  
  rect( sin(TWO_PI*ard/1024)*40, -cos(TWO_PI*ard/1024)*40, (width - i*wid + frameCount)%(width*2), (height - i*hei +frameCount)%(height*2)); 
    }
  }

}
