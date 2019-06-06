class Twinkle {

  int intensity = 255;
  
  int y;
  
  color colour;
  
  public Twinkle(color colour){
    y = (int)random(0, height);
    this.colour = colour;
  }
  
  public void Tick(){
    intensity--;
    this.Draw();
  }
  
  public void Draw(){
    pushStyle();
    
    noStroke();
    fill(colour, intensity);
    rect(0, y, width, height/12);
    
    popStyle();
  }
  
}
