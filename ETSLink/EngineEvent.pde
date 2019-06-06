/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class EngineEvent {
  
  int engineStartProgress = 0;
  int maxEngineStartProgress = 40;
  
  boolean carStarted = false;
  
  float offset;
  
  public void Tick(){
    if(carData.engineOn && engineStartProgress < maxEngineStartProgress) engineStartProgress++;
    else if(engineStartProgress > 0) engineStartProgress--;
    if(engineStartProgress > 0) this.Draw();
  }
  
  void Draw(){
    pushMatrix();
    pushStyle();
    
    offset += random(-10, 10);
    
    if(offset < 0) offset = 0;
    if(offset > 50) offset = 50;
    
    //carData.rpm = mouseX / width * carData.maxRpm;
    float engineOffset = 150 - (carData.rpm / carData.maxRpm) * 150;
    
    for(int y = 0; y < height; y++) { 
      stroke(color(y / (float)height * 255f + 50 - offset - engineOffset, y / (float)height * 255f + 50 - offset - engineOffset - y / 5f, 0, engineStartProgress / (float)maxEngineStartProgress * 255 ));
      strokeWeight(1);
      line(0, y, inalfaRoof.effectWidth * 2, y);
    }
    
    popStyle();
    popMatrix();
  }
  
}
