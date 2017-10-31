PImage source;
PImage dest;
void setup() {
  size(632, 475);
  source = loadImage("http://buildingontheword.org/wp-content/uploads/2016/08/cat.jpg");
  dest = createImage(source.width, source.height, RGB);
}
void draw() {
  dest.loadPixels();
  for ( int x = 1; x < source.width; x++ ) {
    for ( int y = 0; y < source.height; y++ ) {
      float threshold = 10;
      int loc = x + y * source.width;
      color pixel = source.pixels[loc];
      int leftLoc = (x - 1) + y * source.width;
      color leftPixel = source.pixels[leftLoc];
      float diff = abs(brightness(pixel) -  brightness(leftPixel));
      if ( diff > threshold ) {
        dest.pixels[loc] = color(255);
      } else {
        dest.pixels[loc] = color(0);
      }
    }
    dest.updatePixels(); // If we changed the pixels array we need to update it
    image(dest, 0, 0);

    if (mousePressed) {
      image(source, 0, 0);
    }
  }
}