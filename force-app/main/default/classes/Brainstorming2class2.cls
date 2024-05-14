public with sharing class Brainstorming2class2 {
    @AuraEnabled
    public static String methodName(){
        try {
            List<Case> al = [Select Id, CreatedDate, AgentId__c From Case Where CreatedDate >: System.Now().addHours(-1) AND AgentId__c!= NULL];
            if(al.size()>1){
                return 'You have new case';
            }
            return 'You have no new case';

            

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}