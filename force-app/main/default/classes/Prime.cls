public class Prime {
    public static void primee(){
        for(Integer i=5;i<=500;i++){
            if(isprime(i)){
                System.debug(i);
            }
        }
    }
    public static Boolean isprime(Integer i){
        for(Integer j=2;j*j<=i;j++){
            if(math.mod(i,j)==0){
                return false;
            }
        }
        return true;
    }

}