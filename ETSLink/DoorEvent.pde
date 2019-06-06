/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class DoorEvent{
  
  color colour;
  
  int fadeProgress = 0;
  int maxFadeProgress = 60;
  
  boolean active = false;
  
  public DoorEvent( color colour ){
    this.colour = colour;
  }
  
  public void Tick(boolean state){
    active = state;
    
    if(active){
      if(fadeProgress < maxFadeProgress) fadeProgress++;
    } else{
      if(fadeProgress > 0)               fadeProgress--;
    }
    
    this.Draw();
  }
  
  public void Draw(){
    pushStyle();
    
    fill(colour, fadeProgress / (float)maxFadeProgress * 255);
    rect(0, 0, inalfaRoof.effectWidth, height);
    
    popStyle();
  }
  
}
