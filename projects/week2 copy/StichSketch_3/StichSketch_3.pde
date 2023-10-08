Dash dash;
dPlane plane1;
dPlane plane2;
dPlane plane3;
PVector st;
class Dash{
  int off;
  int len; 
  int reps;

  Dash(int off, int len, int reps){
  this.off = off;
  this.len = len;
  this.reps = reps;
  for(int i = 0; i<this.reps; i++){
      line((2*i+this.off)*len - reps*len, 0, (2*i + 1 + this.off)*len - reps*len, 0);
      }
   }
}

class dPlane {
  float rot;
  int spread;
  int numDashes;
  PVector start;
  dPlane(float rot, int spread, int numDashes, PVector start){
   this.rot = rot;
   this.spread = spread;
   this.numDashes = numDashes;
   this.start = start;
   
   pushMatrix();
   translate(width/2, height/2);
   rotate(this.rot);
   translate(0, -numDashes*spread/2);
   for(int i = 0; i<this.numDashes;i++){
    translate(0, spread);
    int rand = floor(random(0, 2));
    dash = new Dash(rand, 24, 12);
   }
   popMatrix();
  }
}

void setup(){
  size(600, 600);
  background(255);
  st = new PVector(0, 0);
  plane1 = new dPlane(PI, 24, 24, st );
  plane2 = new dPlane(PI/4, 24, 24, st);
  plane3 = new dPlane(-PI/4, 24, 24, st);
  
 
}
