int W = 800; 
int H = 800; 
int S = 20;
int R = 20; 
int D = 20; 
int vor = 0;
int balls = 1;
PGraphics palette;
ArrayList<Pnt> pnts = new ArrayList<Pnt>();

PFont f;

void setup(){
   size(800, 800, P3D);
   colorMode(RGB, 1.0, 1.0, 1.0);
  background(.5);
  ortho(-W/2, W/2, -H/2, H/2);
  noStroke();
  smooth(8);
  palette = createGraphics(800, 200);
  f = createFont("Staatliches", 20, true);
  textFont(f, 20);
  
   
}

void draw(){
  colorMode(RGB, 1.0, 1.0, 1.0);
  background(.5);
  colorMode(HSB, 1.0, 1.0, 1.0);
  drawPalette();
  image(palette, 0, 0); 

  
  if(mouseY < 200){
    colorMode(HSB, 1.0, 1.0, 1.0);
      float normI = float(mouseX)/W;
      float normJ = float(mouseY)/200;
      //int jj = j>(H/2) ? j - j%(H/2) : j;
      fill(normI , normJ, 1-normJ*normJ);
      if(vor == 1){
       circle(mouseX, mouseY, 40); 
       fill(.4, 1, 1);
        textAlign(CENTER);
        textSize(20);
        text("1-9 change the look of the voronoi", 400, 770);
        text("press c for circles    press x to clear    press p or click down here to save", 400, 790);
      }
      else if(balls == 1){
        circle(mouseX, mouseY, 40);
        rect(0, 200, 800, 40);
        arc(400, 240, R*2, R*2, 0, PI);     
        fill(.4, 1, 1);
        textAlign(CENTER);
        textSize(20);
        text("click on a color to release a circle", 400, 750);
        text("1-9 change the size of the circle", 400, 770);
        text("press v for voronoi    press x to clear    press p or click down here to save", 400, 790);
       
      }
    }
    for(Pnt p : pnts){
      p.render();
      p.animate();
      }
     collide();
   // print(pnts.size());
 }


void drawPalette(){
  
  palette.beginDraw();
  palette.colorMode(HSB, W, 1.0, 1.0);
  palette.background(.5);
  
  for(int i=0; i<W ;i++){
    for(int j=0; j<200; j++){
      float normI = float(i)/W;
      float normJ = float(j)/200;
      //int jj = j>(H/2) ? j - j%(H/2) : j;
      palette.stroke(i , normJ, 1-normJ*normJ);
      palette.point(i,j);
    }
  }
  palette.endDraw();
}


void pickColor(){
  colorMode(HSB, 1.0, 1.0, 1.0);
  float mouX = float(mouseX)/W;
  float mouY = float(mouseY)/200;
  fill(mouX, mouY, 1-mouY*mouY);
}


void mousePressed(){
  if(mouseY<200){
    if(vor==1){
     R = 1200; 
    }
 pickColor();
     float normI = float(mouseX)/W;
     float normJ = float(mouseY)/200;
     fill(normI , normJ, 1-normJ*normJ);
     //circle(400, 50, 40);
     PVector initPos = new PVector(400, 250, 0);
     PVector initOldP = new PVector(400 + random(10)-5, 250 + random(10)-5, 0);
     PVector initCol = new PVector(normI, normJ, 1-normJ*normJ);
     int initDia = D;
     int initSides = S;
     PVector initGrav = new PVector(0, 0);
     float initMass = 201 - D;
     int initBorder = R;
     pnts.add(new Pnt(initPos, initOldP, initCol, initDia, initSides, initGrav, initMass, initBorder));
        }
     else { 
       save("color-" + day() + "_" + month() + "_" + year() + "-" + hour() + "." + minute() + "." + second() + ".png");
    
      }
}

void mouseReleased(){
 if(mouseX<200){
  }
 }
 


void mouseDragged(){
  //if(mouseX<200){
  // PVector colo = pnts.get(pnts.size() - 1).col; 
  // int dia = pnts.get(pnts.size() - 1).dia; 
  // fill(colo.x, colo.y, colo.z);
  // circle(mouseX, mouseY, float(dia)); 
   
  //}
}

void movePnt(){
  
}

