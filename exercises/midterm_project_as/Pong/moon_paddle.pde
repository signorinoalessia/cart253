void setup() {
  size(480, 480);
}

void draw() {
  background(102);
   //moonRight(); 
   moonLeft();
}


void moonRight() {
fill(255,120,100);
noStroke();
beginShape(POLYGON);
      vertex(35, 20);
      bezierVertex(80, 0, 80, 75, 30, 75);
      bezierVertex(40,75, 60, 25, 35, 20);
      endShape(); 
}

void moonLeft() {
fill(255,120,100);
noStroke();
beginShape(POLYGON);
      vertex(35, 20);
      bezierVertex((height/2), width/2, 80, 75, 30, 75);
      bezierVertex((height/2)-40,(width/2)+75, 60, 25, 35, 20);
      endShape(); 
}