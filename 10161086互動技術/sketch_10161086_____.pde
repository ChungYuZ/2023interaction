PImage []img=new PImage[3];
PImage img2;
import processing.sound.*;//需安装sound資料庫
SoundFile xmas;

void setup(){
  size(500,340);//視窗大小
  img[0]=loadImage("bg1.png");//載入圖片
  img[1]=loadImage("bg2.png");
  img[2]=loadImage("bg3.png");
  img2=loadImage("player.png");//主角
  img2.resize(60,60);//主角大小設定
  xmas=new SoundFile(this,"song.mp3");//加入音樂
  xmas.play();
}
float x=0,y=0;
float vy=0;
void draw(){
  image(img[0],x,0); //圖片位置
  image(img[1],x+999,0);//999為圖片寬度
  image(img[2],x+999+999,0);//第三張位置
  image(img[0],x+999+999+999,0);//解決破圖問題

  image(img2,250,y);//主角圖層在上
  y+=vy;
  vy+=0.98;//重力
  y=constrain(y,0,height-60);//設定邊界(60為主角高度，若設定低於60會超出底部)

  x-=5;//移動(向左)
  if(x<-999-999-999) x=0;
}
void keyPressed(){
  if(keyCode==UP){
    vy=-10;
  }
}
