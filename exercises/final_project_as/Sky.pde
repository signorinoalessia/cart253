//Sky
//
// A class in which the sky is determined via colorLarp for two gradients, changing over time thrice.
// Reference - Processing forum post by 542Red and Sabine Rosenberg

class Sky {
  int y_axis = 1;

  // Gradient color sets
  color c1, c2;

  // Gradient colors
  color b0 = color(10, 10, 200);
  color r0 = color(10, 10, 115);

  color b1 = color(10, 10, 115);
  color r1 = color(100, 20, 0);

  color b2 = color(125, 145, 255);
  color r2 = color(245, 125, 40);

  color b3 = color(125, 145, 255);
  color r3 = color(255, 225, 145);

  // interval variables that will determine begin time and colours
  color currentR1 = r1;
  color currentB1 = b1;
  float interval=0;
  float interval2=0;
  float interval3=0;

  // Timer variables
  long timePassed =0;
  long startTime =0;
  int timeExpired =200;

  // Is it daytime?
  boolean skyDay = false;

  ////////// Constructor ///////////

  //Timer sent into the main program
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

    //array and colorLerp that runs per every line in screen layout
    for (int i=0; i<1080; i++) {
      color interA = lerpColor(currentB1, currentR1, (i/1080.0));
      stroke(interA);
      line(0, i, 1920, i);
    }
    
    // timer determined by current time minus the start time
    timePassed = millis()-startTime;

    if (interval < 1)
    {
      if (timePassed>timeExpired)
      {
        interval = interval+0.01;
        timePassed =0;
        startTime =millis();
      }
      
      //Run lerp from first set of color, during set interval
      currentR1 = lerpColor(r0, r1, interval);
      currentB1 = lerpColor(b0, b1, interval);
    } else if (interval2 < 1)
    {
       //if the time passed has expired, then proceed to following colorLerp
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
    // See method below
    skyDay();
  }
  
  // Method to determine is the sky lerpcolor has fnished and is thus at the brightest point of day
  void skyDay() {
    if (currentR1 == r3) {
      skyDay = true;
    }
  }
}