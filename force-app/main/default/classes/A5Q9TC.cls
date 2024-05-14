@istest
public class A5Q9TC {
    @testsetup
    public static void setuptest(){
        Account acc = new Account();
        acc.Name = 'Kavya';
        acc.Working_in__c = 'ASIA';
        insert acc;
        Opportunity op = new OPportunity();
        op.Name = 'op';
        op.AccountId = acc.id;
        op.CloseDate = Date.newInstance(2023, 12, 04);
        op.StageName = 'Closed Won';
        insert op;
        
        Product2 p = new Product2();
        p.name = 'p';
        p.IsActive = true;
        
         insert p;
        
        pricebookentry pbe=new pricebookentry();
        pbe.product2id=p.id;
        pbe.IsActive=true;
        pbe.Pricebook2Id=system.test.getStandardPricebookId();
        pbe.UnitPrice=100;
        insert pbe;
        
        OpportunityLineItem opl = new OPportunityLineItem();
        opl.PricebookEntryId = pbe.Id;
        opl.Product2Id = p.Id;
        opl.Quantity =10;
        opl.OpportunityId =OP.Id;
        opl.TotalPrice = 1000;
        insert opl;
        
    }
    @istest
    public static void meth(){
        System.Test.startTest();
        A5Q9.meth();
        System.test.stopTest();
    }

}