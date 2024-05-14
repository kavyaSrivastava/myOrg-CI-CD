@istest
public class a4q19test2 {
    

/*
    public static void setupd(){
        //List<Account> al = new List<Account>();
        
        Account a = new Account();
        a.Name = 'acc';
        //al.add(a);
       // Account b = new Account();
        //b.Name = 'bcc';
       // al.add(b);
       // Insert al;
        //List<Contact> cl = new Contact();
        
        Contact c = new Contact();
        c.LastName = 'sri';
        c.AccountId = a.Id;
        cl.add(c);
        Contact d = new Contact();
        d.LastName = 'mish';
        d.AccountId = b.Id;
        cl.add(d);
         insert cl;
        List<Case> csList = new List<Case>();
        For(Integer i =1;i<=3;i++){
            Case ca = new Case();
            ca.AccountId = a.Id;
            ca.ContactId = c.Id;
            ca.Status = 'New'+i;
            ca.Origin = 'Phone'+i;
            csList.add(ca);
        }
        insert csList;
    }*/
         @istest
        public static void tmethod(){
            System.test.startTest();
            NewApexCases.Casenew();
            System.test.stopTest();
            List<Case> cset = [SELECT ID FROM Case WHERE Account.Name =:'kavyaaa1' AND Contact.LastName =: 'Srii1'];
            System.assertEquals(cset.size(), 5);
            
        }
        
        
    }