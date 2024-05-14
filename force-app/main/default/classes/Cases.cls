public class Cases {
    public static void cases1(){
        //List<Contact> conlist =[SELECT Id, AccountId FROM Contact Where AccountId != NULL LIMIT 5];
        Account acc = new Account();
        acc.Name = 'kavyaa';
        insert acc;
        Contact c = new Contact();
        c.AccountId = acc.Id;
        c.LastName = 'Sri';
        insert c;
        List<Case> csList = new List<Case>();
        for (Integer i = 1;i<=5;i++){
            Case cs = new Case();
            cs.AccountId = acc.Id;
            cs.ContactId = c.Id;
            cs.Status = 'New22';
            cs.Origin = 'Phone'+i;
            csList.add(cs);
        }
        insert csList;
    }

}