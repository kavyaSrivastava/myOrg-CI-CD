@istest
public class A6Q1TC {
   @istest
    public static void meth(){
        Account ac = new account();
        ac.Name ='kavyz';
        ac.NumberOfEmployees = 5;
        system.test.starttest();
        insert ac;
        system.test.stopTest();
        LIst<Contact> conl = [select id from contact where Accountid =: ac.id ];
        system.assertequals( 5, conl.size());
        
    }

}