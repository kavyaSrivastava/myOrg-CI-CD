public class Reverse {
    public static Integer num(Integer n){
        Integer a=n;
        Integer s=0;
        Integer r =0;
        
        while(n>0){
            r= Math.mod(n, 10) ;
            s=s*10+r;
            n=n/10;
        }
        return(s);
    }

}