//互動模式Interaction Mode(Active Mode)
void setup(){//設定
  size(500,500);//視窗大小(寬，高)
  background(255);//背景(白色)
}

void draw(){//畫圖 每秒畫60次
  if(mousePressed){//如果按下mouse
    line(mouseX,mouseY,pmouseX,pmouseY);
  }//畫線(滑鼠座標mouseX,mouseY，到之前的座標pmouseX,pmouseY);
}

void keyPressed(){//如果按下keyboard的key
  if(key=='1')stroke(255,0,0);//按下數字1，筆觸變紅色
  if(key=='2')stroke(0,255,0);//按下數字2，筆觸變綠色
  if(key=='3')stroke(0,0,255);//按下數字3，筆觸變藍色
  if(key=='s'||key=='S') save("output.png");//如果按下s鍵就存檔 檔名(output.png)
}
