class Creature {
  //Floats for random and consistent movement
  float tx = random(0,100);
  float ty = random(0,100);

  // Growth and size
  float theta = 0;
  float size = 30;
  
  ///// Constructor /////
  // Creature's initial position and size
  
  Creature(tempX,tempY, tempSize, tempSize2) {
    x = tempX;
    y = tempY;
    size = tempSize;
    size2 = tempSize2;
  }
  
  ///// Update /////
  void update() {
  //will eventually collide and do stuff
  }
  
 ///// Display /////
  void display() {
  
  float x = width * noise(tx);
  float y = height * noise(ty);
  float growth = sin(theta) * (size/4);
  
  tx += 0.01;
  ty += 0.01;
  theta += 0.05;
  
  ellipse(x,y,size + growth,size + growth);
  }
}