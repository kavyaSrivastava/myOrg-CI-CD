public class A6Q3 {
    public static void stdpricebook(List<Product2> prl){
        Pricebook2 pb  = [Select id From Pricebook2 Where isStandard = True limit 1];
        System.debug(pb);
        
        List<PricebookEntry> pbel = new List<PricebookEntry>();
        
        for(Product2 pr : prl){
                PricebookEntry pbe = new PricebookEntry();
                pbe.UnitPrice = 1;
                pbe.Pricebook2Id = pb.Id;
                //pbe.UseStandardPrice = false;
                pbe.Product2Id = pr.Id;
                pbe.IsActive = True;
                
                pbel.add(pbe);   
            
        }
        insert pbel;
       
    }
}