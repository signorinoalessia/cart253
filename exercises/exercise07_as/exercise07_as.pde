//Combining collision detection of bouncers with an oscillator

//Importing minim
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minin;
AudioOutput out;
Oscil       wave;

//An array of future musical bouncers
Bouncer[] bouncers = new Bouncer[7];

void setup() {

  //Init minim
  minim = new Minim(this);
  
  out = minim.getLineOut();
  
  wave = new Oscil(440, 0.5f, Waves.SINE );
  //sample = new Sampler("something.wav", 12, minim);
  //sample.patch(out);
  
  //array for loop for bouncers
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color((255)));
  }
}

void draw() {
   
   bouncer.update();
   bouncer.display();

}