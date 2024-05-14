public class Creating20opp {
    public static void createAcc(){
        Account acc = new Account();
        acc.Name = 'Mehta1';
}
    public static void createopp(){
 List<Account> accl= [SELECT Name,Id from account Order by CreatedDate DESC Limit 1];
        for(Integer i =1;i<=20; i++){
            Opportunity opp = new Opportunity();
                opp.StageName = 'Closed Won';
                opp.AccountId = accl[0].Id;
                opp.CloseDate = Date.newInstance(2023, 02, 21);
            
        }
    }
}