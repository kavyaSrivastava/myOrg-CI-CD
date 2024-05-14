public class ProductHandlerClass {
    public static void productHandle(List<Product2> ProList){
        List<Pricebook2> pbList = [SELECT Id, Name from Pricebook2 WHERE IsStandard=True];
        List<PriceBookEntry> pbeList = new List<PriceBookEntry>();
        for(Product2 pro: ProList){
            for(Pricebook2 pb: pbList)
            {
                PriceBookEntry pbe = new PriceBookEntry();
                pbe.UnitPrice = 1;
                pbe.pricebook2Id = pb.Id;
                pbe.Product2Id = pro.Id;
                pbe.UseStandardPrice = False;
                pbe.IsActive = True;
                pbeList.add(pbe);
                
            }
        }
        insert pbeList;
    }

}