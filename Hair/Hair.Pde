int numStrands = 100; // Number of hair strands
int pointsPerStrand = 50; // Number of points per strand
PVector[][] hair; // Array to store hair strand points
float rollSpeed = 0.05; // Speed of the roll
float initialLength = 200; // Initial length of the hair
float coilTightness = 0.1; // How tight the coil is
float hairWidth = 2; // Width of the hair strand

void setup() {
  size(800, 600);
  hair = new PVector[numStrands][pointsPerStrand]; // Initialize hair array

  // Initialize hair strand points in a straight line
  for (int i = 0; i < numStrands; i++) {
    for (int j = 0; j < pointsPerStrand; j++) {
      float x = width / 2 + i * hairWidth - (numStrands * hairWidth / 2);
      float y = height - (j * (initialLength / pointsPerStrand));
      hair[i][j] = new PVector(x, y);
    }
  }
}

void draw() {
  background(255);

  // Update and draw hair strands
  for (int i = 0; i < numStrands; i++) {
    beginShape();
    noFill();
    // Set stroke color to blonde
    stroke(255, 223, 0); // RGB color for blonde
    strokeWeight(2);
    for (int j = 0; j < pointsPerStrand; j++) {
      // Roll effect
      float angle = rollSpeed * frameCount + j * coilTightness;
      float radius = (initialLength / pointsPerStrand) * j;
      float x = width / 2 + radius * cos(angle + i * 0.05);
      float y = height / 2 + radius * sin(angle + i * 0.05);
      hair[i][j].set(x, y);
      vertex(hair[i][j].x, hair[i][j].y);
    }
    endShape();
  }
}
