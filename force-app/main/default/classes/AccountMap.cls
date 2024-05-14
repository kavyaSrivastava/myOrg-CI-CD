public with sharing class AccountMap {
    @AuraEnabled
    public static List<String>  methodName1(id accRecordId){
        try {


            Accesskey__c accKey = [Select Name, Key__c,Id FROM Accesskey__c Limit 1];

            String accKeyValue = accKey.Key__c; 
            List<String> coordinatesList = new List<String>();
            String longitude ='';
            String latitude ='';
            Account acc = [SELECT Id, BillingCity, BillingCountry, BillingState from Account where id=:accRecordId];
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            // String str ='http://api.positionstack.com/v1/forward?access_key='05bb57a968cca04a71b4879110c2b611&query+'='+acc.BillingCity+','+acc.BillingState+','+acc.BillingCountry+'&limit=1';

            String str ='http://api.positionstack.com/v1/forward?access_key='+accKeyValue+'&query='+acc.BillingCity+','+acc.BillingState+','+acc.BillingCountry+'&limit=1';
            request.setEndpoint(str);
            request.setMethod('GET');
            HttpResponse response = http.send(request);
           
            // If the request is successful, parse the JSON response.
            if(response.getStatusCode() == 200) {
                // Deserializes the JSON string into collections of primitive data types.
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                System.debug(JSON.deserializeUntyped(response.getBody()));
                System.debug((results.get('data')));


                
                List<Object> coordinates = (List<Object>)results.get('data') ;
                System.debug(coordinates[0]);

                Map<String, Object> coordinatesmap = (Map<String,Object>) coordinates[0];
                // System.debug(coordinatesmap.get('longitude'));
                longitude =String.valueOf(coordinatesmap.get('longitude')) ;
                latitude = String.valueOf(coordinatesmap.get('latitude'));
                coordinatesList.add(longitude);
                coordinatesList.add(latitude);

            }
            // if(!coordinatesList.isEmpty()){
            //     coordinatesList;
            // }
             return coordinatesList;
            
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
// public static Accesskey__c companySetting(){
//    Accesskey__c accKey = [Select Name, Key__c,Id FROM Accesskey__c Limit 1];
//    System.debug(accKey.Key__c);
//    return accKey;

// }

   
}