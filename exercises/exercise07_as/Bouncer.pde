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

  // The bouncer of the Bouncer
  float bouncer;

  // The current fill colour of the Bouncer
  color fillColor;

  // The default fill colour of the Bouncer
  color defaultColor;

  //Oscillator 
  SawOsc saw;

  //
  int startTime;
  int timerDuration = 100;


  // Bouncer(tempX,tempY,tempVX,tempVY,tempbouncer,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  Bouncer(float tempX, float tempY, float tempVX, float tempVY, float tempbouncer, color tempDefaultColor, SawOsc tempSaw) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    bouncer = tempbouncer;
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
    if (x - bouncer/2 < 0 || x + bouncer/2 > width) {
      // Bounce on the x-axis
      vx = -vx;
      //trigger sound
      toneBounce();
    }

    // Check the top and bottom
    if (y - bouncer/2 < 0 || y + bouncer/2 > height) {
      // Bounce on the y-axis
      vy = -vy;
      //trigger sound
      toneBounce();
    }

    // Make sure the Bouncer isn't off the edge
    x = constrain(x, bouncer/2, width-bouncer/2);
    y = constrain(y, bouncer/2, height-bouncer/2);
  }


  void collide(Bouncer other) {
    
    // Calculate possible overlaps with the bouncer side by side
    boolean insideLeft = (x + bouncer/2 > bouncers.x - bouncers.size/2);
    boolean insideRight = (x - bouncer/2 < bouncers.x + bouncers.size/2);
    boolean insideTop = (y + bouncer/2 > bouncers.y - bouncers.size/2);
    boolean insideBottom = (y - bouncer/2 < bouncers.y + bouncers.size/2);
    
    // Check if the bouncer overlaps with the other bouncer
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side
        x = bouncers.x + bouncers.size/2 + bouncer/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the bouncer
        x = bouncers.x - bouncers.size/2 - bouncer/2;
      }
      // And make it bounce
      vx = -vx;
      toneBounce();
    }
  }

  //Position of each bouncer will determine amplitude and frequency
  void toneBounce() {
    startTime = millis();
    saw.play();
  }

  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its bouncer
  // and with its fill
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, bouncer, bouncer);
  }
}