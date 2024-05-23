PVector captainPosition;
PVector captainVelocity;
float groundHeight = 50;
boolean isJumping = false;
int score = 0;
ArrayList<PVector> obstacles;
PVector hairSize = new PVector(40, 40);
int hairFrequency = 60;
float gravity = 1.0;
PImage blackbeardImage;
PImage hairImage;
PImage Goku;
int blackbeardWidth = 100;
int blackbeardHeight = 100;
int hairWidth = 50;
int hairHeight = 50;
boolean showWarning = true;
int warningDuration = 180;
int warningFrameCount = 0;
ArrayList<PVector> stars;
ArrayList<PVector> craters;

// Setup game
void setup() {
  size(800, 400);
  blackbeardImage = loadImage("blackbeard.jpg");
  hairImage = loadImage("HairGoku.png");
  Goku = loadImage("gokuGRRR.jpg");
  initializeGame();
  frameRate(60);
}

void initializeGame() {
  captainPosition = new PVector(100, height - groundHeight - blackbeardHeight);
  captainVelocity = new PVector(0, 0);
  obstacles = new ArrayList<PVector>();
  isJumping = false;
  score = 0;
  showWarning = true;
  warningFrameCount = 0;
  stars = generateStars();
  craters = generateCraters();
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
    background(0, 0, 50); // Dark blue background for space
    drawStars();
    
    fill(169, 169, 169); // Grey color for the moon
    rect(0, height - groundHeight, width, groundHeight);
    drawCraters();
    
    updateCaptain();
    drawBlackbeard(captainPosition.x, captainPosition.y);
    
    drawGoku(650, 320);
   
    updateObstacles();
    
    // Draw score centered
    fill(255);
    textSize(20);
    textAlign(CENTER, TOP);
    text("Score: " + score, width / 2, 10); // Centered horizontally, 10 pixels from top
  }
}

// Update and draw captain
void updateCaptain() {
  captainPosition.add(captainVelocity);
  if (captainPosition.y < height - groundHeight - blackbeardHeight) {
    captainVelocity.y += gravity;
  } else {
    captainPosition.y = height - groundHeight - blackbeardHeight;
    captainVelocity.y = 0;
    isJumping = false;
  }
}

// Update and draw obstacles
void updateObstacles() {
  if (frameCount % hairFrequency == 0) {
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
      if (captainPosition.x < obstacle.x + hairWidth &&
          captainPosition.x + blackbeardWidth > obstacle.x &&
          captainPosition.y < obstacle.y + hairHeight &&
          captainPosition.y + blackbeardHeight > obstacle.y) {
        gameOver();
      }
    }
  }
}

// Draw Blackbeard character
void drawBlackbeard(float x, float y) {
  image(blackbeardImage, x, y, blackbeardWidth, blackbeardHeight);
}

void drawGoku(float x, float y){
  image(Goku ,650 ,350, 800, 350); 
}

// Draw hair obstacle
void drawHair(float x, float y) {
  image(hairImage, x, y, hairWidth, hairHeight);
}

// Generate stars for the space background
ArrayList<PVector> generateStars() {
  ArrayList<PVector> stars = new ArrayList<PVector>();
  for (int i = 0; i < 100; i++) {
    float starX = random(width);
    float starY = random(height - groundHeight);
    stars.add(new PVector(starX, starY));
  }
  return stars;
}

// Draw stars in the space background
void drawStars() {
  fill(255, 255, 255);
  for (PVector star : stars) {
    ellipse(star.x, star.y, 2, 2);
  }
}

// Generate craters on the moon-like ground
ArrayList<PVector> generateCraters() {
  ArrayList<PVector> craters = new ArrayList<PVector>();
  for (int i = 0; i < 10; i++) {
    float craterX = random(width);
    float craterY = height - groundHeight + random(5, 20);
    craters.add(new PVector(craterX, craterY));
  }
  return craters;
}

// Draw craters on the moon-like ground
void drawCraters() {
  fill(105, 105, 105); // Darker grey for craters
  for (PVector crater : craters) {
    ellipse(crater.x, crater.y, random(10, 20), random(10, 20));
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
    captainVelocity.y = -15;
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
