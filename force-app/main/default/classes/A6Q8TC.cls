@istest
public class A6Q8TC {
 @istest
    public static void meth(){
        Campaign c = new Campaign();
        c.Name = 'holefest';
        c.Status = 'Planned';
        insert c;
        
        Opportunity op = new Opportunity();
        op.Name = 'Testop';
        op.StageName ='Needs Analysis';
        op.CloseDate = DAte.newInstance(2023, 04, 01);
        op.CampaignId = c.id;
        insert op;
        
        Opportunity op2 = new OPportunity();
        op2.Name = 'Testop2';
        op2.StageName = 'Needs Analysis';
        op2.CloseDate = Date.newInstance(2023, 05, 04);
        op2.CampaignId = c.Id;
        
        OPportunityLineItem opli = new OpportunityLineItem();
        opli.OpportunityId = op2.id;
        
        
        
        c.Status = 'Completed';
        
        System.test.startTest();
        update c;
        SYstem.test.stoptest();
        
        List<OPportunity> oppl = [SELECT ID ,StageName from Opportunity where campaignid =: c.id And HasOpportunityLineItem !=True];
        //List<OPportunity> oppl1 = [SELECT ID ,StageName from Opportunity where campaignid =: c.id And HasOpportunityLineItem !=False];
        
       // System.assertEquals({'Closed Lost','Closed' , oppl[0].stageName);
        
        
    }

}