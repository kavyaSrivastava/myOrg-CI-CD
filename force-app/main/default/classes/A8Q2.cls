public with sharing class A8Q2 {
    @AuraEnabled
    public static Integer methodName(String name , String pas){
        try {
            List<Contact> conl = [SELECT Id FROM Contact WHERE Usern__c LIKE:name AND Pass__c LIKE: pas];
            if(conl.size()>=1){
                return 1;
            }
            else {
                return 0;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}