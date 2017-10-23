// Griddies
// by Pippin Barr
// MODIFIED BY: Alessia Signorino
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
// An array storing all the grimies
Grimy[] grimies = new Grimy[100];

int a;

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  // Create array of griddies for x times along the grid size
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
  
  for (int a = 0; a < grimies.length; a++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    grimies[a] = new Grimy(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // if the second time's level of energy not equal the previous one
      if (j != i) {
        // QUESTION: What does this line check?
        // checks for collision of integers between griddies
        griddies[i].collide(griddies[j]);
      }
    }
    
    //looping grimies
    for (int a = 0; a < griddies.length; a++) {
      //update the grimies
      grimies[a].update();
      for (int m = 0; m < griddies.length; m++) {
      if (m != a) {
        grimies[a].collide(grimies[m]);
      }
     }
      
    }
    
    // Display the griddies
    griddies[i].display();
    grimies[a].display();
  }
}