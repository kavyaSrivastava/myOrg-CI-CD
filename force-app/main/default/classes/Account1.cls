public class Account1 {
    //create 5 accounts and then create 3 contacts in each accounts
    public static void CreateAcc(){
        List<Account> accList = new List<Account>();
        for(Integer i = 1;i<=5;i++){
            Account ac =  New Account();
            ac.Name = 'IBM'+i;
            accList.add(ac);
        }
        insert accList;   
        accList = [SELECT Id,Name from Account ORDER BY CreatedDate DESC LIMIT 5];
        Integer j =0;
        List<Contact> conList = new List<Contact>();
        for(Account ac: accList)
        {
            for(Integer i =1;i<=3;i++){
                Contact con = new Contact();
                con.AccountId = ac.Id;
                con.LastName = 'Name'+j;
                j++;
                conList.add(con);
            }
        }
        insert conList;
        
        
    }

}