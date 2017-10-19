//Satellite
//
//A class for an object that will move randomly (at a slower rate) that will bounce back the ball

class Satellite {

  /////////////// Properties ///////////////

  // The position and velocity of the satellite
  float x;
  float y;
  int vx;
  int vy;

  //Image of satellite
  PImage imageSat;

  /////////////// Constructor ///////////////

  Satellite (float _x, float _y, int _vx, int _vy, String _image) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    
    imageSat = loadImage(_image);
  }

  /////////////// Methods ///////////////
   void update() {
    // Update position with velocity (to move the paddle)
    x += vx;
    y += vy;

    // Constrain the paddle's y position to be in the window
    y = constrain(y, 0 + imageSat.height/2, height - imageSat.width/2);
  }
  
  void display() {
    // Set display properties
    imageMode(CENTER);
    image(imageSat, x, y);
    }
}