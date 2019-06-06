/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class SetupEvent extends Event {
  
  int participantId;
  
  int ambientR;
  int ambientG;
  int ambientB;
  
  int testColour1Index;
  int testColour2Index;
  
  color[] testColours;
  boolean testDataSent;
  
  public SetupEvent(){
    testColours = new color[4];
    testColours[0] = color(255);
    testColours[1] = color(255, 0, 0);
    testColours[2] = color(0, 255, 0);
    testColours[3] = color(0, 0, 255);
  }
  
  public void Next(){
    programState++;
  }
  
  public void HandleParticipant () {
    DrawParticipant();
  }
  
  private void DrawParticipant () {
    pushMatrix();
    pushStyle();
    
    fill(255);
    textSize(40);
    text("Participant ID: ", width/2 - 400, height/2 - 175);
    text(participantId, width/2 - 0, height/2 - 175);
    
    popStyle();
    popMatrix();
  }
  
  public void HandleAmbientColour(int state){
    DrawAmbientColour(state);
  }
  
  private void DrawAmbientColour(int state) {
    pushMatrix();
    pushStyle();
    
    fill(255);
    textSize(40);
    text("User Colour: R: " + ambientR + ", G: " + ambientG + ", B: " + ambientB, width/2 - 400, height/2 - 100);
    
    stroke(255);
    fill(ambientR, ambientG, ambientB);
    rect(width - 75, height/2 - 150, 75, 75);
    
    switch(state){
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
    
    popStyle();
    popMatrix();
  }
  
  public void HandleAmbientColour( ){
    DrawAmbientColour();
  }
  
  private void DrawAmbientColour( ) {
    pushMatrix();
    pushStyle();
    
    fill(255);
    textSize(40);
    text("User Colour: R: " + ambientR + ", G: " + ambientG + ", B: " + ambientB, width/2 - 400, height/2 - 100);
    
    stroke(255);
    fill(ambientR, ambientG, ambientB);
    rect(width - 75, height/2 - 150, 75, 75);
    
    popStyle();
    popMatrix();
  }
  
  public void HandleTestColour1( ){
    if(testColour1Index < 0) testColour1Index = 0;
    if(testColour1Index > 3) testColour1Index = 3;
    
    DrawTestColour1();
  }
  
  private void DrawTestColour1( ) {
    pushMatrix();
    pushStyle();
    
    fill(255);
    textSize(40);
    text("Test Colour 1: " + testColour1Index, width/2 - 400, height/2 - 0);
    
    stroke(255);
    fill(testColours[testColour1Index]);
    rect(width - 75, height/2 - 50, 75, 75);
    
    popStyle();
    popMatrix();
  }
  
  public void HandleTestColour2( ){
    if(testColour2Index < 0) testColour2Index = 0;
    if(testColour2Index > 3) testColour2Index = 3;
    
    DrawTestColour2();
  }
  
  private void DrawTestColour2( ) {
    pushMatrix();
    pushStyle();
    
    fill(255);
    textSize(40);
    text("Test Colour 2: " + testColour2Index, width/2 - 400, height/2 + 100);
    
    stroke(255);
    fill(testColours[testColour2Index]);
    rect(width - 75, height/2 + 50, 75, 75);
    
    popStyle();
    popMatrix();
  }
  
  public void HandleTestStart () {
    if(!testDataSent) {
      SetTestData();
    }
    
    //DrawTestStart();
  }
  
  /*
  private void DrawTestStart () {
    pushMatrix();
    pushStyle();
    
    if(!inalfaRoof.test.started){
      fill(255);
      textSize(40);
      text("Press ENTER to start!", width/2 - 300, height/2 + 200);
    
      stroke(255);
      fill(255, 0, 0);
      ellipse(100, height/2 + 175, 75, 75);
    } else{
      fill(255);
      textSize(40);
      
      if(frameCount - inalfaRoof.test.eventStartFrameCount < inalfaRoof.test.testTime * 60)
        text("Test Started! " + GetTimeInMinutes(frameCount - inalfaRoof.test.eventStartFrameCount) + " --> " + GetTimeInMinutes(inalfaRoof.test.testTime * 60), width/2 - 300, height/2 + 200);
      else
        text("Test Finished! " + GetTimeInMinutes(frameCount - inalfaRoof.test.eventStartFrameCount), width/2 - 300, height/2 + 200);
    
      stroke(255);
      fill(0, 255, 0);
      ellipse(100, height/2 + 175, 75, 75);
    }
    
    popStyle();
    popMatrix();
  }
  */
  
  public String GetTimeInMinutes (long frames) {
    int seconds = (int)(frames/60);
    int minutes = seconds / 60;
    seconds -= minutes * 60;
    
    String minutesString = minutes < 10 ? "0" + minutes : str(minutes); 
    String secondsString = seconds < 10 ? "0" + seconds : str(seconds);
    
    return minutesString + ":" + secondsString;
  }
  
  public void SetTestData(){
    inalfaRoof.ambientColour = color(ambientR, ambientG, ambientB);
    
    //dataExporter.ExportData();
    testDataSent = true;
  }
  
}
