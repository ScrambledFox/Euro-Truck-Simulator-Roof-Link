/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class WaveEvent extends Event {

  boolean active = false;
  int activeLights = 5;
  float animSpeed = 0.005f;
  
  int brightness = 128;
  
  float distance;
  
  color currentColour = color(255);
  
  public void Handle(){
    //brightness = (int)(carData.rpm / (2500) * 128);
    //distance += carData.speed * animSpeed;

    Draw();
  }
  
  public void Draw(){
    pushMatrix();
    pushStyle();
    
    translate(0, 0, -10);
    
    strokeWeight(1);
    if (active) {
      for(int y = 0; y < height; y++){
        float wave = 0;
        
        /*
        if(carData.speed < carData.speedLimit) {
          wave = 255;
        } else{
          wave = sin(y / 100f * activeLights + distance) * 255/2f + 255/2f;
        }
        */
        
        color colour = blendColor(color(wave), currentColour, MULTIPLY);
        
        //stroke(colour, brightness * (1 + carData.userSteer));
        //stroke(colour, 255);
        
        line(0, y, 10, y);
        
        //stroke(colour, brightness * (1 + carData.userSteer * -1));
        //stroke(colour, 255);
        
        line(10, y, 20, y);
      }
    }
    
    popStyle();
    popMatrix();
  }
  
}
