/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class Data{

  public String url;
  public JSONObject rawData;
  
  public void UpdateRawData(){
    rawData = loadJSONObject(url);
  } 
  
}
