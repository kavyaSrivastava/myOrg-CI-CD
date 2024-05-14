public with sharing class fetchAccount {
    @AuraEnabled
    public static List<Account> methodName(){

        try {
            // String accName = '%'+str+'%';
            List<Account> accList = [SELECT Id, Name FROM Account ];
            return acclist;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}