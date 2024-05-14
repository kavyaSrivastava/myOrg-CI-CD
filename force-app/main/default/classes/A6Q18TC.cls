@istest
public class A6Q18TC {
    @istest
    public static void meth(){
        Account acc = new Account();
        acc.Name = 'acc1';
        acc.Working_in__c ='ASIA';
        insert acc;
        
        Opportunity op1 = new Opportunity();
        op1.Name ='OP1';
        op1.StageName = 'Closed Won';
        op1.AccountId= acc.id;
        op1.CloseDate = Date.newInstance(2023, 06, 06);
        insert op1;
        
        Opportunity op2 = new Opportunity();
        op2.Name ='OP2';
        op2.StageName = 'Closed Won';
        op2.AccountId= acc.id;
        op2.CloseDate = Date.newInstance(2023, 06, 06);
        insert op2;
        
        Opportunity op3 = new Opportunity();
        op3.Name ='OP3';
        op3.StageName = 'Needs Analysis';
        op3.AccountId= acc.id;
        op3.CloseDate = Date.newInstance(2023, 06, 06);
        //insert op3;
        //op3.StageName = 'Closed Won';
        
        System.test.startTest();
        Database.SaveResult r =  database.insert(op3,false);
        System.test.stopTest();
        
        System.Assert(!r.isSuccess());
  }

}