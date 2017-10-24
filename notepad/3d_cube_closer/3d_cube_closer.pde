float theta = 0;
float scaleFactor = 1;

void setup() {
  size(640,480,P3D);
}

void draw() {
  background(0);
  translate(width/2,height/2,0); // Translating in THREE DIMENSIONS!
  rotateX(radians(45));
  rotateY(theta);
  scale(scaleFactor);
  box(50,50,50);
  theta += 0.01;
  scaleFactor += 0.01;
}