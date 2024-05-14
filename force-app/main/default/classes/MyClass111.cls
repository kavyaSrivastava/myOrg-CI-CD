public class MyClass111 {
    
    @auraEnabled(cacheable =True)
    public static List<Account> getAcc() {
       //  String str = '%'+text+'%';
       String str = '%Cloud%';
                List<Account> accList =[SELECT Id, Name, Website FROM Account WHERE Name LIKE :str];
                return accList;
        
   }
}