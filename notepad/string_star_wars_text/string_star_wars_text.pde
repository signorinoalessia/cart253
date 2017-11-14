// The text
String crawler = "A long time ago, in a galaxy\nfar, far away, Pippin was typing a\n long String for an example in\nhis programming class.\n\nBut it was never quite long enough.";
// Position and velocity
float x;
float y;
float z;
// We'll move UP and IN on the y and z axes
int vz = -2;
int vy = -2;
void setup() {
  size(640, 640, P3D);
  // Set up the font
  textSize(64); // Font size
  textAlign(CENTER,CENTER); // Center align both horizontally and vertically
  // Starting position (below the bottom fo the window)
  x = width/2;
  y = 2*height;
  z = 0;
}
void draw() {
  background(0);
  // Using randomSeed to get the same stars every frame
  randomSeed(1);
  // Draw a bunch of stars for a galaxy far, far away
  for (int i = 0; i < 500; i++) {
    stroke(255);
    point(random(width),random(height));
  }
  // Use Star Wars Yellow
  fill(255,255,0);
  pushMatrix();
  // Translate to the current location of the text
  translate(x,y,z);
  // Rotate on the X so it "leans away from us"
  rotateX(radians(45));
  // Draw the text
  text(crawler, 0, 0, 0);
  popMatrix();
  // Update position based on velocity
  z += vz;
  y += vy;
}