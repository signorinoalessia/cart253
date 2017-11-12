//Combining collision detection with sound 

//Importing minim
import ddf.minim.*;
import ddf.minim.ugens.*;
//import processing.sound.*;

Minim minin;
AudioOutput out;

//An array of future musical bouncers
Bouncer[] bouncers = new Bouncer[3];

void setup() {

  //array for loop for bouncers
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color((255)));
  }

  minim = new Minim(this);
  out = minim.getLineOut();
  sample = new Sampler("something.wav", 12, minim);
  sample.patch(out);
  
}

void draw() {
   
   

}