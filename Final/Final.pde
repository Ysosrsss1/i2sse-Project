PVector dinoPosition;
PVector dinoVelocity;
float groundHeight = 50;
boolean isJumping = false;
int score = 0;
ArrayList<PVector> obstacles;
PVector obstacleSize = new PVector(40, 40);
int obstacleFrequency = 60;
float gravity = 1.0;
PImage blackbeardImage;
PImage hairImage;
int blackbeardWidth = 100;//Desired width of the image
int blackbeardHeight = 100;//desired height of the image
int hairWidth = 50;       // Desired width of the hair image
int hairHeight = 50;     // Desired height of the hair image
boolean showWarning = true;
int warningDuration = 180; // Duration to show the warning in frames (3 seconds at 60 fps)
int warningFrameCount = 0;

// Setup game
void setup() {
  size(800, 400);
  blackbeardImage = loadImage("blackbeard.jpg"); // Load the JPG image for Blackbeard
  hairImage = loadImage("hair.jpg"); // Load the JPG image for the hair
  initializeGame();
  frameRate(60);
}

void initializeGame() {
  dinoPosition = new PVector(100, height - groundHeight - blackbeardHeight);
  dinoVelocity = new PVector(0, 0);
  obstacles = new ArrayList<PVector>();
  isJumping = false;
  score = 0;
  showWarning = true;
  warningFrameCount = 0;
  loop();
}

// Main game loop
void draw() {
  if (showWarning) {
    showWarningMessage();
    warningFrameCount++;
    if (warningFrameCount > warningDuration) {
      showWarning = false;
    }
  } else {
    // Space background
    background(0, 0, 50); // Dark blue background for space
    drawStars();
    
    // Moon-like ground
    fill(169, 169, 169); // Grey color for the moon
    rect(0, height - groundHeight, width, groundHeight);
    drawCraters();
    
    // Update and draw captain (Blackbeard)
    dinoPosition.add(dinoVelocity);
    if (dinoPosition.y < height - groundHeight - blackbeardHeight) {
      dinoVelocity.y += gravity;
    } else {
      dinoPosition.y = height - groundHeight - blackbeardHeight;
      dinoVelocity.y = 0;
      isJumping = false;
    }
    drawBlackbeard(dinoPosition.x, dinoPosition.y);
    
    // Update and draw obstacles
    if (frameCount % obstacleFrequency == 0) {
      float randomHeight = random(30, 70);
      obstacles.add(new PVector(width, height - groundHeight - randomHeight));
    }
    for (int i = obstacles.size() - 1; i >= 0; i--) {
      PVector obstacle = obstacles.get(i);
      obstacle.x -= 8;
      if (obstacle.x + hairWidth < 0) {
        obstacles.remove(i);
        score++;
      } else {
        drawHair(obstacle.x, obstacle.y);
        
        // Collision detection
        if (dinoPosition.x < obstacle.x + hairWidth &&
            dinoPosition.x + blackbeardWidth > obstacle.x &&
            dinoPosition.y < obstacle.y + hairHeight &&
            dinoPosition.y + blackbeardHeight > obstacle.y) {
          gameOver();
        }
      }
    }
    
    // Draw score
    fill(255);
    textSize(20);
    text("Score: " + score, 10, 30);
  }
}

// Draw Blackbeard character
void drawBlackbeard(float x, float y) {
  image(blackbeardImage, x, y, blackbeardWidth, blackbeardHeight);
}

// Draw hair obstacle
void drawHair(float x, float y) {
  image(hairImage, x, y, hairWidth, hairHeight);
}

// Draw stars in the space background
void drawStars() {
  for (int i = 0; i < 100; i++) {
    float starX = random(width);
    float starY = random(height - groundHeight);
    fill(255, 255, 255);
    ellipse(starX, starY, 2, 2);
  }
}

// Draw craters on the moon-like ground
void drawCraters() {
  for (int i = 0; i < 10; i++) {
    float craterX = random(width);
    float craterY = height - groundHeight + random(5, 20);
    float craterSize = random(10, 20);
    fill(105, 105, 105); // Darker grey for craters
    ellipse(craterX, craterY, craterSize, craterSize);
  }
}

// Show warning message
void showWarningMessage() {
  background(0);
  fill(255, 0, 0);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("WARNING: Incoming Hair Asteroids", width / 2, height / 2);
}

// Handle keypress to jump or restart
void keyPressed() {
  if (key == ' ' && !isJumping && !showWarning) {
    dinoVelocity.y = -15;
    isJumping = true;
  } else if (key == 'R' || key == 'r') {
    initializeGame();
  }
}

// Game over
void gameOver() {
  noLoop();
  fill(255, 0, 0);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Game Over! Score: " + score, width / 2, height / 2);
  textSize(20);
  text("Press 'R' to restart", width / 2, height / 2 + 50);
}
