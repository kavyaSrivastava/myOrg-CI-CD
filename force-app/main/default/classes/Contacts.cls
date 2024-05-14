public class Contacts {
        public static void cont(){
        List<Contact> conList = new List<Contact>();
        
        try{
        List<Account> accList =[SELECT id, name FROM Account LIMIT 10];
        Integer i = 0;
        for(Account acc : accList){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = 'Srivastava' + i;
            conList.add(con);
            i++;
        }
            insert conList;
        }
        catch(DMLexception e){
            system.debug(e.getMessage());
        }
        
    }


}