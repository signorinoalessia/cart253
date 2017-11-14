class Creature {
  //Floats for random and consistent movement
  float tx = random(0, 100);
  float ty = random(0, 100);

  // Growth and size
  float theta = 0;
  float size = 10;
  
  // Position and colour
  float x;
  float y;
  color fill = color(255);
  

  ///// Constructor /////
  // Creature's initial position and size

  Creature() {
  }

  ///// Update /////
  void update() {
  }

  void collide(Creature other) {
    //will eventually collide and glow blue
    if (x == other.x && y == other.y) {
      fill(50,50,255);
    }
  }

  ///// Display /////
  void display() {

    float x = width * noise(tx);
    float y = height * noise(ty);
    float growth = sin(theta) * (size/4);

    tx += 0.01;
    ty += 0.01;
    theta += 0.05;
    
    fill(fill);
    ellipse(x, y, size + growth, size + growth);
  }
}