// The font
PFont myNiceFont;
// The text
String myString = "Boing";
// Position and dimensions
float x;
float y;
float w;
float h;
// Velocity
int vx = 5;
int vy = 5;
void setup() {
  size(640, 640);
  // Load the font file
  myNiceFont = createFont("Helvetica.vlw", 64);
  // Set the font, size, alignment
  textFont(myNiceFont);
  textSize(64);
  textAlign(CENTER, CENTER);
  // Starting position
  x = width/2;
  y = height/2;
  // Calculate dimensions based on width and ascent/descent
  w = textWidth(myString);
  h = textAscent() + textDescent();
}
void draw() {
  // Draw the text on screen
  background(255);
  fill(255, 0, 0);
  text(myString, x, y);
  // Update position with velocity
  x += vx;
  y += vy;
  // Check for bouncing (possible because we know the dimensions)
  if (x + w/2 > width || x - w/2 < 0) {
    vx = -vx;
  }
  if (y + h/2 > height || y - h/2 < 0) {
    vy = -vy;
  }
}