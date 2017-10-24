     

float theta = 0;
float size = 300;
void setup() {
  size(600,600);
  background(0);
  fill(255);
}
void draw() {
  background(100);
  float growth = sin(theta) * (size/4);
  ellipse(width/2,height/2,size + growth,size + growth);
  theta += 0.05;
}