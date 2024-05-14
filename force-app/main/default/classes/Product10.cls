public class Product10 {
    public static void creating10product(){
        List <Product2> p = new List<Product2>();
        for(Integer i=1;i<11;i++){
            Product2 po = new Product2();
            po.Name = 'Bat'+i;
            po.Description = 'New'+i ;
            po.Family= 'None';
            p.add(po);
}
        insert p;
        
}

}