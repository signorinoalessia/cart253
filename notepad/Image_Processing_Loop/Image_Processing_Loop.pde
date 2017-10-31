PImage myImage;
void setup() {
  size(632,475);
  myImage = loadImage("http://buildingontheword.org/wp-content/uploads/2016/08/cat.jpg");
}
void draw() {
  myImage.loadPixels();
  for (int x = 0; x < myImage.width; x++) {
    for (int y = 0; y < myImage.height; y++) {
       int loc = x + y * myImage.width;
      // Do something cool with the information in myImage.pixels[loc]
      // Either use it change it or use the information it represents
      // (A colour, obviously, but colours mean things!)
      myImage.pixels[loc]+=1000;
    }
  }
  myImage.updatePixels(); // If we changed the pixels array we need to update it
  image(myImage,0,0);
}