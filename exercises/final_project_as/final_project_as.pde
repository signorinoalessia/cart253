/* Things to fix: (1)Make frog jump (2)add firefly orbs around frog instead (3) plants visible
 Things to add aesthetically: add cricket sounds, change sky a bit more pastel*/

//A Frog in the Rice Field
//By: Alessia Signorino

// Become a frog in a rice field and catch as many fireflies as you can before sunrise!
// You can move on x axis with mouse and you can jump with webcam (eventually)****
// The fireflies breathe and move organically (looks as if it it moves closer and further)
// Your score is tracked and shown as lit orbs (you did eat fireflies after all) *****
// Stream of consciousness will display fun frog facts and childhood memories as text strings
// The background changes gradually from night to sunrise, making the fireflies harder to see

//Video library and Webcam object
import processing.video.*;
Capture video;

int x;
int y;
int frogInset = 40;

// Global variables for firefly, frog, score and sky
Firefly[] fireflies = new Firefly[30];
Frog frog;
Sky sky;
Score score;

//Background
PImage imagePlants;

void setup() {
  size(1920, 1080);
  frameRate(50);

  //video capture initialized
  video = new Capture(this, 320, 240);
  video.start();

  //Background image for plants
  imagePlants = loadImage("ricefield.png");

  ///ADD FONT 

  // Setup array for fireflies
  for (int i=0; i < fireflies.length; i++) {
    fireflies[i] = new Firefly();
  }

  // Create a sky
  sky = new Sky();

  //Create a frog at the bottom of the screen
  frog = new Frog(width-frogInset, 0, "frog.png", "tongue.png", 10);
  frog.y = height - frog.imageFrog.height-30;

  //Create score class
  score = new Score(width/2, height/4);
}


void draw() {
  //background(0);

  // Frog RGB Input
  frog.frogInput();
  
  //Display sky
  sky.display();
  
  //Plants in background
  imageMode(CENTER);
  image(imagePlants, 0, 0);
  

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
  
  image(video,0,0,320,240);
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