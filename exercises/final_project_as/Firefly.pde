// Firefly
//
// A class that defines a firefly that "breathes" and moves organically (looks as if it it moves closer and further) 
// It is constrained by screen size. They collide and move via noise.

class Firefly {
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

  //alive
  boolean alive = true;


  //////////// Constructor ////////////
  // Firefly's initial position and size

  Firefly() {
  }

  ///////////// Methods //////////////
  void update() {
    
    if (alive == false); {
      return;
    }
     
  }

  void collide(Firefly other) {
    //will eventually collide and glow blue
    if (x == other.x && y == other.y) {
      fill(50, 50, 255);
    }
  }


  void display() {

    if (!alive) {
      return;
    }

    x = width * noise(tx);
    y = height * noise(ty);
    float growth = sin(theta) * (size/4);

    tx += 0.01;
    ty += 0.01;
    theta += 0.05;

    fill(fill);
    ellipse(x, y, size + growth, size + growth);
    rectMode(CENTER);
    stroke(255,0,0);
    noFill();
    rect(x,y,size,size);
  }
  
  void reset() {
    tx = random(0, 100);
    ty = random(0, 100);
    theta = 0;
    
    size = 10;
    alive = true;
    
  }
}