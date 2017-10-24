//A creature that is trapped within the boundaries of the screen
//It breathes and moves organically via floats

float tx = random(0,100);
float ty = random(0,100);

float theta = 0;
float size = 30;

void setup() {
  size(500,500);
}

void draw() {
  background(0);
  
  float x = width * noise(tx);
  float y = height * noise(ty);
  float growth = sin(theta) * (size/4);
  
  ellipse(x,y,size + growth,size + growth);
  tx += 0.01;
  ty += 0.01;
  theta += 0.05;
}