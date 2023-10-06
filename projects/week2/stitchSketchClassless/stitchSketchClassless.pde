import processing.pdf.*;

void setup(){
size(850, 1100);
background(255);
int vHex = 36;
int vWhy = 40;
int wid = width/vHex;
int hei = height/vWhy;

//beginRecord(PDF, "data/Hitomezashi9.pdf");
for(int i = 0; i<=vHex; i++){
  for(int j = 0; j<vWhy; j++){ 
    int randV = floor(random(0, 2));
   line(i*wid, 2*j*hei + 0.5*hei*(i%2), i*wid, 2*j*hei + hei + 0.5*hei*(i%2)); // verticle
  }
}
for(int j = 0; j< 2*vWhy;j++){
  int rand1 = floor(random(0, 2));
  for(int i = 0; i<=vHex;i++){
   line(2*i*wid + rand1*wid, j*hei + i*hei + rand1*0.5*hei, 2*i*wid + wid + rand1*wid, j*hei + i*hei + 0.5*hei + rand1*0.5*hei);
  }
}
for(int j = 0; j< 2*vWhy;j++){
  int rand1 = floor(random(0, 2));
  for(int i = 0; i<=vHex;i++){
   line(width - 2*i*wid - rand1*wid, j*hei + i*hei + rand1*0.5*hei + 0.5*hei, width -  2*i*wid - wid - rand1*wid, j*hei + i*hei + 0.5*hei + rand1*0.5*hei + 0.5*hei);
    }
  }
// endRecord();
}
 
