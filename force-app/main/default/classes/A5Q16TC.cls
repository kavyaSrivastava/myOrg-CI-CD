@istest
public class A5Q16TC {
    @testsetup
    public static void setupmeth(){
        Account ac = new Account();
        ac.Name = 'Account1';
        insert ac;
        
        Contact c = new Contact();
        c.LastName = 'LastName';
        c.AccountId = ac.id;
        c.Email = 'kvsrivastava1408@gmail.com';
        insert c;
        
        opportunity op = new opportunity();
        op.Name = 'oppt';
        op.StageName = 'closed won';
        op.AccountId = ac.id;
        op.CloseDate = Date.today().addDays(10);
         insert op;
    }
    @istest
    public static void testmeth(){
        system.test.startTest();
        A5Q16.meth();
        system.test.stopTest();
    }

}