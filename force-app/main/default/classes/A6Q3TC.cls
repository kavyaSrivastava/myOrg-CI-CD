//On Product to setup default Pricebook entry in the “Standard Pricebook” as 1$
@istest
public class A6Q3TC {
    @istest
    public static void meth(){
        Pricebook2 pb = new Pricebook2();
        pb.Name = 'Standard Price Book';
        pb.Id= test.getStandardPricebookId();
        pb.IsActive = true;
        update pb;
        
        Product2 p = new product2();
        p.Name = 'raw';
        p.IsActive = true;
        insert p;
       
        
       
    }

}