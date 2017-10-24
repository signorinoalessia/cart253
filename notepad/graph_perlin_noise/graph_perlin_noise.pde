float t = 0;
int x = 0;
void setup() {
  size(600,600);
  background(0);
  stroke(255);
}
void draw() {
  float n = noise(t);
  float r = random(0,1);
  ellipse(x,n*height,5,5);
  x++;
  t += 0.01;
}