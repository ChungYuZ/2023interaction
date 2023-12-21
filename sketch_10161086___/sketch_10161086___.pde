PImage []img=new PImage[3];
PImage img2;

void setup(){
  size(500,340);//視窗大小
  img[0]=loadImage("bg1.png");//載入圖片
  img[1]=loadImage("bg2.png");
  img[2]=loadImage("bg3.png");
  img2=loadImage("player.png");//主角
  img2.resize(60,60);//主角大小設定
}
float x=0;
void draw(){
  image(img[0],x,0); //圖片位置
  image(img[1],x+999,0);//999為圖片寬度
  image(img[2],x+999+999,0);//第三張位置
  image(img[0],x+999+999+999,0);//解決破圖問題

  image(img2,250,150);//主角圖層在上
  
  x-=5;//移動(向左)
  if(x<-999-999-999) x=0;
}
void keyPressed() {
  if (keyCode ==UP) {

  }
