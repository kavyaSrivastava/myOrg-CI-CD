public class Containing_a {
  public static List<product2> productsHavingA(){
        List<Product2> prList = [SELECT Id, Name FROM Product2 WHERE Description LIKE '%a%'];
       return(prList);
    }
}