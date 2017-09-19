final int CIRCLE_SPEED = 7;                                           //speed of circle
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);               //default circle color (pink)
final color CLICK_FILL_COLOR = color(100, 100, 250);                  //color when mouse collision (blue)
final color BACKGROUND_COLOR = color(250, 150, 150);                  //background color (salmon)
final color STROKE_COLOR = color(250, 150, 150);                      //circle outline color (light salmon)
final int CIRCLE_SIZE = 50;                                           //circle size

int circleX;                                                          //integer circle X pos
int circleY;                                                          //integer circle y pos
int circleVX;                                                         //int circle x velocity
int circleVY;                                                         //int circle y velocity

void setup() {
  size(640, 480);                                                     //background size
  circleX = width/2;                                                  //circle width div by 2
  circleY = height/2;                                                 //circle height div by 2
  circleVX = CIRCLE_SPEED;                                            //circleVX equals to 7
  circleVY = CIRCLE_SPEED;                                            //see above
  stroke(STROKE_COLOR);                                               //circle stroke is now light salmon
  fill(NO_CLICK_FILL_COLOR);                                          //default fill color is pink
    background(BACKGROUND_COLOR);                                     //background is now salmon
}

void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {        //if mouse is on circle
    fill(CLICK_FILL_COLOR);                                              //circle becomes blue 
  }
  else {
    fill(NO_CLICK_FILL_COLOR);                                           //if not, remain pink
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);                   //circle position, circle size
  circleX += circleVX;                                                   // circle x pos increments by 7
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {   //if edge of circle hits screen perimeter x-wise, or other edge, mimics "bounce"
    circleVX = -circleVX;                                                 //flip direction
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {   //if edge of circle hits screen perimeter y-wise, or other edge, mimics "bounce"
    circleVY = -circleVY;                                                  //flip direction
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR);                                            //if mouse is pressed, reset circle animation (paste on background)
}