float theta1 = 0.0;
float theta2 = 0.0;

void setup() {
  size(500,500,P3D);
}

void draw() {
  background(0);
  
  pushMatrix();
  translate(250,250);
  rotateY(theta1);
  fill(255,0,0);
  box(60);
  popMatrix();
  
  pushMatrix();
  translate(50,50);
  rotateX(theta2);
  fill(210,150,150);
  box(30);
  popMatrix();
  
  theta1 += 0.01;
  theta2 -= 0.01;
}