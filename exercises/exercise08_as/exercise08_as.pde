//A Frog in the Rice Field
//By: Alessia Signorino

// Become a frog in a rice field and catch as many fireflies as you can before sunrise! Q3***
// You can move on x axis with mouse and you can jump with webcam (eventually)
// The fireflies breathe and move organically (looks as if it it moves closer and further)
// Your score is tracked and shown as lit orbs (you did eat fireflies after all) Q2****
// Stream of consciousness will display fun frog facts and childhood memories as text strings (eventually)
// The background changes gradually from night to sunrise, making the fireflies harder to see Q1***

int x;
int y;
int frogInset = 40;

// Global variables for fireflies and frog
Firefly[] fireflies = new Firefly[8];
Frog frog;
Sky sky;

void setup() {
  size(1920, 1080);
  frameRate(50);

  //setup array for fireflies
  for (int i=0; i < fireflies.length; i++) {
    fireflies[i] = new Firefly();
  }
  
  sky = new Sky();
  
  //*** What type of variables must be added to constructor?***
  //Create a frog at the bottom of the screen
  frog = new Frog(width-frogInset, height/3, "frog.png");
}

void draw() {
  background(0);

  sky.display();
  frog.display();
  //display fireflies
  for (int i=0; i < fireflies.length; i++) {
    fireflies[i].display();
  }
}

void keyPressed() {
  frog.keyPressed();
}