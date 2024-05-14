@Istest
public class A5Q7TC {
    @testsetup
    public static void setupmeth(){
        Account acc1 = new Account();
        acc1.Name = 'a1';
        acc1.Working_in__c = 'ASIA; NA';
        acc1.NumberOfEmployees = 2;
        insert acc1;
        
        Account acc2 = new Account();
        acc2.Name = 'a2';
        acc2.Working_in__c = 'ASIA; NA';
        acc2.NumberOfEmployees = 3;
        insert acc2;
    }
    @istest
    public static void meth(){
        System.test.startTest();
       A5Q7.NumberofEmployee();
        System.Test.stopTest();
    }

}