/// Copyright Joris Lodewijks 2019
/// Created for the Adaptive Mobility squad @ Eindhoven University of Technology

class DataExporter {

  public void ExportData () {
    Table table = new Table();
    table.addColumn("C:ParticipantId");
    table.addColumn("I:TestColour1");
    table.addColumn("I:TestColour2");
    table.addColumn("D:AmbientColour");
    
    TableRow row = table.addRow();
    row.setInt(0, setup.participantId);

    row.setString(1, GetColourName(setup.testColour1Index));
    row.setString(2, GetColourName(setup.testColour2Index));
    
    row.setString(3, setup.ambientR + ", " + setup.ambientG + ", " + setup.ambientB);
    saveTable(table, "data/participant" + setup.participantId + ".csv");
  }
  
  private String GetColourName (int index){
    switch(index) {
      case 0:
        return "white";
      case 1:
        return "red";
      case 2:
        return "green";
      case 3:
        return "blue";
    }
    
    return "null";
  }
  
}
