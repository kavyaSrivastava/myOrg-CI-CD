public class Pricebook {
    public static void product(){
        Product2 pc = new Product2 ();
        pc.Name = 'Shirt13';
        insert pc;
    }
    public static void priceBook(){
        
        Pricebook2 pb = new Pricebook2();
        pb.Name = 'HoliSaleNew12';
        insert pb;
    }
    public static void createPricebookEntry(){
       Pricebook2 pb = [SELECT Name FROM Pricebook2 where Name='HoliSaleNew12'];
        List<Product2> prolist = [SELECT Name FROM Product2 WHERE Name= 'Shirt13'];
        List<PricebookEntry> pbeList = new List<PricebookEntry>();
        for(Product2 p: proList){
            PricebookEntry pbe = new PricebookEntry();
            pbe.UnitPrice=12;
            pbe.Pricebook2Id=pb.Id;
            pbe.Product2Id = p.Id;
            pbe.UseStandardPrice= False;
            pbeList.add(pbe);
        }
        insert pbeList;
    }

}