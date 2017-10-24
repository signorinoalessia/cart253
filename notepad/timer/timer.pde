boolean timerRunning = false;
int startTime = 0;

void draw() {
  if (timerRunning) {
    int timeElapsed = (millis() - startTime)/1000;
    println(timeElapsed);
  }
}

void keyPressed() {
  if (key == 's') {
    startTime = millis();
    timerRunning = true;
  } else if (key == 'x') {
    timerRunning = false;
  }
}