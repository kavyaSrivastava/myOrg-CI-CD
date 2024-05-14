@istest
public class A5Q3TC {
    @testsetup
    public static void setupmeth(){
        Lead l = new Lead();
        l.Records__c = 'Tenant';
        l.Status = 'Closed - Not Converted';
        l.LastName ='l1';
        l.Company = 'ca';
        insert l;
         l.Status = 'Seller';
        upsert l;
        
    }
    @istest
    public static void meth(){
        System.test.startTest();
        NewLeads.CollectLeads();
        System.test.stopTest();
    }

}