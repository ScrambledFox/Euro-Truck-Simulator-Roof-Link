class StepInEvent {
  
  color colour;
  
  float twinkleAmount;
  
  ArrayList<Twinkle> twinkles = new ArrayList<Twinkle>();
  
  public StepInEvent ( color colour ){
    this.colour = colour;
  }
  
  public void Tick(){
    if(inalfaRoof.twinkleActive){
      if(frameCount % (int)random(30, 60) == 0) twinkles.add(new Twinkle(colour));
    }
    
    this.Draw();
  }
  
  public void Draw(){
    for(int i = 0; i < twinkles.size(); i++){
      twinkles.get(i).Tick();
    }
  }
  
}
