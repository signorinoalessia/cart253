import processing.video.*;
Capture video;
void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480, 30);
  video.start();
}


void draw() {
  background(0);
  if (video.available()) {
    video.read();
  } 
  int reddestX = 0;
  int reddestY = 0;
  float record = 1000;
  for ( int x = 1; x < video.width; x++ ) {
    for ( int y = 0; y < video.height; y++ ) {
      int loc = x + y * width;
      color pixelColor = video.pixels[loc];
      float amount = dist(255, 0, 0, red(pixelColor), green(pixelColor), blue(pixelColor));
      if (amount < record) {
        record = amount;
        reddestX = x;
        reddestY = y;
      }
    }
  }
  fill(255, 0, 0);
  image(video, 0, 0);
  ellipse(reddestX, reddestY, 10, 10);
}