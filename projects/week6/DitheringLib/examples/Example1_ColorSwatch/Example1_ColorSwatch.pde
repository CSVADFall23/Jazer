//import library
import ditheringLib.*;

//OrderedDither class
OrderedDither dither;

//PGraphics for color swatch
PGraphics swatch;

//for toggling the filter on/off in this example
boolean applyFilter = true;


void setup(){
  
 
  //ditheringLib only works with P2D or P3D
   size(960, 540, P2D);
   
   //create a new instance of OrderedDither and pass "this" in as the parent
   dither = new OrderedDither(this);
   
   //this draws a color swatch
   swatch = createGraphics(width, height, P2D);
   swatch.beginDraw();
   swatch.colorMode(HSB, width, height, height);
    for(int i=0; i<width; i++){
     for(int j = 0;j<height;j++){
      swatch.stroke(i, j, height - j);
      swatch.point(i, j);
     } 
  }
  swatch.endDraw(); 
}

void draw(){
  colorMode(HSB, width, height, height);
  background(0);
  //draw anything here. The brightness determines the dithing pattern
  
  //this draws the color swatch
  image(swatch, 0, 0);
    
  //logic for toggling filter on/off
  if (applyFilter == true) {
    
  //method for applying dither. The integer sets the size of the dithering blocks
   dither.applyDither(3);
   
  }
  
  // anything called after the filter will not have the effect applied
  
  // some triangles
  
  colorMode(HSB, 1.0, 1.0, 1.0);
  for(int i = 0;i<5;i++){
  pushMatrix();
  translate(width/2 + 250 + i*75*cos(i*2.345 + .45345), height/2 + 75 - 5*sin(i*3.4345));
  fill(i/5.0, 1.0, 0.9);
  triangle(0, -75, 75, 75, -120 -  16*sin(4.2343*i*TWO_PI + .5234), 75 + 12*sin(i*TWO_PI));
  popMatrix();
  }
  
  // a circle
  
  fill(0.0, 1.1, 0.8);
  circle(0, 0, 300);
}

//for toggling filter on/off
void mousePressed() {
  applyFilter = !applyFilter;
}
