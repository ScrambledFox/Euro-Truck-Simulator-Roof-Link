/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class EngineEvent extends Event{

  int engineStartProgress = 0;
  int maxEngineStartProgress = 60;
  
  boolean carStarted = false;
  
  public void Handle(){
    if(carData.engineOn) {
      if(!carStarted) engineStartProgress++;
      if(engineStartProgress >= maxEngineStartProgress) carStarted = true;
    } else{
      carStarted = false;
      engineStartProgress = 0;
    }
    
    if(carStarted) inalfaRoof.wave.active = true;
              else inalfaRoof.wave.active = false;
              
    if(!carStarted && carData.engineOn) this.Draw();
  }
  
  void Draw(){
    pushMatrix();
    pushStyle();
    
    noStroke();
    fill(255, 255/2);
    
    translate(0, 0, 10);
    
    /*
    for(int i = 0; i < 5; i++){
      int minStart = i * maxEngineStartProgress / 5;
      int maxStart = (i+1) * maxEngineStartProgress / 5;
      float size = (engineStartProgress - minStart) / (float)(maxEngineStartProgress - maxStart) * height;
      rect(0, 0, 20, size);
    }
    */
    
    strokeWeight(1);
    stroke(255);
    
    float loc = height/2;
    float size = 10;
    float h = 1;
    
    for(int x = 0; x < 20; x++){
      for(int y = 0; y < height; y++){
        loc = engineStartProgress / (float)maxEngineStartProgress * height;
        size = 255;
        h = engineStartProgress / (float)maxEngineStartProgress * 5f;
        stroke(255 - abs(y - loc) / h, size);
        point(x, y);
      }
    }
    
    popStyle();
    popMatrix();
  }
  
}
