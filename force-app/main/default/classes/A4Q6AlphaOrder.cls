@istest
public class A4Q6AlphaOrder {
    @testsetup
    public static void setupaccounts(){
       List<Account> al = new List<Account>();
  Account ac = new Account();
      ac.Name = 'aa';
        ac.Website = 'www.ww.com';
        al.add(ac);
        Account c = new Account();
        c.Name = 'bb';
        c.Website = 'www.bb.com';
        al.add(c);
        Account f = new Account();
        f.name = 'ff';
        f.Website = 'www.ff.com';
        al.add(f);
        insert(al);
    }
    
    @istest
    public static void reverseordertestmethod(){
      List<Account>a=  AlphaOrder.AlphabeticalOrder();
        List<Account>b = [SELECT Name FROM Account ORDER BY Name ASC];
        System.assertEquals(b, a);
     }
}