/* Things to fix: (1)camera tracking detection (see audio above certain lvl or rgb det), (3)replay option, (4)add firefly orbs around frog instead
 Things to add aesthetically: cricket sounds, change sky a bit more pastel*/

//A Frog in the Rice Field
//By: Alessia Signorino

// Become a frog in a rice field and catch as many fireflies as you can before sunrise!
// You can move on x axis with mouse and you can jump with webcam (eventually) ****
// The fireflies breathe and move organically (looks as if it it moves closer and further)
// Your score is tracked and shown as lit orbs (you did eat fireflies after all) *****
// Stream of consciousness will display fun frog facts and childhood memories as text strings
// The background changes gradually from night to sunrise, making the fireflies harder to see

//Video library and Webcam object
import processing.video.*;
Capture cam;

float threshold = 50;
int Cx = 0;
int Cy = 0;

int x;
int y;
int frogInset = 40;

// Global variables for firefly, frog, score and sky
Firefly[] fireflies = new Firefly[15];
Frog frog;
Sky sky;
Score score;

//Background
PImage imagePlants;

PImage prevFrame;

void setup() {
  size(1920, 1080);
  frameRate(50);

  //Background image for plants
  imagePlants = loadImage("ricefield.png");

  //video capture initialized
  cam = new Capture(this,320,240);
  cam.start();
  prevFrame = createImage(cam.width, cam.height, RGB);

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

  //Plants in background
  image(imagePlants, 0, 0);

  //Test cam
  image(cam, 0, 0);

  //If video is available and previous frame does not match current frame
  //Ref: https://forum.processing.org/two/discussion/4507/motion-detection
  if (cam.available()) {
    prevFrame.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height); 
    prevFrame.updatePixels();
    cam.read();
  }
  
  
  float sumX = 0;
  float sumY = 0;
  float totalMovement = 0;
  
  // ??? Help
  for (int x = 0; x < cam.width; x ++ ) {
    for (int y = 0; y < cam.height; y ++ ) {

      int loc = x + y*cam.width;            
      color current = cam.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 

      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);

      float diff = dist(r1, g1, b1, r2, g2, b2);

      if (diff > threshold) { 
        sumX += x;
        sumY += y;
        totalMovement++;
      }
    }
  }
  
  //
  float averageX = 0;
  float averageY = 0;
  
  if (totalMovement != 0) {
    averageX = (sumX/totalMovement);
    averageY = (sumY/totalMovement);
  }

  //Display sky
  sky.display();

  //Display and update frog
  frog.update();
  frog.display();
  

  image(cam,cam.width/2,cam.height/2);
  ellipse(averageX,averageY, 50, 50);
    //ellipse((averageX/cam.width) * width,(averageY/cam.height) * height, 50, 50);
    
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

// webcam capture event method
void captureEvent(Capture c) {
  c.read();
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