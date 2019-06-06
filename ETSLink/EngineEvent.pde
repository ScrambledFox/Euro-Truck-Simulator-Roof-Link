/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class EngineEvent extends Event{

  int engineStartProgress = 0;
  int maxEngineStartProgress = 40;
  
  boolean carStarted = false;
  
  float offset;
  
  public void Tick(){
    if(inalfaRoof.engineOn && engineStartProgress < maxEngineStartProgress) engineStartProgress++;
    else if(engineStartProgress > 0) engineStartProgress--;
    if(engineStartProgress > 0) this.Draw();
  }
  
  void Draw(){
    pushMatrix();
    pushStyle();
    
    offset += random(-10, 10);
    
    if(offset < 0) offset = 0;
    if(offset > 100) offset = 100;
    
    for(int x = 0; x < 20; x++){
      for(int y = 0; y < height; y++){
        stroke(color(y / (float)height * 255f - offset, y / (float)height * 255f - offset - y / 5f, 0, engineStartProgress / (float)maxEngineStartProgress * 255 ));
        strokeWeight(1);
        point(x, y);
      }
    }
    
    for(int x = width - 20; x < width; x++){
      for(int y = 0; y < height; y++){
        stroke(color(y / (float)height * 255f - offset, y / (float)height * 255f - offset - y / 5f, 0, engineStartProgress / (float)maxEngineStartProgress * 255 ));
        strokeWeight(1);
        point(x, y);
      }
    }
    
    popStyle();
    popMatrix();
  }
  
}
