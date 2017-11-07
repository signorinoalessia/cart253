import processing.sound.*;

int[] frequencies = new int[50]; // Somewhere to store our 5 wave frequencies
int framesPerBeat = 15; // The number of frames per beat of music

SawOsc saw; // Oscillator to play tones

void setup() {
  // Go through the array loading frequencies into it
  for (int i = 0; i < frequencies.length; i++) {
    // We can use the i variable to set up equidistant frequencies
    frequencies[i] = 110 + (i * 55);
  }
  // Create the oscillor, set its frequency to a default, and play it
  saw = new SawOsc(this);
  saw.freq(110);
  saw.play();
}

void draw() {
  //framesPerBeat = floor(map(mouseX,0,width,1,120));
  // Use modulo to check if this frame is a multiple of the beat count
  if (frameCount % framesPerBeat == 0) {
    // Pick a random index in the array
    int randomIndex = floor(random(0, frequencies.length));
    // Set the new frequency
    saw.freq(frequencies[randomIndex]);
  }
}