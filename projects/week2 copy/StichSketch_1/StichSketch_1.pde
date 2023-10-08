void setup(){
  size(300, 300);
  background(255);
  float wid = width/12;
  float hei = height/12;
  for(int j = 0;j<12;j++){
  for (int i = 0;i<12;i++){
   if(i%2 !=0){
  line(i*wid, 0, i*wid + wid, 0);
    }
  }
  translate(0, hei);
}
}

void draw(){

}
