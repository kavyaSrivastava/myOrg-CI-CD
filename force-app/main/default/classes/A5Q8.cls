public class A5Q8 {
    public static void morethan2oli(){
        List<OpportunityLineItem> olist = [SELECT Opportunity.Name FROM OpportunityLineItem];
        Map<String,Integer> map1 = new Map<String,Integer>();
        for(OpportunityLineItem o : olist){
            if(map1.containsKey(o.Opportunity.Name)){
                map1.put(o.Opportunity.Name,map1.get(o.Opportunity.Name)+1);
            }
            else{
                map1.put(o.Opportunity.Name,1);
            }
        } 
        List<String> opp = new List<String>();
         for(String key: map1.keySet()){
            if(map1.get(key)>2){
                //System.debug(key);
                opp.add(key);
           }
         }
        //System.debug(opp);
         List<Opportunity> accl = [SELECT Id,Account.Name FROM Opportunity WHERE Name in:opp];
            // System.debug(accl);
        for(Opportunity op: accl){
            System.debug(op.account.name);
        }             
 

    }}