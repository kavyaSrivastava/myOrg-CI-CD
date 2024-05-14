@istest
public class A5Q11TC {
    @testsetup
    public static void meth(){
        Account acc = new Account ();
        acc.Name = 'Acc';
        insert acc;
        List<Opportunity> opl = new List<Opportunity>();
        for(integer i =1;i<=12;i++){
            Opportunity op = new Opportunity();
            op.AccountId = acc.Id;
            op.Name = 'Opp'+i;
            op.StageName = 'Closed Won';
            op.CloseDate= Date.newInstance(2023, 02, 28);
            opl.add(op);
        }
        insert opl;
    }
    @istest
    public static void meth1(){
        System.test.startTest();
        A5Q11.getallAcc();
        System.test.stopTest();
        
        
    }

}