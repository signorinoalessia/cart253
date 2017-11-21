// Reference - Processing forum, by 542Red

//** How to create an animated gradient sky over time?***

class Sky {

  int y_axis = 1;

  //Gradient colors
  color c1, c2;

  //Gradient colors
  color b1 = color(10, 10, 115);
  color r1 = color(100, 20, 0);

  color b2 = color(125, 145, 255);
  color r2 = color(245, 125, 40);

  color b3 = color(125, 145, 255);
  color r3 = color(255, 225, 145);

  color currentR1 = r1;
  color currentB1 = b1;
  float interval=0;
  float interval2=0;

  long timePassed =0;
  long startTime =0;
  int timeExpired =10;

  Sky()
  {
    startTime =millis();
  }


  void update() {



    //Gradient change rate
    float rChange1 = 0.5;
    float rChange2 = 0.9;

    float bChange1 = 0.5;
    float bChange2 = 0.9;
  }

  void display() {
    //gradientRect(width/2, height/2, 1920, 1080, c1, c2);


    for (int i=0; i<1080; i++) {
      color interA = lerpColor(currentB1, currentR1, (i/1080.0));
      stroke(interA);
      line(0, i, 1920, i);
    }

    timePassed = millis()-startTime;

    if (interval <1)
    {
      if (timePassed>timeExpired)
      {
        interval = interval+0.01;
        timePassed =0;
        startTime =millis();
      }

      currentR1 = lerpColor(r1, r2, interval);
      currentB1 = lerpColor(b1, b2, interval);
    
  } 
  else 
  {
    if (timePassed>timeExpired)
      {
        interval2 = interval2+0.01;
        timePassed =0;
        startTime =millis();
      }

      currentR1 = lerpColor(r2, r3, interval2);
      currentB1 = lerpColor(b2, b3, interval2);
  }


  ////map gradient colors
  //c1 = map(r1, r2, r3);
  //c2 = map(b1, b2, b3);

  //c1 = r1+rChange1;
  //if ( //?

  //setGradient(width/2, height/2, 1920, 1080, c1, c2, y_axis);
}

//// Gradient method ???*
//void setGradient(int x, int y, int w, int h, color c1, color c2, int axis) {
//  for (int i; i <=y+h; i++) {
//    //???

//    // Timer
//    if (millis()-timer > 3000) {
//      timer = millis();
//    }
//  }

//beginShape();
//fill(c1);
//vertex(x, y);
//vertex(x, y+h);
//fill(c2);
//vertex(x+w, y+h);
//vertex(x+w, y);
//endShape();
//}
}