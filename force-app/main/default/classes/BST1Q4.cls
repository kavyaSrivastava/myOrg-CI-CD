public class BST1Q4 {
 
    public static void avgTime(){
        Long timeInHours;
        Long timeInMilliseconds = 0;
        Long avgTime = 0;
        List<Opportunity> opList = [SELECT Name, AccountId, CloseDate, CreatedDate FROM Opportunity WHERE CloseDate != NULL];
        Set<Id> acId = new Set<Id>();
        for(Opportunity o : opList){
            acId.add(o.AccountId);
        }
        List<Account> acList = [SELECT Id FROM Account WHERE Id IN : acId];
        for(Account a : acList){
        	for(Opportunity o : opList){
                if(o.AccountId == a.Id){
                	DateTime createdDateOpp = o.createdDate;
            		DateTime closeDateOpp = o.closeDate;
                    timeInMilliseconds = timeInMilliseconds + (closeDateOpp.getTime() - createdDateOpp.getTime());
                	timeInHours = timeInMilliseconds/(1000*60*60);
                }
            }
            List<Opportunity> opList1 = [SELECT Id FROM Opportunity WHERE AccountId =:a.Id];
        if(opList1.size() > 0){
            avgTime = timeInHours/opList1.size();
        }
        a.Avg_Close_Time__c = avgTime;
            update a;
        }
        //update acList;
    }
    
}