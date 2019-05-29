/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class TestEvent extends Event {

  long eventStartFrameCount;
  boolean started = false;
  
  int testTime = 270;
  
  public void Start () {
    eventStartFrameCount = frameCount;
    
    started = true;
  }
  
  public void Handle () {
    if(!started) return;
  }
 
}
