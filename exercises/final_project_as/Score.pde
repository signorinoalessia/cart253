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
    //textAlign(CENTER);
    "Did you know? There are over 5'000 species of frog", 
    "A frog's call is unique to its species, and some frog calls can be heard up to a mile away.", 
    "I was walking under the moonlit dirt path with Filomena and Ercole and we heard faint guttural croaks coming from the waters.", 
    "Frogs don’t need to drink water as they absorb it through their skin", 
    "At first I was not sure what it was and then Filomena pointed at a frog. Before I could set my eyes upon it, it had jumped away.", 
    "I crouched closer to the shallow fields, peering athrough the rice shoots, and saw ripples dancing on the black water.", 
    "A frog completely sheds its skin about once a week. After it pulls off the old, dead skin, the frog usually eats it.", 
    "The ringlets were proof that somewhere near me a frog was probably gazing back to me, having been disturbed from their chorus practice.", 
    "The biggest frog in the world is the Goliath frog. It lives in West Africa and can measure more than 30cm in length and weigh more than 3.5kg.", 
    "And then, there it was, slimy and smooth, a creature smaller than my eight year old palm, its chin swelling and shrinking, defying the silence with new croaks."
  };


  ////////////Constructor////////////

  Score(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  ////////////////Methods///////////////
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
      text("The sun is up, game over!", width/2, height/2);
      playAgain();
    }
  }

  void playAgain() {
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Press R to play again", width/2, height);
    
    if(keyPressed) {
      if (key == 'r' || key == 'R') {
        reset();
    }
  }
  
  void reset() {
    //Display sky
    sky.display();
  
    //Display and update frog
    frog.update();
    frog.display();
    
    //display fireflies
    for (int i=0; i < fireflies.length; i++) {
      frog.collide(fireflies[i]);
      fireflies[i].display();
      fireflies[i].update();
  }
}

//https://forum.processing.org/two/discussion/726/how-to-restart-this-game