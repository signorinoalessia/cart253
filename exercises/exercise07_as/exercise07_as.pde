//Combining collision detection of bouncers with an oscillator

//Importing minim
//import ddf.minim.*;
//import ddf.minim.ugens.*;

//Minim       minin;
//AudioOutput out;
//Oscil       wave;

import processing.sound.*;

// Somewhere to store our 5 wave frequencies, and # of frames per beat
int[] frequencies = new int[60];
int framesPerBeat = 15;

//An array of future musical bouncers
Bouncer[] bouncers = new Bouncer[3];

void setup() {
  size(640, 640);

  //Go through the array of frequencies
  for (int i=0; i<frequencies.length; i++) {
    frequencies[i] = 110 + (i*55);
  }

  //array for loop for bouncers
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color((255)), new SawOsc(this));
  }
}

void draw() {
  background(0);
  for (int i=0; i<bouncers.length; i++) {
    bouncers[i].update();
    bouncers[i].display();
  }
}