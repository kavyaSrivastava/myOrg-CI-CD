public class A5Q9 {
    public static void meth(){
        List<Account> accl = [SELECT Id FROM Account WHERE Working_in__c ='ASIA'];
        List<OPportunityLineItem> oppl = [SELECT Id,quantity, opportunity.AccountId FROM OpportunityLineItem Where OPportunity.AccountId =: accl ];
       Decimal s = 0;
        for(OPportunityLineItem o: oppl){
            s+=o.quantity;
        }
        System.debug(s);
    }
}