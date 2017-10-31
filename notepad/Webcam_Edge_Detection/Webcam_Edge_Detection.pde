import processing.video.*;
Capture video;
void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480, 30);
  video.start();
}


void draw() {
  if (video.available()) {
    video.read();
  } 

  loadPixels();
  for ( int x = 1; x < video.width; x++ ) {
    for ( int y = 0; y < video.height; y++ ) {
      float threshold = 5;
      int loc = x + y*video.width;
      color pix = video.pixels[loc];
      int leftLoc = (x-1) + y*video.width;
      color leftPix = video.pixels[leftLoc];
      float diff = abs(brightness(pix) -  brightness(leftPix));
      if ( diff > threshold ) {
        pixels[loc] = color(255);
      } else {
        pixels[loc] = color(0);
      }
    }
  }
  updatePixels(); // If we changed the pixels array we need to update it
}