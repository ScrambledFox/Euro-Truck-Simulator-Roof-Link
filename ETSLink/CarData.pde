/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class CarData extends Data {
  
  boolean engineOn;
  
  float speed;
  float rpm;
  float maxRpm;
  
  boolean blinkerLeftActive;
  boolean blinkerRightActive;
  
  boolean blinkerLeftOn;
  boolean blinkerRightOn;
  
  boolean lightsDashboardOn;
  
  float userSteer;
  float userBrake;
  
  int speedLimit;
  
  boolean doorOpen;
  boolean knightRider;
  
  public CarData ( String url ) {
    this.url = url;
  }
  
  public void Tick ( ) {
    /*
      UpdateRawData();
      JSONObject truckData = rawData.getJSONObject("truck");
      JSONObject navigationData = rawData.getJSONObject("navigation");
      
      engineOn = truckData.getBoolean("engineOn");
      
      speed = truckData.getFloat("speed");
      rpm = truckData.getFloat("engineRpm");
      maxRpm = truckData.getFloat("engineRpmMax");
      
      blinkerLeftActive = truckData.getBoolean("blinkerLeftActive");
      blinkerRightActive = truckData.getBoolean("blinkerRightActive");
      blinkerLeftOn = truckData.getBoolean("blinkerLeftOn");
      blinkerRightOn = truckData.getBoolean("blinkerRightOn");
      
      userSteer = truckData.getFloat("userSteer");
      userBrake = truckData.getFloat("userBrake");
      
      speedLimit = navigationData.getInt("speedLimit");
      */
      
      engineOn = true;
      
      maxRpm = 2500;
      rpm = 1000;
      
  }
  
}
