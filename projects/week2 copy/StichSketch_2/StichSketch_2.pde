class Dash{
  int off;
  int len; 
  int reps;

  Dash(int off, int len, int reps){
  this.off = off;
  this.len = len;
  this.reps = reps;
  for(int i = 0; i<this.reps; i++){
      line((2*i+this.off)*len, 0, (2*i + 1 + this.off)*len, 0);
      }
   }
}

class dPlane {
  float rot;
  int spread;
  dPlane(float rot, int spread){
   this.rot = rot;
   this.spread = spread;
   
  }
}
Dash dash;
void setup(){
  size(600, 600);
  background(255);
  translate(width/2, height/2);
  rotate(PI/4);
  dash = new Dash(0, 24, 12);
}
