//A Frog in the Rice Field
//By: Alessia Signorino

// Become a frog in a rice field and catch as many fireflies as you can before sunrise!
// You can move on x axis with mouse and you can jump with webcam (eventually) ****
// The fireflies breathe and move organically (looks as if it it moves closer and further)
// Your score is tracked and shown as lit orbs (you did eat fireflies after all)
// Stream of consciousness will display fun frog facts and childhood memories as text strings
// The background changes gradually from night to sunrise, making the fireflies harder to see

int x;
int y;
int frogInset = 40;

// Global variables for firefly, frog, score and sky
Firefly[] fireflies = new Firefly[15];
Frog frog;
Sky sky;
Score score;

void setup() {
  size(1920, 1080);
  frameRate(50);

  ///ADD FONT 

  // Setup array for fireflies
  for (int i=0; i < fireflies.length; i++) {
    fireflies[i] = new Firefly();
  }

  // Create a sky
  sky = new Sky();

  //Create a frog at the bottom of the screen
  frog = new Frog(width-frogInset, 0, "frog.png", "tongue.png", 10);
  frog.y = height - frog.imageFrog.height-60;

  //Create score class
  score = new Score(width/2, height/4);
}

void draw() {
  background(0);

  //Display sky
  sky.display();

  //Display and update frog
  frog.update();
  frog.display();
  
  //display fireflies
  for (int i=0; i < fireflies.length; i++) {
    frog.collide(fireflies[i]);
    fireflies[i].display();
    fireflies[i].update();
  }

  //Display and track game over methods
  score.display();
  score.trackGameOver();
}

//Keyboard controls
void mousePressed() {
  score.addPoint();
}

void keyPressed() {
  frog.keyPressed();
}

void keyReleased() {
  frog.keyReleased();
}