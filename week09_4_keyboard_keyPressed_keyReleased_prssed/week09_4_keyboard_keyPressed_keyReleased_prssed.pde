PImage img;
int [][]pos={{93,490},{247,523},{178,523},{161,491},{153,456},{195,491},{231,489},{265,491},{323,455},{298,488},{333,491},{367,487},{315,523},{281,523},{353,457},{392,455},{83,456},{187,457},{127,491},{220,457},{289,457},{212,523},{120,455},{143,523},{255,455},{108,523}};
void setup(){
  size(800,600);
  img=loadImage("keyboard.png");
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);//清背景
  image(img,0,600-266);
  fill(255,0,0,128);//半透明
  rect(mouseX,mouseY,28,30,5);//圓滑四邊形5
  fill(0,255,0,128);
  for(int i=0;i<26;i++){
    if(pressed[i]) rect(pos[i][0],pos[i][1],28,30,5); 
  }
}
boolean[]pressed=new boolean[26];//java的陣列宣告
void keyPressed(){
  if(key>='a'&&key<='z')pressed[key-'a']=true; 
}
void keyReleased(){
  if(key>='a'&&key<='z')pressed[key-'a']=false; 
}
void mousePressed(){
  println(mouseX,mouseY);//定位找出滑鼠座標
}
