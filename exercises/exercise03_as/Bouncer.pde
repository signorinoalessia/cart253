class Bouncer {
  
 /////////////// Properties ///////////////

 // Default values for position 
 int x;
 int y;
 
 // The velocity of the bouncer 
 int vx;
 int vy;

 // Default value for size  
 int size;
 
 //Colors of bouncer
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 /////////////// Constructor ///////////////
 
 //pass arguments through main program, such as position, speed, color state and size
  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }

 /////////////// Methods /////////////// 
 
 //update(), called once per frame, makes bouncer move 
 //and calls methods handleBounce and handleMouse
 
  void update() {
   x += vx;
   y += vy;
   
   handleBounce();
   handleMouse();
 }
 
 //if bouncer is on right side of screen, bounce back
 //if bouncer is on left side of screen, bounce back
 //x and y stay within boundary of right & left panel
 
 //CHANGED: when horizontal hitting sides of screen, teleport to center
 void handleBounce() {
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
    x = width/2;
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
   }
   
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 
 //If mouse is on bounce trajectory, fill colour switches to hover colour
 
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }

 //draw the bouncer
 
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}