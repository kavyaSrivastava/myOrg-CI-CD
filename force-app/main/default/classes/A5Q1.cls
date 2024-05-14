@istest
public class A5Q1 {
    @testsetup
    public static void setupmeth(){
        Account ac = new Account();
        ac.Name = 'Acc';
        insert ac;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'opp';
        opp.StageName = 'CLosed Won';
        opp.CloseDate = Date.newInstance(2023, 04, 04);
        opp.AccountId = ac.Id;
        insert opp;
        
    }
    @istest
    public static void meth(){
        test.startTest();
        Clone.cl();
        test.stopTest();
    }
    

}