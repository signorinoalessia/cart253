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
    "I was walking under the moonlit dirt path with Filomena and Ercole and we heard faint guttural croaks coming from the waters.", 
    "Fact3", 
    "At first I was not sure what it was and then Filomena pointed at a frog. Before I could set my eyes upon it, it had jumped away.", 
    "I crouched closer to the shallow fields, peering athrough the rice shoots, and saw ripples dancing on the black water.", 
    "Fact4", 
    "The ringlets were proof that somewhere near me a frog was probably gazing back to me, having been disturbed from their chorus practice.", 
    "Fact5", 
    "And then, there it was, slimy and smooth, a creature smaller than my eight year old palm, its chin swelling and shrinking, defying the silence with new croaks."
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
      text("Yayyy!", width/2, height/2);
    } else if (sky.skyDay == true) {
      textSize(50);
      textAlign(CENTER, CENTER);
      fill(255);
      text("The sun is up, try again!", width/2, height/2);
      //pause game, replay? Q**
    }
  }
}