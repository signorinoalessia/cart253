//Symmetric bouncing entity that starts at center of screen
//and that changes colour when intersecting center of screen width
//also changes color when you hover over bouncer with mouse (becomes brighter)

// Global variables
color backgroundColor = color(200,150,150);
Bouncer bouncer;
Bouncer bouncer2;

//Setup, sets size of screen and creates different bouncers,
//with their respective colours and positions
void setup() {
  size(640,480);
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

//Draw, makes bouncers move 
void draw() {
  
  //Updates bouncers by calling their update method
  bouncer.update();
  bouncer2.update();
  
  //Draws bouncers by calling their methods
  bouncer.draw();
  bouncer2.draw();
}