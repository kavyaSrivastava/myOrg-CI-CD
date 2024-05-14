public class A5Q15 {
    public static void olii(){
        list<Opportunity> oppList=[Select id,(select Unitprice,Quantity from OpportunityLineItems where product2.name='Gandhi ji Chashma') from Opportunity];
       Decimal tp=0;
        for(Opportunity opp: oppList){
            for(OpportunityLineItem oli:opp.OpportunityLineItems){
                tp=oli.unitprice*oli.Quantity;
            }
        }
        System.debug(tp);
            }

}