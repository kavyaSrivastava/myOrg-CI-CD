@istest
public class A6Q10TC {
    @istest
    public static void main(){
        Opportunity op = new opportunity();
        op.Name = 'testop';
        op.StageName = 'Closed Won';
        op.CloseDate = Date.newInstance(2023, 06, 02);
        insert op;
        
        product2 p = new product2();
        p.name='TestBall';
        p.IsActive=true;
        insert p;
        
        pricebookentry pbe = new pricebookentry();   
        
        pbe.Pricebook2Id=test.getStandardPricebookId();
        pbe.Product2Id=p.Id;
        pbe.UnitPrice=500;
        pbe.UseStandardPrice=False;
        pbe.IsActive=True;
        insert pbe;
        
        
        list<opportunitylineitem> oli= new list<opportunitylineitem>();
        for(integer i=0;i<2;i++)
        {
            Opportunitylineitem olii = new opportunitylineitem();
            olii.OpportunityId = op.Id;
            olii.Product2Id=p.Id;
            olii.Quantity=100;
            olii.PricebookEntryId=pbe.Id;
            olii.TotalPrice=1000;
            oli.add(olii);
            
        }
        insert oli;
        Opportunitylineitem olii = new opportunitylineitem();
        olii.OpportunityId = op.Id;
        olii.Product2Id=p.Id;
        olii.Quantity=100;
        olii.PricebookEntryId=pbe.Id;
        olii.TotalPrice=1000;
       
	        
        test.startTest();
       	database.SaveResult r= database.insert(olii,false);
        test.stopTest();
        system.assert(!r.isSuccess());
    }
}