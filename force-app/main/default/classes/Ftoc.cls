public class Ftoc {
    public static Decimal fartoc(Decimal n){
        Decimal x= (n - 32)* 5/9;
        return x.setScale(2);
    }
}