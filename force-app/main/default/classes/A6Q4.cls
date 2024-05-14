public class A6Q4 {
    public static void  accupdate(List<Contact> cl){
        List<Account> acl = [SELECT Name, Id  FROM Account];
        
        for(Contact con : cl){
            for(Account ac : acl){
                if(ac.Id== con.AccountId){
                    ac.Name = ac.Name.remove(con.LastName);
                }
            }
            update acl;
        }
    }
}