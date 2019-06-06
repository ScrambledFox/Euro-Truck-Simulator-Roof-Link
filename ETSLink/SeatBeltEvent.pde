class SeatBeltEvent{
  
  color colour;
  
  boolean active = false;
  boolean side = false;
  
  int blinks = -1;
  int maxBlinks = 3;
  
  int fade = 0;
  boolean fadeDirection = true;
  
  public SeatBeltEvent( color colour, boolean left ){
    this.colour = colour;
    this.side = left;
  }
  
  public void Tick(){
    this.Draw();
  }
  
  public void doSeatBelt(){
    active = true;
  }
  
  public void Draw(){
    pushStyle();
    
    if(active){
      if(blinks < maxBlinks){
        
        if(fade >= 255){
          fadeDirection = false;
        }
        if(fade <= 0){
          fadeDirection = true;
          blinks++;
        }
        
        if (fadeDirection) fade += 15;
        else               fade -= 15;
        
        noStroke();
        fill(255, fade);
        
        if(!side) {rect(0, 0, width/2, height);}
        else {rect(width/2, 0, width/2, height);}
        
      } else{
        active = false;
        blinks = -1;
      }
    }
    
    popStyle();
  }
  
}
