import processing.pdf.*;

float blck = 10.0;
float sq3 = sqrt(3.0);
int numLayer = 25;

void setup() {
  size(600, 900, P3D);
  ortho(-width / 3, width / 3, height / 2, -height / 2, -2200, 2200);
  pixelDensity(2);
  fill(255, 255, 255);
}

void draw() {
  //background(255);
  //normalMaterial();
  if(frameCount<2){
  //beginRaw(PDF, "data/isoCubes" + ":" + month() + ":" + day() + "_" + year() + ":" + hour() + "." + minute() + "." + second() + ".pdf");
 
  translate(width/2, height/2 - 175, -500);
  rotateX(PI/4);
  rotateY(-PI/4);
  //columnDraw();
  //columnSteps();
  contSurf();
  //endRaw();
  }
}

void contSurf (){
  IntList rowBelow = new IntList();
  IntList seam = new IntList();
  for(int w=0;w<=numLayer;w++){
    rowBelow.append(0);
  }
  for(int layer=0;layer<=numLayer;layer++){
    int prev = 0;
   for(int i=0;i<=numLayer-layer;i++){
     int ind = min(i+1, rowBelow.size()-1);
     int below = rowBelow.get(ind);
     int maxi = max(prev, below -1);
     int rand = floor(random(0, 3));
     int newMax = maxi+rand;
     drawColumnShell(numLayer - i - layer, newMax, numLayer - layer, layer);
     rowBelow.set(i, newMax);
     prev = newMax;
     if(i==0){ seam.append(newMax);
     }
     
   }
  }
  IntList rowBelow2 = new IntList();
  for(int w=0;w<=numLayer;w++){
    rowBelow2.append(0);
  }
  for(int layers=0;layers<=numLayer;layers++){
    int prevv = 0;
   for(int j=0;j<=numLayer-layers;j++){
     int ind = min(j+1, rowBelow2.size()-1);
     int below = rowBelow2.get(ind);
     int maxi = max(prevv, below - 1);
     int indS = min(layers, seam.size()-1);
     int seamMax = seam.get(indS);
     int rand = floor(random(0, 3));
     int newMax = maxi+rand;
     if(j==0) {
       newMax = seamMax;
     }
     drawColumnShell(numLayer-layers, newMax, numLayer - j - layers, layers);
     rowBelow2.set(j, newMax);
     prevv = newMax;
     
   }
  } 
}



void drawColumnShell(float hex, float why, float zee, float bottom){
      push();
      translate(hex*blck, bottom*blck, zee*blck);
      println("Translation:", hex*blck, bottom*blck, zee*blck);
      float fade = why/(blck*numLayer);
      strokeWeight(1);//30  - 20*fade*fade*fade);
      
      
      
      beginShape(QUAD);
      //fill(255, 0, 0);
      vertex(-blck, 0, blck);
      vertex(-blck, why*blck, blck);
      vertex(0, why*blck, blck);
      vertex(0, 0, blck);
      
      //fill(0, 255, 0);
      vertex(0, 0, blck);
      vertex(0, why*blck, blck);
      vertex(0, why*blck, 0);
      vertex(0, 0, 0);
      endShape();
      
      //fill(0, 0, 255);
      beginShape(QUAD);
      
      vertex(0, why*blck, 0);
     vertex(0, why*blck, blck);
     vertex(-blck, why*blck, blck);
     vertex(-blck, why*blck, 0);
     endShape();
     
     lineGradientRF(why*blck);
     lineGradientLF(why*blck);
     
      pop();
}

void lineGradientRF(float why){
  //push();
  //translate(0, 0, 0);
var numLines = 40;
var initialSpacing = .1*blck;
var totalHeight = why;
var spacingIncrement = (totalHeight - initialSpacing) / ((numLines - 1) * numLines / 2); 
var currentY = initialSpacing;
for (var i = 0; i < numLines; i++) {
  beginShape(LINES);
  vertex(0, currentY, 0);
  vertex(0, currentY, blck);
  endShape();
  // Increment vertical spacing
  currentY += spacingIncrement * (i + 1);
  }
 //pop();
}

void lineGradientLF(float why){
  //push();
  //translate(0, 0, 0);
var numLines = 40;
var initialSpacing = .1*blck;
var totalHeight = why;
var spacingIncrement = (totalHeight - initialSpacing) / ((numLines - 1) * numLines / 2); 
var currentY = initialSpacing;
for (var i = 0; i < numLines; i++) {
  beginShape(LINES);
  vertex(-blck, currentY, 0);
  vertex(0, currentY, 0);
  endShape();
  // Increment vertical spacing
  currentY += spacingIncrement * (i + 1);
  }
 //pop();
}




///////////////////////////////
//////////////////////////////


void columnDraw(){
  for(int i =0;i<numLayer;i++){
       for(int k =0;k<numLayer;k++){
        float hex = i;
        float zee = k;
        float taper = (hex+zee)/(numLayer*2);
  
        float rnd = floor(random(taper*.25*numLayer, numLayer*(taper*taper)));
        float rnd2 = floor(random(0, (1-taper*taper))*3);
        drawColumnShell(hex, numLayer+rnd2 - numLayer*taper*taper*taper*taper, zee, 0.0); 
       }
    }
}


void drawBoxShell(float hex, float why, float zee){
    push();
    translate(hex, why, zee);
    float fade = why/(blck*numLayer);
    strokeWeight(20  - 20*fade*fade*fade*fade);
    beginShape(QUAD_STRIP);
    vertex(-blck, 0, blck);
    vertex(-blck, blck, blck);
    vertex(0, 0, blck);
    vertex(0, blck, blck);
    vertex(0, 0, 0);
    vertex(0, blck, 0);
    endShape();
    
    beginShape(QUAD_STRIP);
    vertex(0, blck, 0);
    vertex(0, blck, blck);
    vertex(-blck, blck, 0);
     vertex(-blck, blck, blck);
     endShape();
    pop();
}

void drawBoxStack(float hex, float zee){
       float taper = (hex+zee)/(numLayer*blck);
       int rnd = floor(random(0, 12*(taper*taper*taper)));
      for(int j = 0;j<numLayer - rnd; j++){
       drawBoxShell(hex, j*blck, zee);
  }
}
  

void stackDraw(){
     for(int i =0;i<numLayer;i++){
       for(int k =0;k<numLayer;k++){
        float hex = i*blck;
        float zee = k*blck;
        drawBoxStack(hex, zee);
      }
  
    }
}


//// Hit 's' to record a single frame
void keyPressed() {
  if(key=='s'){
    save("data/isoCubes" + ":" + month() + ":" + day() + "_" + year() + ":" + hour() + "." + minute() + "." + second() + ".png");
  }
}
