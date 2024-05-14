public class Creat20opportunity {
    public static void createAcc(){
        Account acc = new Account();
        acc.Name = 'Mehta1';
        insert acc;
}
    public static void createopp(){
 List<Account> accl= [SELECT Name,Id from account Order by CreatedDate DESC Limit 1];
        List<Opportunity> opl = new List<Opportunity>();
        for(Integer i =1;i<=20; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'xml'+i;
                opp.StageName = 'Closed Won';
                opp.AccountId = accl[0].Id;
                opp.CloseDate = Date.newInstance(2023, 02, 21);
            opl.add(opp);
      }
        insert opl;
    }
}