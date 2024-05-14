public class BST1Q5SCRIPT {
    public static void meth(){
            
        Date startDate = Date.today().addMonths(-3);
        Date endDate = Date.today();
        List<Opportunity> oppList = [select AccountId from Opportunity where StageName = 'Closed Won' and CloseDate >=:startDate and CloseDate <=:endDate];
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : oppList) {
            accountIds.add(opp.AccountId);
        }
        
        List<Account> accList = [SELECT Id, Last_Quarter_Revenue__c, (SELECT Amount FROM Opportunities WHERE StageName = 'Closed Won' AND CloseDate >= :startDate AND CloseDate <= :endDate) FROM Account WHERE Id IN :accountIds];
        for (Account acc : accList) {
            Decimal totalRevenue = 0;
            for (Opportunity opp : acc.Opportunities) {
                totalRevenue += opp.Amount;
            }
            acc.Last_Quarter_Revenue__c = totalRevenue;
        }
        update accList;
    }
}