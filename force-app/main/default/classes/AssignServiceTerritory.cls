public class AssignServiceTerritory {
  @invocableMethod(label = 'Update service territory field in service appointment record')
  public static List < ReturnedVariable > main(List < Id > recordIdList) {
    // System.debug('recordList====' + recordIdList);
    
    List < ServiceAppointment > coordinateList = [SELECT Id, Address, Latitude, Longitude FROM ServiceAppointment WHERE Id in: recordIdList];
    Double longitudes = coordinateList[0].Longitude;
    Double latitudes = coordinateList[0].Latitude;
      
    List < ServiceTerritory > newList = [SELECT Id, Name, FSL__Internal_SLR_Geolocation__c, DISTANCE(FSL__Internal_SLR_Geolocation__c, GEOLOCATION(: latitudes,: longitudes), 'mi')
                                         FROM ServiceTerritory
    									 WHERE DISTANCE(FSL__Internal_SLR_Geolocation__c, GEOLOCATION(: latitudes,: longitudes), 'mi') < 10 ORDER BY DISTANCE(FSL__Internal_SLR_Geolocation__c, GEOLOCATION(: latitudes,: longitudes), 'mi') limit 1
                                        ];
      

    System.debug(newList);
   
    List < ReturnedVariable > returnVarList = new List < ReturnedVariable > ();
    ReturnedVariable re = new ReturnedVariable();

    for (ServiceAppointment serviceAppointment: coordinateList) {

      if (newList.size() > 0 && newList != null) {
        serviceAppointment.ServiceTerritoryId = newList[0].Id;
        update serviceAppointment;
        
        re.completed = 1;
        returnVarList.add(re);
      } else {
        re.completed = 0;
        returnVarList.add(re);
      }
    }

    return returnVarList;
  }
  public class InputVariable {
    @InvocableVariable
    public List < ServiceAppointment > recordIdList;
  }
  public class ReturnedVariable {
    @InvocableVariable
    public Integer completed;
  }
}