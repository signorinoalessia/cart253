// Grimy
//
// A class defining the behaviour of a single Grimy
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Grimy. (Also, Griddie's evil cousin).

class Grimy {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(0, 0, 255);

  // Grimy(tempX, tempY, tempSize)
  //
  // Set up the Grimy with the specified location and size
  // Initialise energy to the maximum
  Grimy(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Grimy and update its energy levels
  void update() {
    if (energy == 0) {
      return;
    }

    //
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += size * xMoveType;
    y += size * yMoveType;

    //
    if (x < 0) {
      x += width;
    } else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }

    // Update the Grimy's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    energy = constrain(energy, 0, maxEnergy);
  }

  // collide(other)
  void collide(Grimy other) {
    if (energy == 0 || other.energy == 0) {
      return;
    }
    if (x == other.x && y == other.y) {
      energy += collideEnergy;
      energy = constrain(energy, 0, maxEnergy);
    }
  }

//collide with griddie
  void collideGriddie() {
    if (x += other.x) {
    fill(0,255,0);
    } else if (y += other.y){
    fill(155,0,155);
    }
  }

  void display() {
    fill(fill, energy); 
    noStroke();
    ellipseMode(CENTER);
    ellipse(x, y, size, size);
  }
}    