/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

import spout.*;

//SetupEvent setup = new SetupEvent();
InalfaRoof inalfaRoof;

//CarData carData;

//DataExporter dataExporter = new DataExporter();
Spout spout;

// 0: id setup, 1: user colour setup R, 2: user colour setup G, 3: user colour setup B, 4: select color index A, 5: select color index B, 6: Wait for start, 7: Start ?????????
int programState = 0;

void setup(){
  
  size(900, 500, P3D);
  ortho();
  frameRate(60);
  background(0);
  
  inalfaRoof = new InalfaRoof(color(255, 255, 255));
  //carData = new CarData("http://192.168.0.22:25555/api/ets2/telemetry");
  
  //spout = new Spout(this);
  //spout.createSender("ETSLink");
  
}

void draw(){ 
  
  background(0);
  
  /*
  if( programState >= 0 ){
    setup.HandleParticipant();
  }
  if(programState >= 1){
    setup.HandleAmbientColour();
  }
  if(programState >= 4){
    setup.HandleTestColour1();
  }
  if(programState >= 5){
    setup.HandleTestColour2();  
  }
  */
  
  /*
  if( programState >= 0 ) {
    setup.HandleTestStart();
    
    inalfaRoof.Tick();
    if(frameCount % 10 == 0) thread("UpdateLiveData");
  }
  
  if(programState >= 1){
    if(!inalfaRoof.test.started) inalfaRoof.test.Start();
  }
  */
  
  inalfaRoof.Tick();
  
  //spout.sendTexture();
  
}

  // Only call via threads.. LoadJSON takes a long time!
void UpdateLiveData(){
  //carData.Tick();
}

void keyPressed(){
  if(key == 'd'){
    inalfaRoof.doorActive = !inalfaRoof.doorActive;
  }
  if(key == 't'){
    inalfaRoof.twinkleActive = !inalfaRoof.twinkleActive;
  }
  if(key == 'n'){
    inalfaRoof.seatBeltLeftEvent.doSeatBelt();
  }
  if(key == 'm'){
    inalfaRoof.seatBeltRightEvent.doSeatBelt();
  }
  if(key == 'e'){
    inalfaRoof.engineOn = !inalfaRoof.engineOn; 
  }
  if(key == 'k'){
    inalfaRoof.knightRiderActive = !inalfaRoof.knightRiderActive;
    inalfaRoof.knightRiderEvent.y = 0;
  }

}
