@RestResource(urlMapping='/AccountUpdate/*')
global without sharing class PublicCallout {
    @HttpGet
    global static String updateAccount(){
        RestRequest req = RestContext.request;
        /*String count = req.params.get('count');
        System.debug(count);
        Account acc1 = [SELECT Id, Name, numberOfEmployees FROM ACCOUNT WHERE ID = '0012w00001LzI83AAF'];
        acc1.NumberOfEmployees += Integer.ValueOf(count);
        update acc1;*/
        /*Account acc2 = new Account();
acc2.Name = 'CallOut';
acc2.NumberOfEmployees = 1;
insert acc2;*/
        // return acc1.NumberOfEmployees;
        List<Messanger__c> messangerList = [SELECT Email__c FROM Messanger__c ];
        List<String> emailList = new List<String>();
        for(Messanger__c mes : messangerList ){
            emailList.add(mes.Email__c);
        }
        Map<String, Object> mapOfData =  (Map<String, Object>)JSON.deserializeUntyped(RestContext.request.requestBody.toString());
        
        
        Messanger__c messanger1 = new Messanger__c();
        messanger1.Name = mapOfData.get('Name').toString();
        messanger1.Email__c = mapOfData.get('Email').toString();
        messanger1.Message__c = mapOfData.get('Message').toString();
        insert messanger1;
        
        return RestContext.request.requestBody.toString();
        
        
    }
    
}