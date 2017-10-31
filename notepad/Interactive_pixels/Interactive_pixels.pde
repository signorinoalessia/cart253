PImage myImage;
void setup() {
  size(632, 475);
  myImage = loadImage("http://buildingontheword.org/wp-content/uploads/2016/08/cat.jpg");
}

void draw() {
  myImage.loadPixels();
  for (int x = 0; x < myImage.width; x++) {
    for (int y = 0; y < myImage.height; y++) {
      int loc = x + y*width;
      // Do something cool with the information in myImage.pixels[loc]
      // Either use it change it or use the information it represents
      // (A colour, obviously, but colours mean things!)
      float r = red(myImage.pixels[loc]);
      float g = green(myImage.pixels[loc]);
      float b = blue(myImage.pixels[loc]);
      if (mouseX < width/2) {
        r++;
      } else {
        b++;
      }
      if (mouseY < height/2) {
        g++;
      } else {
        r--;
      }      
      myImage.pixels[loc] = color(r, g, b);
    }
  }
  myImage.updatePixels(); // If we changed the pixels array we need to update it
  image(myImage, 0, 0);
}