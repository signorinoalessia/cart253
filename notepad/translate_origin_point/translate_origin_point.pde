float theta = 0;

void setup() {
  size(500,500);
}

void draw() {
  background(0);
  translate(width/2,height/2);
  rotate(theta);
  rectMode(CENTER);
  rect(0,0,100,100);
  theta += 0.01;
}