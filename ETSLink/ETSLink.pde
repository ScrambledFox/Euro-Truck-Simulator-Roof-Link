/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

import spout.*;

CarData carData;
InalfaRoof inalfaRoof;
UI ui;

Spout spout;

void setup(){
  
  size(900, 500, P3D);
  ortho();
  frameRate(60);
  background(0);
  
  inalfaRoof = new InalfaRoof(color(255, 255, 255));
  carData = new CarData("http://192.168.0.22:25555/api/ets2/telemetry");
  ui = new UI();
  
  //spout = new Spout(this);
  //spout.createSender("ETSLink");
  
}

void draw(){ 
  
  background(0);
  
  // 3 times per second
  if (frameCount % 20 == 0) thread("UpdateLiveData");
  
  inalfaRoof.Tick();
  
  ui.Tick();
  
  //spout.sendTexture();
  
}

  // Only call via threads.. LoadJSON takes a long time!
void UpdateLiveData(){
  carData.Tick();
}

void keyPressed(){
  if(key == 'o') carData.blinkerLeftActive = !carData.blinkerLeftActive;
  if(key == 'p') carData.blinkerRightActive = !carData.blinkerRightActive;
  if(key == 'd') carData.doorOpen = !carData.doorOpen;
  if(key == 'k') carData.knightRider = !carData.knightRider;
}
