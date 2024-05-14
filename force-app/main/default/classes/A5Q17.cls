public class A5Q17 {
    public static void meth(){
    List <Aggregateresult> accl = [SELECT COUNT(ID) c, Opportunity.Account.Id ids from opportunitylineitem group by opportunity.account.id];
        List<Account> accll = [select id,name, Total_Quantity__c from account];
        for(Aggregateresult a : accl){
            for(Account acc : accll){
                if(String.valueof(acc.id) == string.valueof(a.get('ids'))){
                     if(math.mod(integer.valueof(a.get('c')),2)==0){
                         acc.Total_Quantity__c =0;
                         update acc;
                         
                
                
            }
                    else{
                        acc.Total_Quantity__c = integer.valueOf(a.get('c'));
                        update acc;
                    }
                }
                
            }
           
        }
    }

}