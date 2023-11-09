PImage img;
int [][]pos={{92,491},{244,524},{178,524},{160,491},{150,457},{197,490},{228,489},{261,488},{323,455},{296,487},{332,491},{365,489},{315,523},{280,524},{354,456},{390,455},{86,455},{184,455},{127,489},{219,456},{289,456},{212,521},{118,455},{141,523},{254,456},{111,525}};
void setup(){
  size(800,600);
  img=loadImage("keyboard.png");
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);
  image(img,0,600-266);
  fill(255,0,0,128);
  rect(mouseX,mouseY,28,30,5);
  fill(0,255,0,128);
  for(int i=0;i<26;i++){
    if(ID<typing.length() && typing.charAt(0)-'a'==i) rect(pos[i][0],pos[i][1],28,30,5);
    if(pressed[i])rect(pos[i][0],pos[i][1],28,30,5);
  }
  textSize(50);
  fill(0);
  text(typing.charAt(0),50,100);
  text(typing,50,50);
  fill(255,0,0);
  if(ID<typing.length())text(typed+typing.charAt(ID),50,100);
  fill(0);
  text(typed,50,100);
}
String typing="printfprintfprintf";
String typed="";
int ID=0;
boolean[] pressed=new boolean[26];
void keyPressed(){
  if(key>='a'&&key<='z'){
    if(ID<typing.length() && key==typing.charAt(ID)){
      pressed[key-'a']=true;
      typed+=key;
      ID++;
    }else{
       background(255,0,0); 
    }
  }
}
void keyReleased(){
  if(key>='a'&&key<='z') pressed[key-'a']=false;
}
void mousePressed(){
  println(mouseX,mouseY);
}
