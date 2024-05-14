@istest
public class A6Q16TC {
    @istest
    public static void meth(){
          Pricebook2 pb = new PriceBook2();
          pb.Name = 'ASIA';
          insert pb;
        
          Account acc = new Account();
          acc.Name = 'test';
          insert acc;
        
        Opportunity opp =new Opportunity();
        //opp.PriceBook2Id = pb.id;
        opp.AccountId = acc.id;
        opp.Name = 'op1';
        opp.StageName = 'Closed Won';
        opp.CloseDate = date.newInstance(2023, 05, 02);
        insert opp;
        
        opp.Pricebook2Id = pb.id;
        System.test.startTest();
        Database.SaveResult r = DataBase.update(opp,false);
        System.Test.stopTest();
        
        System.Assert(!r.isSuccess());
        
    }

}