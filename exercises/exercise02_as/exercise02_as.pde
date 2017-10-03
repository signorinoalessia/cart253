color backgroundColor = color(0);

//Global Variables of screen static

int numStatic = 50;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(100);

//Global Variables of paddle (size, speed, color)

int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

//ADDED: Global variables of ghost paddle (size, speed, color)

int ghostPaddleX;
int ghostPaddleY;
int ghostPaddleVX;
int ghostPaddleSpeed = 6;
int ghostPaddleWidth = 128;
int ghostPaddleHeight = 16;
color ghostPaddleColor = color(80);

//Global Variables of ball (size, speed, color)
//CHANGE, added a default colour and HIT color

int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color defaultBallColor = color(255);
color hitColor = #FA4CC9;
color ballColor = defaultBallColor;

void setup() {
  //Set the size
  size(640, 480);

  setupPaddle();
  setupBall();
  setupGhostPaddle();
}

//Setup of paddle position on screen and speed

void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

//Setup of ball position on screen and speed

void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

//ADDED: Setup of ghost paddle

void setupGhostPaddle() {
  ghostPaddleX = width/2;
  ghostPaddleY = height-3*ghostPaddleHeight;
  ghostPaddleVX = 0;
}

void draw() {
  //Fill the background each frame, so animation happens
  background(backgroundColor);

  //Calling Static function found below
  drawStatic();

  //Update paddle and ball by calling their update method
  updatePaddle();
  updateBall();
  updateGhostPaddle();

  //Draw paddle and ball by calling respective functions found below
  drawPaddle();
  drawBall();
  drawGhostPaddle();
}


//Function that draws background static
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
}

//Update of paddle's location based on the velocity (so paddle moves)
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}

//Update of ball's location based on velocity (so ball moves)
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
}

//Update of ghost paddle position
void updateGhostPaddle() {
  ghostPaddleX += ghostPaddleVX;  
  ghostPaddleX = constrain(ghostPaddleX, 0+ghostPaddleWidth/2, width-ghostPaddleWidth/2);

  //Calling functions that determine behaviour of collision  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

//Paddle size, colour and initial position
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

//Ball size, colour and initial position
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

void drawGhostPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(ghostPaddleColor);
  rect(ghostPaddleX, ghostPaddleY, ghostPaddleWidth, ghostPaddleHeight);
}

//Check if ball overlaps paddle, then bounce up
//CHANGED BALL COLLISION COLOUR (ball color is now pink)
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    ballColor = hitColor;
  }
}

// check if edges of ball overlaps paddle, return true, if not false
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

// check if ball hits bottom
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

//calculate when ball hits bottom
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

// if ball's edge hits wall, X coordinate reserve velocity, if not fall (gravity)
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  //CHANGED BALL COLLISION COLOUR (ball color is now white)  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
    ballColor = defaultBallColor;
  }
}


//keyPressed methods, if LEFT key, then we want x to be negative velocity, same for RIGHT
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
    ghostPaddleVX = -ghostPaddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
    ghostPaddleVX = ghostPaddleSpeed;
  }
}

//if LEFT/RIGHT key are released, then reverse velocity for paddle
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
    ghostPaddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
    ghostPaddleVX = 0;
  }
}