void keyPressed() {
  if(key==99){
   for(Pnt p : pnts){
   p.border = p.dia;
   p.sides = 40;
   
   }
   balls = 1;
   vor = 0;
   R = 20;
   S = 40;
   D = 20;
  }
   if(key==118){
   for(Pnt p : pnts){
   p.border = 1200;
   
       } 
   vor = 1;
   balls = 0;
   D = 40;
    }
  if(key==49 && balls==1){
  R = 20;
  D = 20;
  S = 20;
  }
  if(key==50 && balls==1){
  R = 40;
  D = 40;
   S = 20;
  }
  if(key==51 && balls==1){
  R = 60; 
  D = 60;
   S = 40;
  }
  if(key==52 && balls==1){
  R = 80;
  D = 80;
   S = 40;
  }
  if(key==53 && balls==1){
  R = 100; 
  D = 100;
   S = 40;
  }
  if(key==54 && balls==1){
  R = 120; 
  D = 120;
   S = 40;
  }
  if(key==55 && balls==1){
  R = 140;
  D = 140;
   S = 40;
  }
  if(key==56 && balls==1){
  R = 160; 
  D = 160;
   S = 40;
  }
  if(key==57 && balls==1){
  R = 200; 
  D = 200;
   S = 40;
  }
  
  
  
  
  if(key==49 && vor==1){
   S = 3;
  for(Pnt p : pnts){
   p.sides = 3; 
  }
  }
  if(key==50 && vor==1){
    S = 4;
  for(Pnt p : pnts){
   p.sides = 4; 
  }
  }
  if(key==51 && vor==1){
    S = 5;
  for(Pnt p : pnts){
   p.sides = 5; 
  }
  }
  if(key==52 && vor==1){
    S = 6;
  for(Pnt p : pnts){
   p.sides = 6; 
  }
  }
  if(key==53 && vor==1){
    S = 7;
  for(Pnt p : pnts){
   p.sides = 7; 
  }
  }
  if(key==54 && vor==1){
    S = 8;
  for(Pnt p : pnts){
   p.sides = 8; 
  }
  }
  if(key==55 && vor==1){
    S = 20;
  for(Pnt p : pnts){
   p.sides = 20; 
  }
  }
  if(key==56 && vor==1){
    S = 40;
  for(Pnt p : pnts){
   p.sides = 40; 
  }
  }
  if(key==57 && vor==1){
    S = 60;
  for(Pnt p : pnts){
   p.sides = 60; 
  }
  }
  if(key==120){
  pnts.clear();  
  }
  if(key==112){
    save("color-" + day() + "_" + month() + "_" + year() + "-" + hour() + "." + minute() + "." + second() + ".png");
    
  }
}
// collision from u/Numsgil https://www.gamedev.net/forums/topic/370826-sphere-collision-response-with-verlet/
void collide(){
  
    
    for(int i=0; i<pnts.size();i++){
      for(int j = 0; j<pnts.size();j++){
       PVector AB = PVector.sub(pnts.get(j).pos, pnts.get(i).pos);
       float minDist = pnts.get(i).dia + pnts.get(j).dia;
       //minDist *= minDist;
       float curDist = sqrt(AB.x*AB.x + AB.y*AB.y);
       if (curDist < minDist){
        AB = PVector.mult(AB, minDist / ((pnts.get(i).mass+pnts.get(j).mass)*2*(minDist+curDist))); 
        PVector ABi = PVector.mult(AB, pnts.get(i).mass);
        PVector ABj = PVector.mult(AB, pnts.get(j).mass);
        pnts.get(i).pos = PVector.sub(pnts.get(i).pos, ABi);
        pnts.get(j).pos = PVector.add(pnts.get(j).pos, ABj);
        
       }
    
      }
    }
  
  
}

class Pnt {
  PVector pos;
  PVector oldPos;
  PVector col;
  int dia;
  int sides;
  PVector grav;
  float mass;
  int border;
  
  Pnt(PVector pos, PVector oldPos, PVector col, int dia, int sides, PVector grav, float mass, int border){
   this.pos = pos;
   this.oldPos = oldPos;
   this.col = col;
   this.dia = dia;
   this.sides = sides;
   this.grav = grav;
   this.mass = mass;
   this.border = border;
   
  }
    void render(){
    
    pushMatrix();
    translate(this.pos.x, this.pos.y , 0);
    // u/solub on: https://discourse.processing.org/t/creating-voronoi-patterns/14635/6    
    //Drawing a Cone (3D)
    fill(this.col.x, this.col.y, this.col.z);
    //circle(0, 0, this.dia);
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<this.sides; i++) {
       float theta = TWO_PI / this.sides;
       vertex(0, 0, 0);
       vertex(this.border * cos(theta*i), this.border * sin(theta*i), -this.border);
       vertex(this.border * cos(theta*(i+1)), this.border * sin(theta*(i+1)), -this.border);
    endShape();
      }  
    //pushStyle();
    //strokeWeight(8);
    //stroke(0);
    //point(0, 0, 0);
    //popStyle();
    popMatrix();  
    }
    
    
    void animate(){
     PVector vel = PVector.sub(this.pos, this.oldPos); 
     vel = PVector.mult(vel, 0.999);
     this.oldPos = this.pos;
     vel = PVector.add(vel, this.grav);
     if(vel.x>10){
       vel.x = 10.0;
     }
     if(vel.y>10){
       vel.y = 10.0;
     }
     
     this.pos = PVector.add(this.pos, vel);
    
     if(this.pos.x<(0 + this.dia)){
       this.pos.x = 0 + this.dia;
       this.oldPos.x = 0 + this.dia + vel.x;
     }
     if(this.pos.x>(width-this.dia)){
       this.pos.x = width - this.dia;
       this.oldPos.x = width - this.dia + vel.x;
     }
     if(this.pos.y<(240 + this.dia)){
       this.pos.y = 240 + this.dia;
       this.oldPos.y = 240 + this.dia + vel.y;
     }
    else if(this.pos.y>(height - this.dia)){
       this.pos.y = height - this.dia;
       this.oldPos.y = height - this.dia + vel.y;
     } 
     
    }
    
   
    
}
