public with sharing class A8Q4C {
   
        @AuraEnabled
        public static List<Account> getsearchAccount(String Name)
        {
            String str='%'+Name+'%';
            return [SELECT Name,id,Website,Site FROM Account Where Name LIKE:str];
        }
    
        @AuraEnabled
        public static List<Account> getAccount()
        {
            
            return [SELECT Name,id,Site,Website FROM Account LIMIT 10];
        }
        @AuraEnabled
       public static List<Account> sortedaccounts()
       {
        return [SELECT Name,ID,Website,Site from Account ORDER by Name ASC];
       }
       @AuraEnabled
       public static List<Account> descsortedaccounts()
       {
        return [SELECT Name,ID,Website,Site from Account ORDER by Name DESC];
       }
    
}