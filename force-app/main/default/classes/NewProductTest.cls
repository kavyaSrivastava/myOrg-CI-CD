@istest
public class NewProductTest {
    @testsetup
    
         public static void  priceBookEntry(){
        List<Product2> prList = new List<Product2>();
        for(Integer i = 1; i <= 10 ; i++){
            Product2 pr = new Product2();
        	pr.Name = 'newproduct' + i;
            prList.add(pr);
        }
             //@testsetup
        insert prList;
        Pricebook2 pb = new PriceBook2();
        pb.Name = 'Algo Price book';
        insert pb;
    }
 
    public static void method1(){
        List<Product2> proList = [SELECT Name FROM Product2 ORDER BY CreatedDate DESC LIMIT 10];
        Pricebook2 pb=[SELECT Name From Pricebook2 where Name='Algo Price book'];
        List<PricebookEntry> pbeList = new List<PricebookEntry>();
        for(Product2 p: proList){
            PricebookEntry pbe = new PricebookEntry();
            pbe.UnitPrice = 1000;
            pbe.Product2Id = p.Id;
            pbe.Pricebook2Id = pb.Id;
            pbe.UseStandardPrice = False;
            pbeList.add(pbe);
        }
        insert pbeList;
    }

}