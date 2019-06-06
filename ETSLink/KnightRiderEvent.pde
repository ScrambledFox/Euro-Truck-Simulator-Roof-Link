class KnightRiderEvent{
  
  
  int y;
  boolean direction = true;
  
  public void Tick(){   
    this.Draw();
  }
  
  public void Draw(){
    pushStyle();
    
    if(inalfaRoof.knightRiderActive){
      if(y < 0) direction = true;
      if(y > height) direction = false;
      
      if(direction) y += 10;
      else          y -= 10;
      
      fill(color(255, 0, 0));
      rect(0, y, width, height/20);
    }
    
    popStyle();
  }
  
}
