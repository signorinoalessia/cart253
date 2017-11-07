import processing.sound.*;

//An array of future musical bouncers
Bouncer[] bouncers = new Bouncer[3];

void setup() {

  //array for loop for bouncers
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color((255)));
  }
  // Create the sine oscillator.
  sine = new SinOsc(this);
  //
}

void draw() {
  sine.play();
  // Map the mouse x to control the frequency
  sine.freq(map(x,0,width,110,880));
  // Map the mouse y to control the amplitude
  sine.amp(map(y,0,height,1,0));
}