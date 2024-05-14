public class A6Q18HC {
    public static void meth(List<Opportunity> oppl){
        for(opportunity o: oppl){
            Account a = [SELECT NAME, Working_in__c from Account where id =: o.AccountId];
            
            if(a.Working_in__c=='ASIA'){
                List<Account> acc  = [SELECT Id,Name, (SELECT Id,Name from Opportunities ) from Account WHERE Id =: o.AccountId];
                if(acc[0].Opportunities.size() >=2){
                    o.adderror('cant add');
                }
            }
        }
    }

}