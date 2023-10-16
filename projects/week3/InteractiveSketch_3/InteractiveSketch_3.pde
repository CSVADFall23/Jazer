import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

void setup(){
size(600, 600);

println(Arduino.list());
//arduino = new Arduino(this, "/dev/tty.usbmodem101", 57600);
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

int ard = 0;//arduino.analogRead(5);

if (frameCount < 600){
  if(frameCount%40<12){
    fill(255);
  }
    else {
  fill(0);
    }
  textAlign(CENTER);
  textSize(40);
 text("please wait...", 0, 0); 
 }
else{
 int frm = frameCount%60;
 //pushMatrix();
 
 float xPos = sin(TWO_PI*mWid/300)*40;
 float yPos = -cos(TWO_PI*mWid/300)*40;
  
for(int i=0; i<(numSq); i++){
 //float spin = (1/numSq)*PI*(i/numSq);
   
   noFill();
   
   rotate(TWO_PI/numSq);
   // scaling formula: https://math.stackexchange.com/questions/828878/calculate-dimensions-of-square-inside-a-rotated-square 
   //wid *= 1/(cos(spin) + sin(spin));
  // hei *= 1/(cos(spin) + sin(spin));
   
  float xScale = (width - i*wid + frameCount)%(width*2);
  float yScale = (height - i*hei + frameCount)%(height*2);
  
  
  
  rect( xPos, yPos , xScale ,yScale ); 
    }
  // popMatrix();
  //translate(xPos, yPos);
  // rotate((frameCount/20)*(PI/numSq));
  // fill(0);
  // rect(0, 0, 16, 16);
  }

}
