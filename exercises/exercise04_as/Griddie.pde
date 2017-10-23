// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255, 0, 0);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {

    // QUESTION: What is this if-statement for?
    // if energy becomes 0, reset (KILLS the griddie)
    if (energy == 0) {
      return;
    }

    // QUESTION: How does the Griddie movement updating work?
    // Floor calculates the closest int value that is less than 
    // or equal to the value of parameter
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += size * xMoveType;
    y += size * yMoveType;

    // QUESTION: What are these if statements doing?
    // they make griddies move away from the edges of the screen
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

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;

    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy, 0, maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level

  void collide(Griddie other) {
    // QUESTION: What is this if-statement for?
    // if energy is 0 and other griddie's energy are 0, kill off griddies
    if (energy == 0 || other.energy == 0) {
      return;
    }

    // QUESTION: What does this if-statement check?
    // if griddie collides with another griddie, increase griddies's energy 
    // and constrain it within bounds
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy, 0, maxEnergy);
    }
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    // it fills the griddie with the value of energy it contains
    fill(fill, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}