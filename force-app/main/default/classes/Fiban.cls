public class Fiban {
    public static void pattern(Integer n){
        Integer a=1;
        Integer b =1;
        List<Integer> l = new List<Integer>();
        l.add(a);
        l.add(b);
        for(Integer i =0;i<n-2; i++){    
        Integer c = a+b;
            l.add(c);
            a=b;
            b=c;
  }
       
  }
}