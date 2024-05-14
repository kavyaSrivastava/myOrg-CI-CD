public without sharing class CustomLookupLwcController {
   // Method to fetch lookup search result   
   @AuraEnabled(cacheable=true)
   public static list<sObject> fetchLookupData(string sobjectFieldName , string sObjectName) {    
       List < sObject > returnList = new List < sObject > ();
    //    string sWildCardText = '%' + sobjectFieldName + '%';
    System.debug('Field Name ===>'+ sobjectFieldName);
    System.debug('Object Name ===>'+ sObjectName);
 String sQuery='';
     if(sobjectFieldName == 'Name'){
         sQuery = 'Select Id, ' + sobjectFieldName + ' From ' + sObjectName + ' LIMIT 10000';

     }
     else{
         sQuery = 'Select Id, Name, ' + sobjectFieldName + ' From ' + sObjectName + ' LIMIT 10000';
     }
    

    //    for (sObject obj: database.query(sQuery)) {
    //        returnList.add(obj);
    //    }
        returnList = database.query(sQuery);
        System.debug(returnList);
       if(!returnList.isEmpty()){
        return returnList;
       }
       return null;
       
   }
   
   // Method to fetch lookup default value 
//    @AuraEnabled
//    public static sObject fetchDefaultRecord(string recordId , string sObjectApiName) {
//        string sRecId = recordId;    
//        string sQuery = 'Select Id,Name From ' + sObjectApiName + ' Where Id = : sRecId LIMIT 1';
//        for (sObject obj: database.query(sQuery)) {
//            return obj;
//        }
//        return null;
//    }
}