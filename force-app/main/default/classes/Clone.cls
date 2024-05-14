public class Clone {
    public static void cl(){
        Opportunity opp1 = [SELECT Id, Name, StageName,CloseDate, (SELECT Id FROM OpportunitylineItems) FROM Opportunity LIMIT 1];
        Opportunity opp2 = opp1.clone();
        opp2.CLoseDate = opp1.CloseDate.addDays(30);
        opp2.Name = opp1.Name + 'CLone';
        insert opp2;
 }

}