class Timer {
  // The value of millis() when the timer was started
  int startTime;
  // The number of milliseconds that have elapsed for the timer
  // Need this for pausing
  int elapsed = 0;
  // The time this timer is set for (in milliseconds)
  int time;
  // Whether or not the timer is active
  boolean running = false;
  // Whether or not the timer is paused
  boolean paused = false;
  // Timer (int tempTime)
  //
  // Create a new timer with a set number of milliseconds to count to
  Timer(int tempTime) {
    time = tempTime;
  }
  // start()
  //
  // Start the timer running
  void start() {
    // Don't start the timer if it's already running and not paused
    if (running && !paused) {
      return;
    }
    // Remember the time it was started (or restarted if paused)
    startTime = millis();
    // Remember that it's running
    running = true;
    // And that it's not paused (if it was)
    paused = false;
  }
  // pause()
  //
  // Pause the timer
  void pause() {
    // Don't pause if the timer is stopped or paused
    if (!running || paused) {
      return;
    }
    // Remember it's paused
    paused = true;
    // Add the time that elapsed up to the pause to our elapsed variable
    // So we can remember the cumulative amount of time
    elapsed += (millis() - startTime);
  }
  // stop()
  //
  // Stop the timer completely and reset it
  void stop() {
    running = false;
    elapsed = 0;
  }
  // isDone()
  //
  // Returns true if the elapsed time is greater than the set time
  // and false otherwise
  boolean isDone() {
    // If the timer isn't running or it's paused, then it isn't
    // done
    if (!running || paused) {
      return false;
    }
    // Add the elapsed time since the last time it was started
    // so we know how much time has passed
    elapsed += (millis() - startTime);
    // Remember the new start time (now) so that we can count
    // time elapsed since this check
    startTime = millis();
    // Check if the elapsed time is greater than the set time
    // and return the result
    if (elapsed >= time) {
      return true;
    } else {
      return false;
    }
  }
}