public class A6Q6 {
    public static void alertuser(List<Opportunity> opl){
        for(Opportunity opp :opl ){
            if((opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost') &&(opp.TotalOpportunityQuantity== NULL)){
                //if(opp.TotalOpportunityQuantity== NULL){
                    opp.addError('No opportunity line item is in them');
                //}
            }
        }
    }

}