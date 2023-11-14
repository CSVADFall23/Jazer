import controlP5.*;
ControlP5 ctrl1;

PGraphics bg;
FloatList nVals = new FloatList();
//Slider abc;

float noiseScale = 55.0;
float noiseFrequency = 6.0;
int levels = 23;
int numP = 24;
float numPF = 1.0*numP; 
float radius = 1.0;
float randRot = 0;
float levelRotate = 0;
int snapshot = 0;
int ran = 0;
boolean drawLines = false;
boolean drawHands = false;

void setup(){
 size(800, 800, P2D);
 bg = createGraphics(800, 800, P2D);
 ctrl1 = new ControlP5(this);
 
 
  
  for(int i =0; i<numP;i++){
     noiseSeed((int)random(255));
     float offset = noiseScale*sin(noise(3425.31, 0.23424)*noiseFrequency*TWO_PI*(i/numPF));
     nVals.append(offset);
  }
  ctrl1.addSlider("noiseScale").setPosition(25, 40).setRange(1.0, 60.0);
  ctrl1.addSlider("noiseFrequency").setPosition(25, 60).setRange(1.0, 20.0);
  ctrl1.addSlider("levels").setPosition(25, 80).setRange(8, 500);
  ctrl1.addSlider("radius").setPosition(25, 100).setRange(0.0, 1.0);
   ctrl1.addSlider("levelRotate").setPosition(25, 120).setRange(-.25, .25);
  ctrl1.setColorCaptionLabel(0);
  ctrl1.addToggle("drawLines").setValue(false).setPosition(25, 140).setSize(20, 20);
  ctrl1.addToggle("drawHands").setValue(false).setPosition(75, 140).setSize(20, 20);
  
}
void draw(){
  background(255);
  
  PVector spot = new PVector(width/2, height/2);
  
  bg.beginDraw();
  bg.background(255);
  bg.rectMode(CENTER);
  bg.stroke(0);
  bg.strokeWeight(4);
  bg.translate(spot.x, spot.y);
  bg.rotate(randRot);
  float rad = 500.0*radius;
  float oRad = rad;
  
  FloatList oPipes = new FloatList();
  FloatList bars = new FloatList();
  FloatList bars2 = new FloatList();
  for(int k = 1; k <=levels;k++){
    FloatList pipes = new FloatList();
    PVector last = new PVector(0.0, 0.0);
    bg.rotate(levelRotate);
  for(int i =0; i<numP;i++){
     bg.strokeWeight(4);
     int ip1 = (i+1)%numP;
     PVector p1 = new PVector(sin(TWO_PI*(i/numPF)), cos(TWO_PI*(i/numPF)));
     PVector p2 = new PVector(sin(TWO_PI*(ip1/numPF)), cos(TWO_PI*(ip1/numPF)));
     float offset = nVals.get(i)/(1 + k*0.05);
     rad += offset;
     p1 = PVector.mult(p1, rad);
     p2 = PVector.mult(p2, rad);
     pipes.append(p1.x);
     pipes.append(p1.y);
     pipes.append(p2.x);
     pipes.append(p2.y);   
     bg.line(p1.x, p1.y, p2.x, p2.y);
     if(i!=0){
     bg.line(p1.x, p1.y, last.x, last.y); 
     }
      
     if(i==1 & (k==1 | k==levels)){
      bars.append(p1.x);
      bars.append(p1.y);
      bars.append(p2.x);
      bars.append(p2.y);
     }
     
     boolean tes2 = i == (numP-6);
     if(tes2 & (k== 3 | k==levels)){
      bars2.append(p1.x);
      bars2.append(p1.y);
      bars2.append(p2.x);
      bars2.append(p2.y);
     }
     last = p2;
     if(i==(numP-1)){
      PVector end =  new PVector(0, oRad);
     bg.line(p2.x, p2.y, end.x, end.y);
     }
  }
  bg.strokeWeight(4);
  if(drawLines){
  if(k>1 & k<=levels){
    
   for(int i=0;i<(pipes.size()-1);i++){
    bg.line(pipes.get(i), pipes.get(i+1), oPipes.get(i), oPipes.get(i+1));
    
   }
  }
  oPipes.clear();
  for(int i=0;i<pipes.size(); i++){
   oPipes.append(pipes.get(i)); 
  }
  }
  rad *= 1/(1 + k*0.1);
  oRad = rad;
  
  }
  if(drawHands){
  bg.fill(255, 100, 165);
  bg.stroke(255, 100, 165);  
  bg.beginShape(TRIANGLE);
  float midX = 0.5*(bars.get(0) + bars.get(2))*1.2;
  float midY = 0.5*(bars.get(1)  + bars.get(3))*1.2;
  bg.vertex(bars.get(0), bars.get(1));
  bg.vertex(bars.get(2), bars.get(3));
  bg.vertex(midX, midY);
  bg.endShape();
  
  bg.fill(255, 100, 165);
  bg.stroke(255, 100, 165);
  bg.beginShape(QUADS);
  bg.vertex(bars.get(0), bars.get(1));
  bg.vertex(bars.get(2), bars.get(3));
  bg.fill(12, 12, 12);
  bg.stroke(12, 12, 12);
  bg.vertex(bars.get(6), bars.get(7));
  bg.vertex(bars.get(4), bars.get(5));
  bg.endShape();
  
  bg.fill(165, 100, 255);
  bg.stroke(165, 100, 255);  
  bg.beginShape(TRIANGLE);
  float midX2 = 0.5*(bars2.get(0) + bars2.get(2))*1.1;
  float midY2 = 0.5*(bars2.get(1)  + bars2.get(3))*1.1;
  bg.vertex(bars2.get(0), bars2.get(1));
  bg.vertex(bars2.get(2), bars2.get(3));
  bg.vertex(midX2, midY2);
  bg.endShape();
  
  bg.fill(165, 100, 255);
  bg.stroke (165, 100, 255);
  bg.beginShape(QUADS);
  bg.vertex(bars2.get(0), bars2.get(1));
  bg.vertex(bars2.get(2), bars2.get(3));
  bg.fill(12, 12, 12);
  bg.stroke (12, 12, 12);
  bg.vertex(bars2.get(6), bars2.get(7));
  bg.vertex(bars2.get(4), bars2.get(5));
  bg.endShape();
  }
  //bg.fill(45, 0, 45);
  // bg.stroke (45, 0, 45);
  //bg.beginShape(QUADS);
  //bg.vertex(pipes3.get(0), pipes3.get(1));
  //bg.vertex(pipes3.get(2), pipes3.get(3));
  //bg.fill(0, 0, 0);
  //bg.stroke (0, 0, 0);
  //bg.vertex(pipes3.get(6), pipes3.get(7));
  //bg.vertex(pipes3.get(4), pipes3.get(5));
  //bg.endShape();
  
  bg.endDraw();
  image(bg, 0, 0);
  
}

void mousePressed(){ 
  //noLoop();
  //nVals.clear();
  // for(int i =0; i<numP;i++){
  //   noiseSeed((int)random(123));
  //   float offset = noiseScale*sin(noise(i*3425.31, i*0.23424)*noiseFrequency*TWO_PI*(i/numPF));
  //   nVals.append(offset);
  //}
  //randRot = random(0.0, 360.0);
  //loop();
}
void keyPressed() 
  {
   println(key);
  if (key == 32)
  //if (key == ' ') //same as above
    {
    noLoop();
  nVals.clear();
   for(int i =0; i<numP;i++){
     noiseSeed((int)random(123));
     float offset = noiseScale*sin(noise(i*3425.31, i*0.23424)*noiseFrequency*TWO_PI*(i/numPF));
     nVals.append(offset);
  }
  randRot = random(0.0, 360.0);
  ran = int(random(4));
  loop();
    } 
    if(key == 's'){
      
     
      
      save("data/noiseLoop-" + day() + "_" + month() + "_" + year() + "-" + hour() + "." + minute() + "." + second() + ".png");
     
  }
 
  }
