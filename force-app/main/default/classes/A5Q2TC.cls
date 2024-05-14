@istest
public class A5Q2TC {
    @testsetup
    public static void meth(){
        Account ac = new Account();
        ac.Name = 'Acc';
        insert ac;
        
        OPportunity opp = new OPportunity();
        opp.Name = 'opp';
        opp.AccountId= ac.Id;
        opp.CloseDate = Date.newInstance(2023, 04, 23);
        opp.StageName = 'Closed Won';
        insert opp;
        
        Product2 p = new Product2();
        p.Name ='Product';
        insert p;
        
        pricebookentry pbe=new pricebookentry();
        pbe.product2id=p.id;
        pbe.IsActive=true;
        pbe.Pricebook2Id=system.test.getStandardPricebookId();
        pbe.UnitPrice=100;
        insert pbe;
        
         OpportunityLineItem oli=new OpportunityLineItem();
        oli.OpportunityId=opp.id;
        oli.Product2Id=p.id;
        oli.Quantity=101;
        oli.TotalPrice=10000;
        oli.PricebookEntryId=pbe.id;
        insert oli;
    }
    @istest
    public static void meth2(){
        test.startTest();
        OpplineItem.opportunityLineItem();
        test.stopTest();
    }

}