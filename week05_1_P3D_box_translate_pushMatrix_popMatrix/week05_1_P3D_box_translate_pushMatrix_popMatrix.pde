void setup(){
    size(400,400,P3D);//3D功能  
}
void draw(){
  background(#FFFFF2);
  pushMatrix();//備份矩陣
    translate(mouseX,mouseY);//移動
    box(100);//3D方塊
   popMatrix();//還原矩陣
}
