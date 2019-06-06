/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class BlinkerEvent{
  
  int blinkerProgress = -30;
  int blinkSpeed = 30;
  
  boolean side;
  boolean active;
  
  public BlinkerEvent( boolean side ){
    this.side = side;
  }
  
  public void Activate(){
    active = true;
  }
  
  public void Deactivate(){
    active = false;
  }
  
  public void SetState(boolean state){
    active = state;
  }
  
  public void Tick(boolean state){
    SetState(state);
    
    if(active)                         blinkerProgress++;
    else                               blinkerProgress = -blinkSpeed;
    if(blinkerProgress > blinkSpeed)   blinkerProgress = -blinkSpeed;
    
    this.Draw();
  }
  
  public void Draw(){
    pushMatrix();
    pushStyle();
    
    noStroke();
    fill(#d84b20);
    
    translate(0, 0, 10);
    
    float size = blinkerProgress / (float)blinkSpeed;
    
    if(blinkerProgress > 0){
      if(!side) rect(0, height, inalfaRoof.effectWidth, -size * height);
      else     rect(inalfaRoof.effectWidth, height, inalfaRoof.effectWidth, -size * height);
    }
    
    popStyle();
    popMatrix();
  }
  
}
