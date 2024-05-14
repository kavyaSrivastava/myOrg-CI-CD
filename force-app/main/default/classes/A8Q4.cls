public with sharing class A8Q4 {
    @AuraEnabled
    public static List<Account> methodName(String str){
        try {
         String s='%'+str+'%';
         List<Account> accl = [SELECT Id, Name FROM Account WHERE Name LIKE:s];
            return accl;

        } 
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static List<Account> methodName1(){
        
            List<Account> accl =[SELECT Id,Name FROM Account];
            return accl;
       
    }
    @AuraEnabled
    public static List<Account> methodName2(String str){

        try {
            String s='%'+str+'%';
            List<Account> accl =[SELECT Id,Name FROM Account WHERE Name Like:s ORDER BY Name ASC];
            return accl;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static List<Account> methodName3(String str){
        try {
            String s ='%'+str+'%';
            List<Account> accl = [SELECT Id,Name FROM Account WHERE Name Like: s ORDER BY Name DESC];
            return accl;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}