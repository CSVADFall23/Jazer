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
      swatch.stroke(i, j, (height - j));
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
  
  //experimenting with varying block size
  
  for(int i =1; i<3;i++){
    int block = 2 + i;
   dither.applyDither(block);
  }
  }
  
  // anything called after the filter will not have the effect applied
  
}

//for toggling filter on/off
void mousePressed() {
  applyFilter = !applyFilter;
}
