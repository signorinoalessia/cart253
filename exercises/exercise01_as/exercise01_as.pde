final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);
final int CIRCLE_SIZE = 50;

int CIRCLE_SPEED =10;
int circleX;                                                          //integer circle X pos
int circleY;                                                          //integer circle y pos
int circleVX;                                                         //int circle x velocity
int circleVY;                                                         //int circle y velocity
int currentCircleSize;                                                 //increased circle size

void setup() {
  size(640, 480);                                                     //background size
  circleX = width/2;                                                  //circle width div by 2
  circleY = height/2;                                                 //circle height div by 2
  circleVX = CIRCLE_SPEED;                                            //circleVX equals to 7
  circleVY = CIRCLE_SPEED;                                            //see above
  stroke(STROKE_COLOR);                                               //circle stroke is now light salmon
  fill(NO_CLICK_FILL_COLOR);                                          //default fill color is pink
  background(BACKGROUND_COLOR);                                       //background is now salmon
  
  currentCircleSize = CIRCLE_SIZE;                                    //DEFAULT VALUE  
}

void draw() {
  currentCircleSize--;                                                               //CIRCLE BECOMES SMALLER (AND THEN BIGGER!)
    
  if (dist(mouseX, mouseY, circleX, circleY) < currentCircleSize/2) {                //if mouse is on circle
    fill(CLICK_FILL_COLOR);                                                          //circle becomes blue 
  }
  else {
    fill(NO_CLICK_FILL_COLOR);                                                       //if not, remain pink
  }
  
  mouseLocation();                                                                   //*.*.*CALLING BRAND NEW FUNCTION*.*.*
    
  ellipse(circleX, circleY, currentCircleSize, currentCircleSize);                    //circle position, circle size
  circleX += circleVX;                                                                // circle x pos increments by 7
  circleY += circleVY;
  if (circleX + currentCircleSize/2 > width || circleX - currentCircleSize/2 < 0) {   //if edge of circle hits screen perimeter x-wise, or other edge, mimics "bounce"
    circleVX = -circleVX;                                                             //flip direction
  }
  if (circleY + currentCircleSize/2 > height || circleY - currentCircleSize/2 < 0) {   //if edge of circle hits screen perimeter y-wise, or other edge, mimics "bounce"
    circleVY = -circleVY;                                                              //flip direction
  }
}

void mouseLocation() {                                                    //*.*.*LOOK AT THIS BRAND NEW FUNCTION, I MADE THIS*.*.*
  if (mouseX<(width/2) && mouseY<(height/2)) {                            //IF MOUSE IS ON TOP LEFT CORNER OF SCREEN...
    fill(100,255,77);                                                     //*.*.*.*MAKE CIRCLE AN OBNOXIOIUS SHADE OF GREEN!!!*.*.*
  }
}


void mousePressed() {
  background(BACKGROUND_COLOR);                                            //if mouse is pressed, reset circle animation (paste on background)
}