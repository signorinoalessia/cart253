PImage image;

float tx = random(0,100);
float ty = random(0,100);

void setup() {
  size(500,500);
  image = loadImage("image.png");
}

void draw() {
  background(0);
  float x = width * noise(tx);
  float y = height * noise(ty);
  //ellipse(x,y,20,20);
  imageMode(CENTER);
  image(image,x,y);
  tx += 0.01;
  ty += 0.01;
}