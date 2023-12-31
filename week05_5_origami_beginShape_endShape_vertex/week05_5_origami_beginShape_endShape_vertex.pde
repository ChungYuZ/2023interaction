ArrayList<PVector> pt;//大資料結構ArrayList
void setup(){
  size(400,400,P3D);
  pt=new ArrayList<PVector>();
}//初始化，把大的資料結構準備好(裡面放小資料結構)
void draw(){
  background(#FFFFF2);
  for(PVector p:pt){
    ellipse(p.x,p.y,10,10); 
  } 
  beginShape();
  for(PVector p:pt){//特殊for迴圈，得小資料結構
    vertex(p.x,p.y); 
  }
  endShape();
}
void mousePressed(){
   pt.add( new PVector(mouseX,mouseY));
}//大資料結構內加入小的PVector物件
