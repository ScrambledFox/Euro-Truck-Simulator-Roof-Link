/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class InalfaRoof{ 
  
  EngineEvent engine = new EngineEvent();
  BlinkerEvent blinker = new BlinkerEvent();
  WaveEvent wave = new WaveEvent();
  
  TestEvent test = new TestEvent();
  
  color ambientColour;
  
  public InalfaRoof ( color ambientColour ) {
    this.ambientColour = ambientColour;
    wave.currentColour = ambientColour;
  }
  
  void Tick(){
    engine.Handle();
    
    if(engine.carStarted){
      wave.Handle();
      blinker.Handle();
    }
    
    test.Handle();
  }
  
}
