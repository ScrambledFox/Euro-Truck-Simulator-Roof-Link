class DoorEvent{
  
  color colour;
  
  int fadeProgress = 0;
  int maxFadeProgress = 60;
  
  public DoorEvent( color colour ){
    this.colour = colour;
  }
  
  public void Tick(){
    if(inalfaRoof.doorActive){
      if(fadeProgress < maxFadeProgress) fadeProgress++;
    } else{
      if(fadeProgress > 0)               fadeProgress--;
    }
    
    
    this.Draw();
  }
  
  public void Draw(){
    pushStyle();
    
    fill(colour, fadeProgress / (float)maxFadeProgress * 255);
    rect(0, 0, width, height);
    
    popStyle();
  }
  
}
