// Paddle
//
// A class that defines a paddle that can be moved up and down on the screen
// using keys passed through to the constructor.

class Paddle {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 5;
  int HEIGHT = 70;
  int WIDTH = 16;

  // The position and velocity of the paddle (note that vx isn't really used right now)
  int x;
  int y;
  int vx;
  int vy;

  //Moon images
  PImage imageMoon;

  // The fill color of the paddle
  color paddleColor = color(255);

  //The score that will go into the collide method (found in ball class)
  int score = 0;

  // The characters used to make the paddle move up and down, defined in constructor
  char upKey;
  char downKey;

  //Array of satellites (score)

  int [] satelliteX = new int [5];
  int [] satelliteY = new int [5];

  //Satellites as stars
  int satStar;

  /////////////// Constructor ///////////////

  // Paddle(int _x, int _y, int_vy, char _upKey, char _downKey)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  Paddle(int _x, int _y, String _image, char _upKey, char _downKey, boolean _isLeftPaddle) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    imageMoon = loadImage(_image);

    upKey = _upKey;
    downKey = _downKey;

    if (_isLeftPaddle) {

      satelliteX [0] = 0;
      satelliteX [1] = -30;
      satelliteX [2] = -40;
      satelliteX [3] = -30;
      satelliteX [4] = 0;
    } else {

      satelliteX [0] = 0;
      satelliteX [1] = 30;
      satelliteX [2] = 40;
      satelliteX [3] = 30;
      satelliteX [4] = 0;
    }

    satelliteY [0] = -45;
    satelliteY [1] = -30;
    satelliteY [2] = 0;
    satelliteY [3] = 35;
    satelliteY [4] = 50;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update position with velocity (to move the paddle)
    x += vx;
    y += vy;

    // Constrain the paddle's y position to be in the window
    y = constrain(y, 0 + imageMoon.height/2, height - imageMoon.width/2);
  }

  // display()
  //
  // Display the paddle at its location

  void display() {
    // Set display properties
    imageMode(CENTER);
    image(imageMoon, x, y);

    fill(255);

    // Display the score in the form of stars hovering near paddle
    for (int i=0; i < score; i++) {
      rect(satelliteX[i]+x, satelliteY[i]+y, 5, 5);
    }
  }
  
    // keyPressed()
    //
    // Called when keyPressed is called in the main program


    void keyPressed() {
      // Check if the key is our up key
      if (key == upKey) {
        // If so we want a negative y velocity
        vy = -SPEED;
      } // Otherwise check if the key is our down key 
      else if (key == downKey) {
        // If so we want a positive y velocity
        vy = SPEED;
      }
    }

    // keyReleased()
    //
    // Called when keyReleased is called in the main program

    void keyReleased() {
      // Check if the key is our up key and the paddle is moving up
      if (key == upKey && vy < 0) {
        // If so it should stop
        vy = 0;
      } // Otherwise check if the key is our down key and paddle is moving down 
      else if (key == downKey && vy > 0) {
        // If so it should stop
        vy = 0;
      }
    }
  }