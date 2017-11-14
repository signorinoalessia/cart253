//A Frog in the Rice Field
//By: Alessia Signorino

// Wear the skin of a frog in a rice field and catch as many fireflies as you can before sunrise! 
// You can move on x axis with mouse and you can jump with webcam (eventually)
// The fireflies breathe and move organically (looks as if it it moves closer and further)
// Your score is tracked and shown as lit orbs (you did eat fireflies after all)
// Stream of consciousness will display fun frog facts and childhood memories as text strings (eventually)

int x;
int y;

Firefly[] fireflies = new Firefly[8];

void setup() {
  size(1920, 1080);
  frameRate(50);

  for (int i=0; i < fireflies.length; i++) {
    fireflies[i] = new Firefly();
  }
}

void draw() {
  background(0);

  for (int i=0; i < fireflies.length; i++) {
    fireflies[i].display();
  }
}