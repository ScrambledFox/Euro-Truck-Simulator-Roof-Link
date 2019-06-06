/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class BlinkerEvent{
  
  int blinkerProgress = -30;
  int maxBlinkerProgress = 30;
  
  public void Handle(){
    //if(carData.blinkerLeftActive || carData.blinkerRightActive) blinkerProgress++;
    if(blinkerProgress > maxBlinkerProgress) blinkerProgress = -maxBlinkerProgress;
    
    this.Draw();
  }
  
  public void Draw(){
    pushMatrix();
    pushStyle();
    
    noStroke();
    fill(#d84b20);
    
    translate(0, 0, 10);
    
    float size = blinkerProgress / (float)maxBlinkerProgress;
    
    if(blinkerProgress > 0){
      /*
      if(carData.blinkerLeftActive) {
        rect(0, 0, 10, size * height);
      }
      if(carData.blinkerRightActive) {
        rect(10, 0, 10, size * height);
      }
      */
    }
    
    popStyle();
    popMatrix();
  }
  
}
