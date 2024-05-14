public class FII {
    public static void fibo(Integer n){
        Integer a=-1, b=1, c, i;
        
        List<Integer> fib = new List <Integer> ();
        for(i=1;i<=n;i++){
            c=a+b;
            fib.add(c);
            a=b;
                b=c;
        }
        System.debug(fib);
    }

}