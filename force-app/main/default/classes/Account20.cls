public class Account20 {
    public static void insert20(){
        List<Account> accl = new List<Account>();
        
        for(Integer i =0;i<20;i++){
            Account a= new Account();
            a.Name = 'Sandy'+i;
            a.Website = 'wwww.ca.com';
            a.Type = 'Saving A/c';
            a.AccountNumber = '1234'+i;
            a.AnnualRevenue =i+ 0.0;
            accl.add(a);
        }
        insert accl;
        //return accl;
    }

}