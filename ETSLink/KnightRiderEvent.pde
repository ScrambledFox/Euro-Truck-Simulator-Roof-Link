/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class KnightRiderEvent{
  
  float speed = 10;
  
  int y;
  boolean direction = true;
  
  boolean active = false;
  
  public void Tick(boolean state){
    this.active = state;
    
    this.Draw();
  }
  
  public void Draw(){
    pushStyle();
    pushMatrix();
    
    if(active){
      
      translate(0, 0, 100);
      
      fill(0);
      rect(0, 0, inalfaRoof.effectWidth * 2, height);
      
      if(y < 0) direction = true;
      if(y > height) direction = false;
      
      if(direction) y += speed;
      else          y -= speed;
      
      fill(color(255, 0, 0));
      rect(0, y, inalfaRoof.effectWidth * 2, height/20);
    }
    
    popMatrix();
    popStyle();
  }
  
}
