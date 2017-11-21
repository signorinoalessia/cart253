// Reference - Processing forum, by 542Red
// ColorLarp for two gradients, changing over time thrice
class Sky {
  int y_axis = 1;

  //Gradient colors
  color c1, c2;

  //Gradient colors
  color b0 = color(10, 10, 200);
  color r0 = color(10, 10, 115);

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
  float interval3=0;

  long timePassed =0;
  long startTime =0;
  int timeExpired =20;

  //Is it daytime?
  boolean skyDay = false;

  ////////// Constructor ///////////

  Sky()
  {
    startTime =millis();
  }

  //////////// Methods ////////////

  void update() {

    ////Gradient change rate
    //float rChange1 = 0.3;
    //float rChange2 = 0.4;

    //float bChange1 = 0.2;
    //float bChange2 = 0.4;
  }

  void display() {
    //gradientRect(width/2, height/2, 1920, 1080, c1, c2);

    for (int i=0; i<1080; i++) {
      color interA = lerpColor(currentB1, currentR1, (i/1080.0));
      stroke(interA);
      line(0, i, 1920, i);
    }

    timePassed = millis()-startTime;

    if (interval < 1)
    {
      if (timePassed>timeExpired)
      {
        interval = interval+0.01;
        timePassed =0;
        startTime =millis();
      }

      currentR1 = lerpColor(r0, r1, interval);
      currentB1 = lerpColor(b0, b1, interval);
    } else if (interval2 < 1)
    {
      if (timePassed>timeExpired)
      {
        interval2 = interval2+0.01;
        timePassed =0;
        startTime =millis();
      }

      currentR1 = lerpColor(r1, r2, interval2);
      currentB1 = lerpColor(b1, b2, interval2);
    } else 
    {
      if (timePassed>timeExpired)
      {
        interval3 = interval3+0.01;
        timePassed =0;
        startTime =millis();
      }

      currentR1 = lerpColor(r2, r3, interval3);
      currentB1 = lerpColor(b2, b3, interval3);
    }
    
    skyDay();
  }

  void skyDay() {
    if (currentR1 == r3) {
      skyDay = true;
    }
  }
}