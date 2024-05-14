@istest
public class A4Q14Containing_a {
    @testsetup
    public static void setupfora(){
        Product2 p = new Product2();
        List<Product2> plist = new List<Product2>();
        p.Name = 'pc';
        p.Description = 'mnaor';
        plist.add(p);
        
        product2 x = new Product2();
        x.Name = 'pc2';
        x.Description = 'xxxx';
        plist.add(x);
        insert plist;
    }
    @istest
    public static void testcl(){
        List<product2> pp = Containing_a.productsHavingA();
        List<product2> px = [SELECT Id, Name FROM Product2 WHERE Description LIKE '%a%'];
        System.assertEquals(px, pp);
    }

}