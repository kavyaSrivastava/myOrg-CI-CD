public class A6Q8 {
    public static void method1(List<Campaign> campl){
        List<Id> campid = new List<Id> ();
       
        List<OpportunityLineItem> oppl = [SELECT ID ,Opportunity.Id,Opportunity.Campaign.id FROM OpportunityLineItem ];
        List<Opportunity> opp = [SELECT Id, HasOpportunityLineItem, Campaign.id FROM Opportunity];
        For(Campaign c : campl){
            for(Opportunity o: opp){
                if(c.Id == o.Campaign.id){
                    
                   if(o.HasOpportunityLineItem ==true){
                        o.StageName = 'Closed Won';
                        
                    }
                    else
                    {
                        o.StageName = 'Closed Lost';
                    }
                }
            }
            update opp;
            }
    }

}