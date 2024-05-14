PVector dinoPosition;
PVector dinoVelocity;
float groundHeight = 50;
boolean isJumping = false;
int score = 0;
ArrayList<PVector> obstacles;
PVector obstacleSize = new PVector(40, 40);
int obstacleFrequency = 60;
int gravity = 1;

// Setup game
void setup() {
  size(800, 400);
  dinoPosition = new PVector(100, height - groundHeight - 50);
  dinoVelocity = new PVector(0, 0);
  obstacles = new ArrayList<PVector>();
  frameRate(60);
}

// Main game loop
void draw() {
  // Background and ground
  background(150, 200, 255);
  fill(100, 255, 100);
  rect(0, height - groundHeight, width, groundHeight);
  
  // Update and draw dinosaur
  dinoPosition.add(dinoVelocity);
  if (dinoPosition.y < height - groundHeight - 50) {
    dinoVelocity.y += gravity;
  } else {
    dinoPosition.y = height - groundHeight - 50;
    dinoVelocity.y = 0;
    isJumping = false;
  }
  fill(0, 0, 255);
  rect(dinoPosition.x, dinoPosition.y, 50, 50);
  
  // Update and draw obstacles
  if (frameCount % obstacleFrequency == 0) {
    obstacles.add(new PVector(width, height - groundHeight - obstacleSize.y));
  }
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    PVector obstacle = obstacles.get(i);
    obstacle.x -= 8;
    if (obstacle.x + obstacleSize.x < 0) {
      obstacles.remove(i);
      score++;
    } else {
      fill(255, 0, 0);
      rect(obstacle.x, obstacle.y, obstacleSize.x, obstacleSize.y);
      
      // Collision detection
      if (dinoPosition.x < obstacle.x + obstacleSize.x &&
          dinoPosition.x + 50 > obstacle.x &&
          dinoPosition.y < obstacle.y + obstacleSize.y &&
          dinoPosition.y + 50 > obstacle.y) {
        gameOver();
      }
    }
  }
  
  // Draw score
  fill(0);
  textSize(20);
  text("Score: " + score, 10, 30);
}

// Handle keypress to jump
void keyPressed() {
  if (key == ' ' && !isJumping) {
    dinoVelocity.y = -15;
    isJumping = true;
  }
}

// Game over
void gameOver() {
  noLoop();
  fill(255, 0, 0);
  textSize(40);
  text("Game Over! Score: " + score, width / 4, height / 2);
}
