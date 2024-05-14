public class BST1Q5CLASS {
    public static void totalRevenueGenerated(){
   List<Opportunity> oppl = [SELECT ID, AMOUNT, AccountId from opportunity where StageName = 'Closed won' AND CreatedDate = LAST_n_Days:10 ];
        Set<id> accid = new Set<id> ();
       
        Decimal sum_temp;
        for(Opportunity o: oppl){
            accid.add(o.Accountid);
        }
         List<Account> accl = [SELECT Name,id from ACCOUNT WHERE id in:accid];
       
       List<Account> accl1 = NEW lIST<Account>();
        
        for(Account i :accl){
           sum_temp=0;
           // Integer numberofopp =0;
            for(opportunity o: oppl){
               
                if(i.id == o.Accountid ){
                  // numberofopp++;
                   /* if(o.Amount == Null){
                        o.Amount=0;
                        update o;
                      }*/
                  sum_temp += o.Amount;
                    
                }//System.debug( numberofopp );
                if(sum_temp>0){
                    i.Last_Quarter_Revenue__c = sum_temp;
                    accl1.add(i);
                    }
                else{
                    i.Last_Quarter_Revenue__c = 0;
                    accl1.add(i);
                 } 
               
                
}
            update accl1;
        }
        
    }

}