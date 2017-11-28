//Frog
//
// A class that defines the frog as being able to move on x axis with keyboard 
// and jump with webcam edge detection (eventually)

class Frog {

  /////////// Properties ///////////

  //default values for speed and size
  int speed;
  int size = 50;

  //The position and velocity of frog
  int x;
  int y;
  int vx;
  int vy;

  //Frog and tongue images
  PImage imageFrog;
  PImage imageTongue;

  //Tongue frames starts at zero
  int tongueFrames = 0;
  
  //Tongue tip

  //Characters to move frog left and right


  ////////// Constructor ////////////

  Frog(int _x, int _y, String _imageFrog, String _imageTongue, int _speed) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
    speed = _speed;

    imageFrog = loadImage(_imageFrog);
    imageTongue = loadImage(_imageTongue);
  }

  /////////// Methods /////////////

  void update() {
    //Update position with velocity
    x += vx;
    y += vy;

    //Constrain frog image to display window
    x = constrain(x, 0 + imageFrog.width/2, width- imageFrog.width/2);
  }

  void display() {
    imageMode(CENTER);
    if (tongueFrames > 0) {
      image(imageTongue, x, y-100);
      tongueFrames--;
    }
    image(imageFrog, x, y);
    }

  void collide(Firefly firefly) {
    //Calculate possible overlap area of tip of the tongue
    boolean insideTongueLeft = (firefly.x + (firefly.size/2) > x -imageTongue.width/2);
    boolean insideTongueRight = (firefly.x - (firefly.size/2) < x + imageTongue.width/2);
    boolean insideTongueTop = (firefly.y + (firefly.size/2) > y-100 - imageTongue.height/2);
    boolean insideTongueBottom = (firefly.y - (firefly.size/2) < y-100 + imageTongue.height/2);

    //check if firefly is alive
    if (firefly.alive == true) {
      //check if collision with tongue
      if (insideTongueLeft && insideTongueRight && insideTongueTop && insideTongueBottom) {
        println("eaten");
        //firefly dies
        firefly.alive = false;
      }
    }
  }

  void keyPressed()
  {
    if (key == CODED) {
      if (keyCode == LEFT) {
        vx = -speed;
      } else if (keyCode == RIGHT) {
        vx = speed;
      } else if (keyCode == UP) {
        println("Hello!");
        tongueFrames = 2;
      }
    }
  }

  void keyReleased() {
    vx = 0;
  }
  
  
  //https://forum.processing.org/two/discussion/18189/play-video-with-webcam-motion-detection
}