// Bouncer
//
// A class that defines a circle that can bounce around on the screen
// at a specific velocity.

class Bouncer {

  // Variables for position
  float x;
  float y;

  // Variables for velocity
  float vx;
  float vy;

  // The size of the Bouncer
  float size;

  // The current fill colour of the Bouncer
  color fillColor;

  // The default fill colour of the Bouncer
  color defaultColor;

  //Oscillator 
  SawOsc saw;
  
  //
  int startTime;
  int timerDuration = 100;
  

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  Bouncer(float tempX, float tempY, float tempVX, float tempVY, float tempSize, color tempDefaultColor, SawOsc tempSaw) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
    saw = tempSaw;
    saw.freq(110);
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position
  // and checks for bouncing off the walls.
  void update() {
    x += vx;
    y += vy;
    
    //saw.pan(map(x,0,width,-1,1));
    //saw.freq(map(y,0,height,880,110));
    //saw.amp(map(x,0,width,1,10));

    handleBounce();
    
    if (millis() - startTime > timerDuration) {
      saw.stop();
      startTime = 0;
    }
  }

  // handleBounce()
  //
  // Checks if the bouncer is overlapping a side of the window
  // and if so reverses its velocity appropriately

  void handleBounce() {
    // Check the left and right
    if (x - size/2 < 0 || x + size/2 > width) {
      // Bounce on the x-axis
      vx = -vx;
      //trigger sound
      toneBounce();
    }

    // Check the top and bottom
    if (y - size/2 < 0 || y + size/2 > height) {
      // Bounce on the y-axis
      vy = -vy;
      //trigger sound
      toneBounce();
    }

    // Make sure the Bouncer isn't off the edge
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }
  
  
  void collide(Bouncer other) {
    toneBounce();
  }

  //Position of each bouncer will determine amplitude and frequency
  void toneBounce() {
     startTime = millis();
     saw.play();    
  }

// display()
//
// Draw an ellipse in the Bouncer's location, with its size
// and with its fill
void display() {
  noStroke();
  fill(fillColor);
  ellipse(x, y, size, size);
}
}