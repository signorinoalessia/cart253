// Menu
//
// A class that defines the beginning of the game's mood and 
//gives the user some context on what the game is about.

class Menu {

  int x;
  int y;
  PImage imageMenu;

  /////////////// Constructor //////////////

  Menu(int _x, int _y, String _imageMenu) {

    x = _x;
    y = _y;
    imageMenu = loadImage(_imageMenu);
  }
  //////////////// Methods ///////////////
  void display() {
    imageMode(CENTER);
    image(imageMenu, x, y);
    
    textAlign(CENTER);
    textSize(15);
    text("Become a frog in a rice field and catch as many fireflies as you can before sunrise!", width/2, height/2);
    text("Use arrow left and right keys to move and webcam blue detection to jump.", width/2, (height/2)+25);
    text("Each eaten firefly will reveal a fun frog fact or a related childhood memory.", width/2, (height/2)+50);
    textSize(23);
    text("Press s to start", width/2, (height/2)+85);
  }
}