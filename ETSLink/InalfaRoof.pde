/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class InalfaRoof{ 
  
  boolean doorActive = false;
  boolean twinkleActive = false;
  
  boolean engineOn = false;
  
  boolean knightRiderActive = false;
  
  DoorEvent doorEvent;
  StepInEvent stepInEvent;
  SeatBeltEvent seatBeltLeftEvent;
  SeatBeltEvent seatBeltRightEvent;
  EngineEvent engineEvent;
  KnightRiderEvent knightRiderEvent;
  
  color ambientColour;
  
  public InalfaRoof ( color ambientColour ) {
    this.ambientColour = ambientColour;
    
    stepInEvent = new StepInEvent(color(255));
    doorEvent = new DoorEvent(color(255, 255, 255));
    seatBeltLeftEvent = new SeatBeltEvent(color(255), false);
    seatBeltRightEvent = new SeatBeltEvent(color(255), true);
    
    engineEvent = new EngineEvent();
    
    knightRiderEvent = new KnightRiderEvent();
  }
  
  public void Tick(){
    /*
    engine.Handle();
    
    if(engine.carStarted){
      wave.Handle();
      blinker.Handle();
    }
    */
    
    stepInEvent.Tick();
    
    doorEvent.Tick();
    
    seatBeltLeftEvent.Tick();
    seatBeltRightEvent.Tick();
    
    engineEvent.Tick();
    
    knightRiderEvent.Tick();
  }
  
}
