@istest
public class A4Q11Test {
   @testsetup
   public static void setupforq11(){
    Contact c = new Contact();
    c.LastName = 'Analogy';
       c.Email = 'kavya.srivastava@cloudanalogy.com';
       insert c;
        
   }
    @istest
    public static void mailtest(){
        String s = Curremail.userde();
        String e = 'kavya.srivastava@cloudanalogy.com';
        System.assertEquals(e, s);
    }

}