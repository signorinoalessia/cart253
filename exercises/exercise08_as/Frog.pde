//Frog
//
// A class that defines the frog as being able to move on x axis with keyboard 
// and jump with webcam edge detection (eventually)

class Frog {

  /////////// Properties ///////////

  //default values for speed and size
  int speed = 5;
  int size = 50;

  //The position and velocity of frog
  int x;
  int y;
  int vx;
  int vy;

  //Frog placeholder image
  PImage imageFrog;

  //Characters to move frog left and right


  ////////// Constructor ////////////

  Frog(int _x, int _y, String _image) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    imageFrog = loadImage(_image);
  }

  /////////// Methods /////////////

  void update() {
    //Update position with velocity
    x += vx;
    y += vy;

    //Constrain frog image to display window
    y = constrain(0, 0 + imageFrog.height/2, height- imageFrog.width/2);
  }

  void display() {
    imageMode(CENTER);
    image(imageFrog, x, y);
  }

  void keyPressed()
  {
    if (key == CODED) {
      if (keyCode == LEFT) {
        x -= 1;
      } else if (keyCode == RIGHT) {
        x += 1;
      }
    }
  }
}