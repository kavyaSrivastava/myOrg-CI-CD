public class CreateAccountContact {
    public static void createAccCon(){
        Account acc = New Account();
        acc.Name= 'Cloud Analogy';
        acc.Website='www.ca.com';
        insert acc;
        List<contact>Conlist = new List<Contact>();
        for(Integer i =1; i<=5;i++){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.lastname = 'Kumar'+i;
            con.firstName = 'Amit'+i;
            conList.add(con);
        }
        if(!conList.isEmpty())
            insert conList;
    }
}