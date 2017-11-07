import processing.sound.*;

// We can use one of the library's oscillator classes to represent a sine wave
SinOsc sine;

//See also: SawOsc, SqrOsc, TriOsc, WhiteNoise, PinkNoise, BrownNoise

void setup() {
  // Create the sine oscillator.
  sine = new SinOsc(this);
  // Start it, ooooooooo
  sine.play();
}

void draw() {
  // Map the mouse x to control the frequency
  sine.freq(map(mouseX,0,width,110,880));
  // Map the mouse y to control the amplitude
  sine.amp(map(mouseY,0,height,1,0));
}