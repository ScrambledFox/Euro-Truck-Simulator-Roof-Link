/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class CarData extends Data {
  
  boolean engineOn;
  
  float speed;
  float rpm;
  float maxRpm;
  
  boolean blinkerLeftActive;
  boolean blinkerRightActive;
  
  boolean lightsDashboardOn;
  
  float userSteer;
  
  int speedLimit;
  
  public CarData ( String url ) {
    this.url = url;
  }
  
  public void Tick ( ) {
      /*UpdateRawData();
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
      
      speedLimit = navigationData.getInt("speedLimit");
      */
      
      engineOn = true;
      speed = 50;
      speedLimit = 20;
      rpm = 2500;
      maxRpm = 2500;
      
      blinkerLeftActive = true;
      
  }
  
}
