@istest
public class A6Q15TC {
    @istest
    public static void meth(){
      
        Account ac= new Account();
        ac.Name='AccTest';
        ac.Allow_Multiple__c=false;
        insert ac;
        
        Contact con = new Contact();
        con.LastName='conTest';
        con.AccountId=ac.id;
        insert ac;
        
        Contact con1 = new Contact();
        con1.LastName='ontest';
        con1.AccountId=ac.id;
        system.test.startTest();
        database.SaveResult r= database.insert(con1,false);
        system.test.stopTest();
        
        system.assert(!r.isSuccess());
    }
}