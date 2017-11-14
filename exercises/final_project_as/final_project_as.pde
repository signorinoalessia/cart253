//Creature
//By: Alessia Signorino

//A creature that is trapped within the boundaries of the screen
//It breathes and moves organically via floats (looks as if it it moves closer and further)

int x;
int y;

Creature[] creatures = new Creature[8];

void setup() {
  size(1920, 1080);
  frameRate(50);

  for (int i=0; i < creatures.length; i++) {
    creatures[i] = new Creature();
  }
}

void draw() {
  background(0);

  for (int i=0; i < creatures.length; i++) {
    creatures[i].display();
  }
}