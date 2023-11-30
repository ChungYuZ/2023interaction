int playerX, playerY;
int playerSize = 50;  // 腳色的尺寸
PImage playerImage;    // 腳色的圖片
int gravity = 1;
float jumpStrength = -15;
boolean isJumping = false;

ArrayList<Obstacle> obstacles;

void setup() {
  size(400, 300);
  
  // 載入腳色的圖片
  playerImage = loadImage("player.png");
  
  // 初始位置在畫面中央
  playerX = width / 2;
  playerY = height / 2 - playerSize / 2;  // 腳色的Y位置要根據尺寸居中

  obstacles = new ArrayList<Obstacle>();
}

void draw() {
  background(37,37,207);

  // 應用地心引力
  if (!isJumping) {
    playerY += gravity;
  }

  // 限制角色在畫面邊緣
  playerY = constrain(playerY, 0, height - playerSize);

  // 繪製角色
  image(playerImage, playerX, playerY, playerSize, playerSize);

  // 更新障礙物
  for (Obstacle obs : obstacles) {
    obs.update();
    obs.display();

    // 檢測碰撞
    if (obs.checkCollision(playerX, playerY, playerSize)) {
      gameOver();
    }
  }

  // 生成新的障礙物
  if (frameCount % 60 == 0) {
    obstacles.add(new Obstacle(true));  // 從上邊界生成
    obstacles.add(new Obstacle(false)); // 從下邊界生成
  }

  // 移除離開畫面的障礙物
  for (int i = obstacles.size()-1; i >= 0; i--) {
    if (obstacles.get(i).offscreen()) {
      obstacles.remove(i);
    }
  }
}

void keyPressed() {
  if (keyCode == UP && !isJumping) {
    isJumping = true;
    playerY += jumpStrength;  // 將跳躍強度應用到 Y 位置
    jumpStrength += 1.5;       // 增加跳躍強度
  }
}

void keyReleased() {
  // 空白鍵被釋放時停止跳躍
  if (keyCode == UP) {
    isJumping = false;
    jumpStrength = -15;  // 重置跳躍強度
  }
}

void gameOver() {
  textSize(32);
  fill(255, 0, 0);
  text("Game Over!", width/2 - 100, height/2 - 50);
  noLoop(); // 停止遊戲循環
}

class Obstacle {
  float x, y;
  float w = 20;  // 固定寬度
  float h;      // 隨機長度
  float speed = 2;  // 固定速度

  Obstacle(boolean fromTop) {
    x = width;

    // 隨機選擇是從上邊界還是下邊界生成
    if (fromTop) {
      y = 0;
      h = random(80, 110);  // 80到110之間的隨機長度
    } else {
      y = height - random(80, 110);  // 80到110之間的隨機長度
      h = random(80, 110);  // 80到110之間的隨機長度
    }
  }

  void update() {
    x -= speed;
  }

  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  boolean checkCollision(float px, float py, float ps) {
    return (px + ps > x && px < x + w && py + ps > y && py < y + h);
  }

  boolean offscreen() {
    return x + w < 0;
  }
}
