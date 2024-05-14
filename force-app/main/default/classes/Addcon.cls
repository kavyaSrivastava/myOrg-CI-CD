public class Addcon {
    public static void Addconm(){
        List<Account> accList = new List<Account>();
        accList = [SELECT id,Name FROM Account Limit 10];
        Integer i=0;
        List<Contact> conList =  new List<Contact>();
        for(Account acc: accList){
            i++;
            Contact con = new Contact();
            con.AccountId= acc.Id;
            con.LastName ='Kumar'+i;
            con.FirstName = 'Amit'+i;
            conList.add(con);
            
        }
          if(!conList.isEmpty())
            insert conList;
        
    }

}