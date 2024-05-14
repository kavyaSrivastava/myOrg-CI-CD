@istest
public class Brainstorming2Test {
 @istest
    public static void testmeth(){
        List<Agent__c> al = new List<Agent__c>();
        Agent__c a = new Agent__c();
        a.Current_Work__c=0;
        a.Workload__c=5;
        a.Email__c='kvsrivastava1408@gmail.com';
        al.add(a);
         
        Agent__c a2 = new Agent__c();
        a2.Current_Work__c=0;
        a2.Workload__c = 1;
         a2.Email__c='kvsrivastava1408@gmail.com';
        al.add(a2);
        
        insert al;
        
        Case c = new Case();
        c.Status ='New';
        c.Origin ='Phone';
        System.test.startTest();
        insert c;
        System.test.stopTest();
        
    }
}