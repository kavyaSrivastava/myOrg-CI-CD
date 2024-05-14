/*1. Create a Dynamic Form where we can insert Account and Contact records.
2. Show Success and Error Message in model.
3. From with add in Account and Contact List view page via button.
4. New Task: Use 2 JS Files in same LWC component and pass data.*/


public class TrainingClass {
    @AuraEnabled
    public static Account insertAccount(String str, Date dt, DateTime dttm, Boolean b){
        //List<Account> accList = new List<Account>();
         Account acc = new Account();
        acc.Name = str;
        acc.Datee__c = dt;
        acc.Datetimee__c = dttm;
        acc.IsActive__c = b;
        //accList.add(acc);
        
          insert acc;
          return acc;
          
        
       
        
    }
     
}