PImage source;
PImage dest;
void setup() {
  size(632, 475);
  source = loadImage("http://buildingontheword.org/wp-content/uploads/2016/08/cat.jpg");
  dest = createImage(source.width,source.height,RGB);
}
void draw() {
  dest.loadPixels();
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++) {
      int loc = x + y*width;
      float r = red(source.pixels[loc]);
      float g = green(source.pixels[loc]);
      float b = blue(source.pixels[loc]);
      r += dist(mouseX,mouseY,width/2,height/2);
      g += dist(mouseX,mouseY,0,0);
      b += dist(mouseX,mouseY,width,height);
      dest.pixels[loc] = color(r, g, b);
    }
  }
  dest.updatePixels(); // If we changed the pixels array we need to update it
  image(dest,0,0);
  
  if (mousePressed) {
    image(source,0,0);
  }
}