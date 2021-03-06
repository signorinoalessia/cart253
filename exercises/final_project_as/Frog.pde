//Frog
//
// A class that defines the frog as being able to move on x axis with keyboard 
// and jumps whenever the webcam detects blue!

class Frog {

  /////////// Properties ///////////

  //Default values for speed and size
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

  //Is the frog jumping?
  boolean isJumping =false;


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
      image(imageTongue, x, y-imageFrog.height);
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
    int bluestX = 0;
    int bluestY = 0;
    float record = 500;


    for ( int x = 0; x < video.width; x++ ) {
      for ( int y = 0; y < video.height; y++ ) {
        int loc = x + (y * video.width);
        color pixelColor = video.pixels[loc];
        float amount = dist(0, 0, 255, red(pixelColor), green(pixelColor), blue(pixelColor));


        if (amount < record) {
          // println(amount);
          record = amount;
          bluestX = x;
          bluestY = y;
        }
      }
    }

    fill(255, 0, 0);
    image(video, 0, 0);
    ellipse(bluestX, bluestY, 10, 10);

    if (isJumping ==true)
    {
      vy+=1;
      if (y>height-60)
      {
        vy=0;
        isJumping =false;
      }
    } else if (record<200) {
      tongueFrames = 1;
      if (isJumping ==false)
      {
        vy =-12;
        isJumping =true;
      }
    } else {
    }

    y+=vy;
  }

  void collide(Firefly firefly) {

    //Calculate possible overlap area of tip of the tongue
    boolean insideTongueLeft = (firefly.x + (firefly.size/2) > x - imageTongue.width/2);
    boolean insideTongueRight = (firefly.x - (firefly.size/2) < x + imageTongue.width/2);
    boolean insideTongueTop = (firefly.y + (firefly.size/2) > y - 50 - imageTongue.height/2);
    boolean insideTongueBottom = (firefly.y - (firefly.size/2) < y - 50 + imageTongue.height/2);

    //check if firefly is alive
    if (firefly.alive == true) {
      //check if collision with tongue
      if (insideTongueLeft && insideTongueRight && insideTongueTop && insideTongueBottom) {
        //firefly dies
        firefly.alive = false;
        // sound fx of crunched firefly
        crack.play(1,1,20);
        // point is displayed and new string text appears
        score.addPoint();
        return;
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