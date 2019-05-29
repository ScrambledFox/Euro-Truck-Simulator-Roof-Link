/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

import spout.*;

SetupEvent setup = new SetupEvent();
InalfaRoof inalfaRoof;

CarData carData;

DataExporter dataExporter = new DataExporter();
Spout spout;

// 0: id setup, 1: user colour setup R, 2: user colour setup G, 3: user colour setup B, 4: select color index A, 5: select color index B, 6: Wait for start, 7: Start ?????????
int programState = 0;

void setup(){
  
  size(900, 500, P3D);
  ortho();
  frameRate(60);
  background(0);
  
  inalfaRoof = new InalfaRoof(color(255, 255, 255));
  carData = new CarData("http://192.168.0.22:25555/api/ets2/telemetry");
  
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
  
  if( programState >= 0 ) {
    setup.HandleTestStart();
    
    inalfaRoof.Tick();
    if(frameCount % 10 == 0) thread("UpdateLiveData");
  }
  
  if(programState >= 1){
    if(!inalfaRoof.test.started) inalfaRoof.test.Start();
  }
  
  //spout.sendTexture();
  
}

  // Only call via threads.. LoadJSON takes a long time!
void UpdateLiveData(){
  carData.Tick();
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      if(programState == 0) setup.participantId++;
      if(programState == 1) setup.ambientR++;
      if(programState == 2) setup.ambientG++;
      if(programState == 3) setup.ambientB++;
      if(programState == 4) setup.testColour1Index++;
      if(programState == 5) setup.testColour2Index++;
    }
    if(keyCode == DOWN){
      if(programState == 0) setup.participantId--;
      if(programState == 1) setup.ambientR--;
      if(programState == 2) setup.ambientG--;
      if(programState == 3) setup.ambientB--;
      if(programState == 4) setup.testColour1Index--;
      if(programState == 5) setup.testColour2Index--;
    }
    if(keyCode == LEFT){
      if(programState == 1) setup.ambientR -= 25;
      if(programState == 2) setup.ambientG -= 25;
      if(programState == 3) setup.ambientB -= 25;
    }
    if(keyCode == RIGHT){
      if(programState == 1) setup.ambientR += 25;
      if(programState == 2) setup.ambientG += 25;
      if(programState == 3) setup.ambientB += 25;
    }
    if(keyCode == ALT){
      if(programState == 1) setup.ambientR = setup.ambientR < 128 ? 255 : 0;
      if(programState == 2) setup.ambientG = setup.ambientG < 128 ? 255 : 0;
      if(programState == 3) setup.ambientB = setup.ambientB < 128 ? 255 : 0;
    }
  }
  if(key == ENTER){
    setup.Next();
  }

}
