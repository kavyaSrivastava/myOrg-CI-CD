public class Ftoc {
    public static Decimal fartoc(Decimal n){
        Decimal x= (n - 32)* 5/9;
        //added to check jenkins
        return x.setScale(2);
    }
}