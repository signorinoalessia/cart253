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
  /////////////// Methods //////////////
  void display() {
    imageMode(CENTER);
    image(imageMenu, x, y);
    
    textMode(CENTER);
    textSize(25);
    text("Become a frog in a rice field and catch as many fireflies as you can before sunrise!", width/2, height/2);
    text("You can move on x axis with mouse and you can jump with webcam when the colour blue is detected", width/2, (height/2)+55);
    text("Press z to start", width/2, (height/2)+105);
  }
}