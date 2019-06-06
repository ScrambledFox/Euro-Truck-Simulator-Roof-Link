/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class BrakeEvent{

  boolean state;
  
  public void Tick(boolean state){
    this.state = state;
    
    this.Draw();
  }
  
  public void Draw(){
    pushStyle();
    
    fill(255, 0, 0);
    rect(inalfaRoof.effectWidth * 2, 0, inalfaRoof.effectWidth, height);
    
    popStyle();
  }
  
}
