//WAP to get all Account names where associated opportunity product quantity is greater than 100 and opportunity
    // stage is "closed won"
 public class OpplineItem {
     public static void opportunityLineItem(){
         List<OpportunityLineItem> oliList = [SELECT Id,Opportunity.AccountId FROM OpportunityLineItem WHERE Quantity>100 AND Opportunity.stageName='Closed won'];
         Set<Id> accId = new Set<Id>();
         for(OpportunityLineItem oli: oliList){
             accId.add(oli.Opportunity.AccountId);
                 }
         List<Account> accList = [SELECT Id,Name from Account where id in : accId];
         for(Account ac : accList){
             System.debug(ac.Name);
         }
         }
     }