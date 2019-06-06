/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class InalfaRoof{ 
  
  int effectWidth = 20;

  DoorEvent doorEvent;
  EngineEvent engineEvent;
  KnightRiderEvent knightRiderEvent;
  
  BlinkerEvent blinkerLeft;
  BlinkerEvent blinkerRight;
  
  BrakeEvent brakeEvent;

  color ambientColour;
  
  public InalfaRoof ( color ambientColour ) {
    this.ambientColour = ambientColour;

    doorEvent = new DoorEvent(ambientColour);
    engineEvent = new EngineEvent();
    
    knightRiderEvent = new KnightRiderEvent();
    
    blinkerLeft = new BlinkerEvent(false);
    blinkerRight = new BlinkerEvent(true);
    
    brakeEvent = new BrakeEvent();
  }
  
  public void Tick(){
    
    // Other Systems // Also event systems
    engineEvent.Tick();
    
    knightRiderEvent.Tick(carData.knightRider);
    
    doorEvent.Tick(carData.doorOpen);
    
    blinkerLeft.Tick(carData.blinkerLeftActive);
    blinkerRight.Tick(carData.blinkerRightActive);
    
    brakeEvent.Tick(carData.userBrake > 0.1);
    
    // Systems to handle on when engine is on..
    if(engineEvent.carStarted){
      
    }
  }
  
}
