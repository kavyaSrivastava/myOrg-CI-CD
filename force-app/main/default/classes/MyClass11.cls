public with sharing class MyClass11 {
    @auraEnabled(cacheable =True)
    public static List<Account> getAcc(String text) {
         String str = '%'+text+'%';
                List<Account> accList =[SELECT Id, Name, Website FROM Account WHERE Name LIKE :str];
                return accList;
        
   }
}