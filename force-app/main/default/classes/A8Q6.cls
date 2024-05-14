public with sharing class A8Q6 {
    @AuraEnabled
    public static List<Account> methodName1(){
        try {
            List<Account> accl = [SELECT Id,Name FROM Account ];
            return accl;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static List<Contact> methodName2(String accId){
        
            List<Contact> conl = [SELECT AccountId,Id,LastName, Email FROM Contact WHERE AccountId =: accId ] ;
            return conl;
            
        
    }
    @AuraEnabled
    public static List<Opportunity> methodName3(String accId){
       
            List<Opportunity> oppl = [SELECT AccountId,Id,Name, StageName FROM Opportunity WHERE AccountId =: accId];
            return oppl;

    }
    
   
}