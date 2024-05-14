public with sharing class Project1ShowExpertise {
    @AuraEnabled
    public static List<Uni_Professor__c> methodName(){
        try {
           List<Uni_Professor__c> pl=[SELECT Id, Name, Eperties__c From Uni_Professor__c ];
            return pl;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}