public class NewApexCases {
    public static void Casenew(){
 Account acc = new Account();
        acc.Name = 'kavyaaa1';
        Contact c = new Contact();
        c.AccountId = acc.Id;
        c.LastName = 'Srii1';
        List<Case> csList = new List<Case>();
        for (Integer i = 1;i<=5;i++){
            Case cs = new Case();
            cs.AccountId = acc.Id;
            cs.ContactId = c.Id;
            cs.Status = 'New'+i;
            cs.Origin = 'Phone'+i;
            csList.add(cs);
        }
        insert csList;
        System.debug(csList.size());
}

}