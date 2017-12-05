/* Things to fix: fireflies' opacity decreases over time with sky (1)
 Things to add aesthetically: change sky a bit more pastel*/

//A Frog in the Rice Field
//By: Alessia Signorino

// Become a frog in a rice field and catch as many fireflies as you can before sunrise!
// You can move on x axis with mouse and you can jump with webcam when the colour blue is detected;
// The fireflies breathe and move organically (looks as if it it moves closer and further);
// Your score is tracked and shown as lit orbs (you did eat fireflies after all);
// Stream of consciousness will display fun frog facts and childhood memories as text strings;
// The background changes gradually from night to sunrise, making the fireflies harder to see!!!

//Video library and Webcam object
import processing.video.*;
Capture video;

//Import sound library
import processing.sound.*;

SoundFile crickets;
SoundFile crack;

int x;
int y;
int frogInset = 20;

// Global variables for firefly, frog, score and sky
Firefly[] fireflies = new Firefly[12];
Frog frog;
Sky sky;
Score score;
boolean gameOver =false;

//Background
PImage imagePlants;

void setup() {
  size(1920, 1024);
  frameRate(50);

  //video capture initialized
  video = new Capture(this, 320, 240);
  video.start();
  
  //sound of crickets initliazed and played in a loop
  crickets = new SoundFile(this, "crickets.wav");
  crickets.loop();
  
  crack = new SoundFile(this, "crack.wav");

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
  frog.y = (height - frog.imageFrog.height)+60;
  //Create score class
  score = new Score(width/2, height/4);
}


void draw() {
  //background(0);
if(gameOver ==false)
{
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
//gameOver
else
{
  score.playAgain();
}
}


//Keyboard controls
//void mousePressed() {
//  score.addPoint();
//}

void keyPressed() {
  frog.keyPressed();
}

void keyReleased() {
  frog.keyReleased();
}