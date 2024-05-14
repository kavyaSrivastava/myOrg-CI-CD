@isTest
public class DeletesmlTest {
    @testsetup
    public static void setupstatement(){
        Account acc = new Account();
        acc.Name= 'ZCloud Analogy1';
        acc.Website='www.ca.com';
        insert acc;
        Contact con = new Contact();
        con.AccountId = acc.Id;
            con.lastname = 'Kumar';
            con.firstName = 'Anurag';
        insert con;
    }
    @isTest
    public static void statementTest(){
        System.Test.startTest();
        Deletesml.statement();
        System.Test.stopTest();
        List<Contact> conList = [SELECT AccountId FROM Contact where Account.Name Like 'z%'];
        System.assertEquals(0,conList.size());
        //System.assertEquals(conList[0].IsDeleted, true);
    }

}