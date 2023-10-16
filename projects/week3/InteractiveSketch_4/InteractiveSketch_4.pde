import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

void setup(){
size(800, 800);

println(Arduino.list());
arduino = new Arduino(this, "/dev/tty.usbmodem101", 57600);
}
void draw(){
background(0);
int numSq = 160;
//int smallest = 20;
float wid = (4*width)/(numSq);
float hei = (4*height)/(numSq);
int mWid = mouseX - width/2;
int mHei = mouseY - height/2;
translate(width/2, height/2);
rectMode(CENTER);
noFill();

int ang = arduino.analogRead(5);
arduino.pinMode(13, Arduino.INPUT);
arduino.pinMode(12, Arduino.INPUT);
arduino.pinMode(11, Arduino.INPUT);
if (frameCount < 300){
  if(frameCount%40<12){
    fill(0);
  }
    else {
  fill(255);
    }
  textAlign(CENTER);
  textSize(40);
 text("please wait...", 0, 0); 
 }
else{
 
 float xPos = sin(TWO_PI*ang/1024)*200;
 float yPos = -cos(TWO_PI*ang/1024)*200;
  
for(int i=0; i<(numSq); i++){
   noFill();
   
   
  float xScale = (i*wid + frameCount)%(4*width);
  float yScale = (i*hei + frameCount)%(4*height);
  rotate(TWO_PI/numSq);
  

  float col = 255;// - 255*(xScale/800);
  
  if(arduino.digitalRead(13) == Arduino.HIGH){
  stroke(col, 0., 0., 100);
  }
  else if(arduino.digitalRead(12) == Arduino.HIGH){
  stroke(col*0.1, col*0.1, col, 100);
  
  }
  else if(arduino.digitalRead(11) == Arduino.HIGH){
  stroke(col, col*0.9, 0., 100);
 
  }
  else {
  stroke(col, col, col, 100);
  }
  strokeWeight( (xScale)*.02);
  rect( xPos, yPos, xScale ,yScale , 2.); 
    }

  }

}
//void mousePressed() {
//saveFrame("tunnelYellow.png");
//}
