public with sharing class MyClass22 {
    @auraEnabled(cacheable =True)
    public static List<Account> getAcc2(String text) {
         String str = '%'+text+'%';
                List<Account> accList =[SELECT Id, Name, Website FROM Account WHERE Name LIKE :str];
                return accList;
        
   }
}