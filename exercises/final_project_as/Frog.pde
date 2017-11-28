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
      image(imageTongue, x, y-20);
      rectMode(CENTER);
      //stroke(255, 0, 0);
      //noFill();
      //rect(x, y-100, imageTongue.width, imageTongue.height);
      tongueFrames = -1;
    }
    image(imageFrog, x, y);
  }

  void frogInput() {
    //If video is available and previous frame does not match current frame
    if (video.available()) {
      video.read();
    } 
    int reddestX = 0;
    int reddestY = 0;
    float record = 1000;

    for ( int x = 0; x < video.width; x++ ) {
      for ( int y = 0; y < video.height; y++ ) {
        int loc = x + (y * video.width);
        color pixelColor = video.pixels[loc];
        float amount = dist(255, 0, 0, red(pixelColor), green(pixelColor), blue(pixelColor));
        if (amount < record) {
          record = amount;
          reddestX = x;
          reddestY = y;
        }
      }
     
      fill(255, 0, 0);
      image(video, 0, 0);
      ellipse(reddestX, reddestY, 10, 10);
    }
    println(record);
    if (record>150) {
    tongueFrames = 1;
    }
  }

  void collide(Firefly firefly) {

    //Calculate possible overlap area of tip of the tongue
    boolean insideTongueLeft = (firefly.x + (firefly.size/2) > x - imageTongue.width/2);
    boolean insideTongueRight = (firefly.x - (firefly.size/2) < x + imageTongue.width/2);
    boolean insideTongueTop = (firefly.y + (firefly.size/2) > y - 50 - imageTongue.height/2);
    boolean insideTongueBottom = (firefly.y - (firefly.size/2) < y - 50 + imageTongue.height/2);

    //    boolean insideTongueLeft = (firefly.x  > x - imageTongue.width/2);
    //    boolean insideTongueRight = (firefly.x < x + imageTongue.width/2);
    //    boolean insideTongueTop = (firefly.y > y - 100 - imageTongue.height/2);
    //    boolean insideTongueBottom = (firefly.y < y - 100 + imageTongue.height/2);

    //check if firefly is alive
    if (firefly.alive == true) {
      //check if collision with tongue
      if (insideTongueLeft && insideTongueRight && insideTongueTop && insideTongueBottom) {
        // println("eaten");
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
        //println("Hello!");
        tongueFrames = 200;
      }
    }
  }

  void keyReleased() {
    vx = 0;
  }
}