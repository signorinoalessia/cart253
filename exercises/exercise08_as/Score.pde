//Score
//
// A class that keeps track of score and display if the game is over or won

class Score {

  int x;
  int y;
  int score  = 0;
  int ellipseSize = 20;
  int offset = 60;

  int currentText = -1;

  String[] texts = {
    "Did you know? Fact1", 
    "Fact2", 
    "Memory1", 
    "Fact3", 
    "Memory2", 
    "Memory3", 
    "Fact4", 
    "Memory4", 
    "Fact5", 
    "Memory5"
  };


  ////////////Constructor////////////

  Score(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  ////Methods
  void display() {
    //text(score,50,50);
    float offset = -((ellipseSize*2) * score/2);
    for (int i = 0; i < score; i++) {
      ellipse((x+offset) + (i*(ellipseSize*2)), y, ellipseSize, ellipseSize);
    }
    if (currentText != -1) {
      textAlign(CENTER);
      text(texts[currentText], x, y+ellipseSize);
    }
  }

  void addPoint() {
    score++;
    currentText++;
    if (currentText >= texts.length) {
      currentText = 0;
    }
  }

  //////////Game Over methods//////////

  //Track if game is over
  void trackGameOver() {
    if (score > 10) {
      textSize(50);
      textAlign(CENTER, CENTER);
      fill(255);
      text("Yayyy!", 320, 240);
    } else if (sky.skyDay == true) {
      textSize(50);
      textAlign(CENTER, CENTER);
      fill(255);
      text("The sun is up, try again!", 320, 240);
      //pause game, replay? Q**
    }
  }
}