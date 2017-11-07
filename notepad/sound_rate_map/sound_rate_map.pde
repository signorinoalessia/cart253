import processing.sound.*;

SoundFile song;

void setup() {
  song = new SoundFile(this, "sounds/song.wav");
  // We'll loop our sound file so we can hear the effects of rate
  song.loop();
}

void draw() {
  // Calculate the rate the sound should play at based on the mouse location
  // Over to the left means very slow (minimum of 0.01x speed)
  // Over to the right means very fast (maximum of 5x speed)
  float newRate = map(mouseX,0,width,0.01,5);
  // Set the new rate
  song.rate(newRate);
}