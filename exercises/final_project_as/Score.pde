//Score
//
// A class that keeps track of score and display if the game is over or won


class Score {

  int x;
  int y;
  int score  = 0;
  int ellipseSize = 8;
  int offset = 60;

  int currentText = -1;


  String[] texts = {

    "Did you know? There are over 5'000 species of frogs", 
    "The biggest frog in the world is the Goliath frog. It lives in West Africa and can measure more than 30cm in length and weigh more than 3.5kg.", 
    "I was walking under the moonlit dirt path with Filomena and Ercole and we heard faint guttural croaks coming from the waters.", 
    "Frogs don’t need to drink water as they absorb it through their skin", 
    "At first I was not sure what it was and then Filomena pointed at a frog. Before I could set my eyes upon it, it had jumped away.", 
    "I crouched closer to the shallow fields, peering athrough the rice shoots, and saw ripples dancing on the black water.", 
    "A frog completely sheds its skin about once a week. After it pulls off the old, dead skin, the frog usually eats it.", 
    "The ringlets were proof that somewhere near me a frog was probably gazing back to me, having been disturbed from their chorus practice.", 
    "And then, there it was, slimy and smooth, a creature smaller than my eight year old palm, its chin swelling and shrinking, defying the silence with new croaks."

  };

  // Array of score point positions
  float [] scoreX = new float [10];
  float [] scoreY = new float [10];

  ////////////Constructor////////////

  Score(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    int index =0;
    for (int i =0; i<180; i+=18)
    {
      scoreX [index] = cos(radians(i+180))*80;
      scoreY [index] = sin(radians(i+180))*80;
      index++;
      // println(index);
    }
  }

  ////////////////Score Track Methods///////////////

  void display() {
    noStroke();
    float offset = -((ellipseSize*2) * score/2);
    for (int i = 0; i < score; i++) {
      ellipse((scoreX[i]+frog.x), scoreY[i]+frog.y, ellipseSize, ellipseSize);
      //println(i);
    }
    if (currentText != -1) {
      textSize(15);
      textAlign(CENTER);
      text(texts[currentText], x, y+ellipseSize);
    }
  }

  void addPoint() {
    if (score <9)
    {
      score++;
      currentText++;
      if (currentText >= texts.length) {
        currentText = 0;
      }
    }
  }

  //////////Game Over methods//////////

  //Track if game is over
  void trackGameOver() {
    if (score > 8) {
      textSize(50);
      textAlign(CENTER, CENTER);
      fill(255);
      text("Ribbit!", width/2, height/2);
      gameOver =true;
      //playAgain();
    } else if (sky.skyDay == true) {
      textSize(50);
      textAlign(CENTER, CENTER);
      fill(255);
      text("The sun is up, game over!", width/2, height/2);
      gameOver =true;
      // playAgain();
    }
  }

  void playAgain() {
    textSize(15);
    textAlign(CENTER, CENTER);
    text("Press R to play again", width/2, (height/2)+55);

    //println("Play Again");

    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        reset();
      }
    }
  }

  void reset() {
    //reset score
    println("IN RESET");
    gameOver =false;
    score  = 0;
    currentText = -1;


    //Display sky
    sky.reset();

    //display fireflies
    for (int i=0; i < fireflies.length; i++) {
      fireflies[i].reset();
    }
  }
}