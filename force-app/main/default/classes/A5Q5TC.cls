@istest
public class A5Q5TC {
    @testsetup
    public static void setupmeth(){
        Account ac = new Account();
        ac.Name = 'acc';
        insert ac;
        
        Opportunity op = new Opportunity();
        op.AccountId = ac.id;
        op.Name = 'op1';
        op.CloseDate = Date.newInstance(2023, 04, 01);
        op.StageName = 'Closed Won';
        insert op;
        
         Opportunity op2 = new Opportunity();
        op2.AccountId = ac.id;
        op2.Name = 'op2';
        op2.CloseDate = Date.newInstance(2023, 04, 01);
        op2.StageName = 'Closed Won';
        insert op2;
        
         Opportunity op1 = new Opportunity();
        op1.AccountId = ac.id;
        op1.Name = 'opp1';
        op1.CloseDate = Date.newInstance(2023, 04, 01);
        op1.StageName = 'Closed Won';
        insert op1;
        
        
    }
    @istest
    public static void testmeth(){
        System.test.startTest();
        A5Q5.meth();
        System.test.stopTest();
    }

}