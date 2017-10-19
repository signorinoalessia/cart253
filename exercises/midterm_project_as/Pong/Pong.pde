// Cosmic Pong
//
// A stellar version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// Scoring is tracked!
// Gorgeous score display. 
// Looks pretty neat.
// Contains two moon paddles. (Wow!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 45;

// The background colour during play (midnight sky)
color backgroundColor = color(30, 0, 80);

int numStatic = 8;
int staticSizeMin = 1;
int staticSizeMax =2;
color staticColor = color(255, 255, 0);

PImage imageTrophy;

boolean gameOver = false;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2,"leftMoon.png", '1', 'q', true);
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, "rightMoon.png", 'p', 'l', false);

  // Create the ball at the centre of the screen
  ball = new Ball((random(width/2)), random(height/2), 5, 10, 5);

  //delay in milliseconds for displayGameOver
  wait = 4000;
  
  imageTrophy = loadImage("trophy.png");
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);

  drawStatic();

  if (!gameOver) {

    //Track if game is over
    trackGameOver(); 
  
    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    
    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }
  } else if (gameOver) {
    displayGameOver();
    winnerPaddle();
  }
  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
    
}

//static to mimic stars in the sky
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
}

/////////Game Over methods//////////

float stopTime, wait;

//Track if game is over
void trackGameOver() {
  if (rightPaddle.score > 4) {
    gameOver = true;
  } else if (leftPaddle.score > 4) {
    gameOver = true;
  }
}

//Display message when game is over
void displayGameOver() {
  textSize(50);
  textAlign(CENTER, CENTER);
  fill(255);
  text("GAME OVER!", 320, 240);
}

//Display the winner's paddle filling the screen
void winnerPaddle() {
  if (leftPaddle.score > 4) {
   //Display trophy
   imageMode(CENTER);
   image(imageTrophy, 80, 240);
  } 
  else if (rightPaddle.score > 4) {
    imageMode(CENTER);
    image(imageTrophy, 560, 240);
  }
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}