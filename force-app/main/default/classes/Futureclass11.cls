public class Futureclass11 {
    @future
    public static void countcontacts(List<Id> accIds){
        List<Account> accList = [SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id in:accIds];
        for(Account acc : accList){
             acc.Number_of_opp__c = acc.Opportunities.size();
            
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }

}
//Anonymous window code
/*List<Account> accList = [SELECT Id FROM Account LIMIT 50];
List<Id> accIds = new List<Id>();
 
for(Account acc: accList){
    accIds.add(acc.Id);
}
Futureclass11.countcontacts(accIds);*/