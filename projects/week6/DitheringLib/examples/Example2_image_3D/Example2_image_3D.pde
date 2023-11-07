// import the dithering library
import ditheringLib.*;

//OrderedDither class
OrderedDither dither;

// for example image
PImage img;

//for toggling the filter on/off in this example
boolean applyFilter = true;


void setup() {
  
  size(960, 540, P3D);
  //create a new instance of OrderedDither and pass "this" in as the parent
  dither = new OrderedDither(this);
  
  //load an image;
  img = loadImage("bike.jpeg");
  noStroke();
}

void draw() {
  background(0);
  //enable lights
  lights();
  
  //draw anything here. The brightness determines the dithing pattern
  
  //draw image
  fill(255);
  image(img, 0, 0, width, height);
  
  //draw a rotating cube
  fill(123, 34, 234);
  pushMatrix();
  translate(width/2 - 300, height/2 + 50, 40);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  box(75);
  popMatrix();
  
 //logic for toggling filter on/off
  if (applyFilter == true) {
    
  //method for applying dither. The integer sets the size of the dithering blocks
  
   dither.applyDither(3);
  
  }
  
  // anything called after the filter will not have the dithering effect applied
  
  //a sphere
  fill(123, 123, 255);
  translate(width/2 + 25, height/2 - 175);
  sphere(50);
}
void mousePressed() {
  applyFilter = !applyFilter;
}
