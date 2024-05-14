public class BST1Q1 {
    public static void meth(){
       // List<Opportunity> oppAids =[SELECT AccountId FROM Opportunity];
       
        
        List<Opportunity> oppOids = [SELECT Id,AccountId , StageName FROM Opportunity where AccountId!=Null];
         Set<Id> accset = new Set<Id>();
        for(Opportunity op: oppOids){
            accset.add(op.AccountId);
        }
        List<Account> accl= [SELECT Id,Name from account where id in: accset];
        
        For(Account a : accl){
              integer i=0;
            For(Opportunity o :oppOids){
              
                if(a.Id == o.Accountid ){
                    if(o.StageName != 'Closed Won' || o.StageName != 'Closed Lost'){
                        i++;
                    }
                }
                
            }
            if(i>0){
                a.No_open_opps__c = true;
            }
            update a;
        }
    }

}