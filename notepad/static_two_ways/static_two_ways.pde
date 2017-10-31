void setup() {
  size(500, 500);
}
void draw() {
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = color(random(0, 255));
  }
  updatePixels();
  //for (int x = 0; x < width; x++) {
  //  for (int y = 0; y < height; y++) {
  //    stroke(random(255));
  //    point(x,y);
  //  }
  //}
}