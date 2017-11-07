// Import the Minim library
import ddf.minim.*;

Minim minim; // Minim has a special class to handle sound tasks
AudioPlayer stereoSound; // And a separate class for something like an audio file

void setup() {
  minim = new Minim(this); // Make the Minim manager class into an object
  stereoSound = minim.loadFile("sounds/stereo_sound_file.wav"); // Load our sound file
}

void draw() {
}

void mouseClicked() {
  stereoSound.loop(); // Now this works fine
}